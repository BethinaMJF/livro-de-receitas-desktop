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

            foreach (var item in ct.UsuarioReceita)
            {
                flowLayoutPanel1.Controls.Add(new models.receitaControl(item) { hometela = this });
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            button2.Enabled = true;
            flowLayoutPanel1.Controls.Clear();
            var r = new Random().Next(1, 10);
            flowLayoutPanel1.Controls.Add(new models.receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == r)) { hometela = this });
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
                    flowLayoutPanel1.Controls.Add(new receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)) { hometela = this });
                }

            }
            else if (comboBox1.SelectedIndex == 1)
            {
                var lista = ct.UsuarioReceita.OrderBy(u => u.TempoMinutos.Value);
                foreach (var item in lista)
                {
                    flowLayoutPanel1.Controls.Add(new receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)) { hometela = this });
                }
            }
            else
            {
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
                    var receitaControl = new receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)) { hometela = this };
                    flowLayoutPanel1.Controls.Add(receitaControl);
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            button2.Enabled = false;
            flowLayoutPanel1.Controls.Clear();

            foreach (var item in ct.UsuarioReceita)
            {
                flowLayoutPanel1.Controls.Add(new models.receitaControl(item) { hometela = this });
            }
        }

        public void recarregar()
        {
            flowLayoutPanel1.Controls.Clear();
            foreach (var item in ct.UsuarioReceita)
            {
                flowLayoutPanel1.Controls.Add(new receitaControl(item) { hometela = this });
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

            //nome, classificacao ingredientes e ingrediente
            flowLayoutPanel1.Controls.Clear();
            var nome = ct.UsuarioReceita.Where(u => u.NomeReceita.ToString().ToLower().Contains(textBox1.Text.ToLower())).ToList();
            var clas = ct.UsuarioReceita.Select(u => new teste()
            {
                id = u.id,
                nota = ((double)ct.NotaReceita
                                    .Where(a => a.ReceitaID == u.id)
                                    .Sum(f => f.nota)) /
                                    ct.NotaReceita.Where(a => a.ReceitaID == u.id).Count()
            }
            ).Where(u => u.nota.ToString().Contains(textBox1.Text));

            var ingred = ct.Ingrediente.Where(u => u.nome.ToLower().Contains(textBox1.Text.ToLower())).Select(u => u.ID);
            var receitasIng = ct.UsuarioReceita
                                .Where(u => ct.IngredientesReceita
                                             .Any(a => a.ReceitaID == u.id &&
                                ingred.Contains(((int)a.IngredienteID.Value))
                                ));


            // caso tenha filtro
            var tds = receitasIng.Concat(nome).Concat(clas.Select(u => ct.UsuarioReceita.FirstOrDefault(a => a.id == u.id))).Distinct().ToList();
            var aa = nome.Concat(clas.Select(item => ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)))
                .Concat(receitasIng)
                .Distinct()
                .ToList();

            if (comboBox1.SelectedIndex == 0)
            {
                var apreciados = ct.Perfil.Where(u => u.idUsuario == dados.atual.id && u.status == true).Select(u => u.idIngrediente);
                var evitados = ct.Perfil.Where(u => u.idUsuario == dados.atual.id && u.status == false).Select(u => u.idIngrediente);

                var lista = aa.Select(u =>

                    new gosto()
                    {
                        id = u.id,
                        bons = ct.IngredientesReceita.Where(a => a.ReceitaID == u.id && apreciados.Contains(a.IngredienteID)).Count(),
                        ruins = ct.IngredientesReceita.Where(a => a.ReceitaID == u.id && evitados.Contains(a.IngredienteID)).Count(),
                    }
                ).ToList().OrderByDescending(u => u.bons).ThenBy(u => u.ruins);

                foreach (var item in lista)
                {
                    flowLayoutPanel1.Controls.Add(new receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)) { hometela = this });
                }
            }

            else if (comboBox1.SelectedIndex == 1)
            {
                var lista = aa.OrderBy(u => u.TempoMinutos.Value);
                foreach (var item in lista)
                {
                    flowLayoutPanel1.Controls.Add(new receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)) { hometela = this });
                }
            }

            else if (comboBox1.SelectedIndex == 2)
            {
                var lista = aa.Select(u =>
                    new qtd()
                    {
                        id = u.id,
                        quantidade = ct.IngredientesReceita.Where(a => a.ReceitaID == u.id).Count()
                    }
                    ).OrderBy(u => u.quantidade);
                ;
                foreach (var item in lista)
                {
                    var receitaControl = new receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)) { hometela = this };
                    flowLayoutPanel1.Controls.Add(receitaControl);
                }
            }

            else
            {
                foreach (var item in aa)
                {
                    var receitaControl = new receitaControl(ct.UsuarioReceita.FirstOrDefault(u => u.id == item.id)) { hometela = this };
                    flowLayoutPanel1.Controls.Add(receitaControl);
                }
            }

            if (string.IsNullOrEmpty(textBox1.Text))
            {
                foreach (var item in ct.UsuarioReceita)
                {
                    flowLayoutPanel1.Controls.Add(new receitaControl(item) { hometela = this });
                }
            }

        }
    }
}
