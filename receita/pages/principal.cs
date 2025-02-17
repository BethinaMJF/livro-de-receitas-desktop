using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using receita.models;
using static System.Net.Mime.MediaTypeNames;

namespace receita.pages
{
    public partial class principal : Form2
    {
        dbLivroReceitaEntities ct = new dbLivroReceitaEntities();
        public principal()
        {
            InitializeComponent();
            recarregar();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            button2.Enabled = true;
            flowLayoutPanel1.Controls.Clear();
            var receitaAleatoria = new Random().Next(1, 10);
            flowLayoutPanel1.Controls.Add(new models.receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == receitaAleatoria)));
        }
        private void button2_Click(object sender, EventArgs e)
        {
            button2.Enabled = false;
            flowLayoutPanel1.Controls.Clear();
            recarregar();
        }

        public void recarregar()
        {
            flowLayoutPanel1.Controls.Clear();
            foreach (var item in ct.UsuarioReceita)
            {
                flowLayoutPanel1.Controls.Add(new receitaControl(item));
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // filtro com todas as receitas
            flowLayoutPanel1.Controls.Clear();
            filtro(ct.UsuarioReceita.ToList());
        }

        public void filtro(List<UsuarioReceita> receitasPesquisa)
        {
            flowLayoutPanel1.Controls.Clear();
            List<UsuarioReceita> listaOrdenada = receitasPesquisa;

            if (comboBox1.SelectedIndex == 1) // Ordena por ingredientes apreciados/evitados
            {
                var apreciados = ct.Perfil.Where(u => u.idUsuario == dados.atual.id && u.status.Value).Select(u => u.idIngrediente);
                var evitados = ct.Perfil.Where(u => u.idUsuario == dados.atual.id && !u.status.Value).Select(u => u.idIngrediente);

                listaOrdenada = receitasPesquisa
                    .Select(u => new
                    {
                        Receita = u,
                        bons = ct.IngredientesReceita.Count(a => a.ReceitaID == u.id && apreciados.Contains(a.IngredienteID)),
                        ruins = ct.IngredientesReceita.Count(a => a.ReceitaID == u.id && evitados.Contains(a.IngredienteID))
                    })
                    .OrderByDescending(u => u.bons)
                    .ThenBy(u => u.ruins)
                    .Select(u => u.Receita)
                    .ToList();
            }
            else if (comboBox1.SelectedIndex == 2) // Ordena pelo tempo de preparo
            {
                listaOrdenada = receitasPesquisa.OrderBy(u => u.TempoMinutos).ToList();
            }
            else if (comboBox1.SelectedIndex == 3) // Ordena pela quantidade de ingredientes
            {
                listaOrdenada = receitasPesquisa
                    .OrderBy(u => ct.IngredientesReceita.Count(a => a.ReceitaID == u.id))
                    .ToList();
            }
            
            foreach (var item in listaOrdenada)
            {
                flowLayoutPanel1.Controls.Add(new receitaControl(item));
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            flowLayoutPanel1.Controls.Clear();

            if (string.IsNullOrEmpty(textBox1.Text))
            {
                foreach (var item in ct.UsuarioReceita)
                {
                    flowLayoutPanel1.Controls.Add(new receitaControl(item));
                }
            }

            //receitas por nome
            var nome = ct.UsuarioReceita.Where(u => u.NomeReceita.ToString().ToLower().Contains(textBox1.Text.ToLower())).ToList();

            //receitas pela classificacao
            var classificacao = ct.UsuarioReceita.Select(u =>
                new
                {
                    u.id,
                    nota = ct.NotaReceita
                        .Where(a => a.ReceitaID == u.id)
                        .DefaultIfEmpty() 
                        .Average(f => (double?)f.nota.Value ?? 0)
                })
                .Where(u => u.nota.ToString().Contains(textBox1.Text))
                .ToList();

            // receitas pelo ingrediente
            var ingredientes = ct.Ingrediente.Where(u => u.nome.ToLower().Contains(textBox1.Text.ToLower())).Select(u => u.ID);
            var receitasIng = ct.UsuarioReceita
                                .Where(u => ct.IngredientesReceita
                                             .Any(a => a.ReceitaID == u.id &&
                                ingredientes.Contains(((int)a.IngredienteID.Value))
                                ));


            // Combina os resultados da pesquisa (textBox) e organiza de acordo com a seleção do ComboBox
            var receitasPesquisa = new List<UsuarioReceita>();

            // Evitar erros de lista vazia
            if (receitasIng.Any()) { receitasPesquisa.AddRange(receitasIng); }

            if (nome.Any()) { receitasPesquisa.AddRange(nome); }

            if (classificacao.Any())
                receitasPesquisa.AddRange(classificacao.Select(u => ct.UsuarioReceita.FirstOrDefault(a => a.id == u.id)));

            receitasPesquisa = receitasPesquisa.Distinct().ToList();
            filtro(receitasPesquisa); 

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Funcionalidade de Pesquisa e Ordenação:\n\n" +
    "1. Digite no campo de pesquisa para buscar receitas pelo nome, classificação (nota) ou ingredientes.\n" +
    "2. Se o campo de pesquisa estiver vazio, todas as receitas serão exibidas.\n\n" +
    "Ordenação pelo ComboBox:\n" +
    "- Opção 0: Nenhuma ordenação.\n" +
    "- Opção 1: Ordena com base nos ingredientes apreciados e evitados do usuário.\n" +
    "- Opção 2: Ordena pelo tempo de preparo (do menor para o maior).\n" +
    "- Opção 3: Ordena pela quantidade de ingredientes (do menor para o maior).\n\n" +
    "⚠ Limitações:\n" +
    "- Quando uma opção do ComboBox é selecionada, a ordenação é aplicada a TODAS as receitas, sem considerar a pesquisa.\n" +
    "- Ao digitar no campo de pesquisa, e se uma opção do ComboBox estiver selecionada, o sistema realizará o filtro com base no texto digitado, mas manterá a ordenação definida pela seleção do ComboBox." +
    "- A busca por classificação pode falhar caso uma receita não tenha notas registradas.\n");

        }
    }
}
