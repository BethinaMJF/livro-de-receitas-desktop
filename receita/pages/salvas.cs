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
            foreach (var item in ct.UsuarioReceita)
            {
                if (ct.ReceitaFavorira.FirstOrDefault(u => u.UsuarioID == dados.atual.id && u.ReceitaID == item.id) != null)
                {
                    flowLayoutPanel1.Controls.Add(new models.receitaControl(item));
                }
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            flowLayoutPanel1.Controls.Clear();
            var lista = new List<int>();

            // pesquisa por nome
            foreach (var item in ct.UsuarioReceita.Where(u => u.NomeReceita.ToLower().Contains(textBox1.Text.ToLower())))
            {
                lista.Add(item.id);
            }

            // pesquisa por Nota
            var notas = new List<UsuarioReceitaNotas>();
            foreach (var item in ct.UsuarioReceita)
            {
                double nota = (double)(ct.NotaReceita.Where(u => u.ReceitaID == item.id).Sum(u => u.nota) / ct.NotaReceita.Where(u => u.ReceitaID == item.id).Count());
                notas.Add(new UsuarioReceitaNotas() { idReceita = item.id, nota = nota });
            }
            var nv = notas.Where(u => u.nota.ToString().Contains(textBox1.Text));
            foreach (var item in nv)
            {
                if (!lista.Contains(item.idReceita))
                {
                    lista.Add(item.idReceita);
                }
            }

            // Ing
            var ing = ct.Ingrediente.Where(u => u.nome.ToLower().Contains(textBox1.Text)).Select(u => u.ID);
            var rec = ct.UsuarioReceita.Where(u => ct.IngredientesReceita.Any(i => i.ReceitaID == u.id && ing.Contains(i.ID))).Select(u => u.id);

            foreach (var item in rec)
            {
                if (!lista.Contains(item))
                {
                    lista.Add(item);
                }
            }


            foreach (var item in lista)
            {
                var re = ct.UsuarioReceita.FirstOrDefault(u => u.id == item);
                if (ct.ReceitaFavorira.FirstOrDefault(U=> U.UsuarioID == dados.atual.id && U.ReceitaID == re.id) != null)
                {
                    flowLayoutPanel1.Controls.Add(new models.receitaControl(re));
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
