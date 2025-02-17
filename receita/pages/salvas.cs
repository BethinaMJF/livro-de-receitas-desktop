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

namespace receita.pages
{
    public partial class salvas : Form2
    {
        dbLivroReceitaEntities ct = new dbLivroReceitaEntities();
        public salvas()
        {
            InitializeComponent();
        }

        private void salvas_Load(object sender, EventArgs e)
        {
            var lista = ct.UsuarioReceita.Where(item => ct.ReceitaFavorira.Any(u => u.UsuarioID == dados.atual.id && u.ReceitaID == item.id));
            foreach (var item in lista)
            {
                flowLayoutPanel1.Controls.Add(new models.receitaControl(item));
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            flowLayoutPanel1.Controls.Clear();
            var lista = new List<int>();

            // Receitas por nome
            lista.AddRange(ct.UsuarioReceita
                .Where(u => u.NomeReceita.ToLower().Contains(textBox1.Text.ToLower()))
                .Select(u => u.id));

            // Receitas por nota
            var notas = ct.UsuarioReceita
                .Select(u => new
                {
                    u.id,
                    nota = ct.NotaReceita.Where(n => n.ReceitaID == u.id).Average(n => (double?)n.nota) ?? 0
                })
                .Where(n => n.nota.ToString().Contains(textBox1.Text))
                .Select(n => n.id);

            lista.AddRange(notas.Except(lista));

            // Receitas por ingredientes
            var ingIds = ct.Ingrediente
                .Where(i => i.nome.ToLower().Contains(textBox1.Text))
                .Select(i => i.ID);

            var recIds = ct.UsuarioReceita
                .Where(u => ct.IngredientesReceita.Any(i => i.ReceitaID == u.id && ingIds.Contains(i.ID)))
                .Select(u => u.id);

            lista.AddRange(recIds.Except(lista));

            foreach (var id in lista)
            {
                var receita = ct.UsuarioReceita.FirstOrDefault(u => u.id == id);
                if (receita != null && ct.ReceitaFavorira.Any(f => f.UsuarioID == dados.atual.id && f.ReceitaID == receita.id))
                {
                    flowLayoutPanel1.Controls.Add(new models.receitaControl(receita));
                }
            }


        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            flowLayoutPanel1.Controls.Clear();

            if (comboBox1.SelectedIndex == 0)
            {
                var apreciados = ct.Perfil.Where(u => u.idUsuario == dados.atual.id && u.status == true).Select(u => u.idIngrediente);
                var evitados = ct.Perfil.Where(u => u.idUsuario == dados.atual.id && u.status == false).Select(u => u.idIngrediente);

                var lista = ct.UsuarioReceita.Select(u =>
                    new gosto()
                    {
                        id = u.id,
                        bons = ct.IngredientesReceita.Where(a => a.ReceitaID == u.id && apreciados.Contains(a.IngredienteID)).Count(),
                        ruins = ct.IngredientesReceita.Where(a => a.ReceitaID == u.id && evitados.Contains(a.IngredienteID)).Count(),
                    }
                ).ToList().OrderByDescending(u => u.bons).ThenBy(u => u.ruins);

                foreach (var item in lista)
                {
                    if (ct.ReceitaFavorira.FirstOrDefault(U => U.UsuarioID == dados.atual.id && U.ReceitaID == item.id) != null)
                    {
                        flowLayoutPanel1.Controls.Add(new models.receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)));

                    }
                }

            }
            else if (comboBox1.SelectedIndex == 1)
            {
                // tempo
                foreach (var item in ct.UsuarioReceita.OrderBy(u => u.TempoMinutos))
                {
                    if (ct.ReceitaFavorira.FirstOrDefault(U => U.UsuarioID == dados.atual.id && U.ReceitaID == item.id) != null)
                    {
                        flowLayoutPanel1.Controls.Add(new models.receitaControl(item));

                    }
                }

            }
            else
            {
                // qtd de ingredientes
                var lista = ct.UsuarioReceita.Select(u =>
                    new qtd()
                    {
                        id = u.id,
                        quantidade = ct.IngredientesReceita.Where(a => a.ReceitaID == u.id).Count()
                    }
                    ).OrderBy(u => u.quantidade);
                ;
                foreach (var item in lista)
                {
                    var receitaControl = new receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)) ;
                    flowLayoutPanel1.Controls.Add(receitaControl);
                }

            }
            
        }
    }
}
