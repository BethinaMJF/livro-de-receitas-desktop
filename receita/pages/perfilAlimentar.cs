using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using receita.models;

namespace receita.pages
{
    public partial class perfilAlimentar : Form2
    {
        dbLivroReceitaEntities ct = new dbLivroReceitaEntities();
        public perfilAlimentar()
        {
            InitializeComponent();

            foreach (var ing in CarregarApreciados())
            {
                flowLayoutPanel2.Controls.Add(new models.controlDrag(ing));
            }
            foreach (var ing in CarregarEvitados())
            {
                flowLayoutPanel3.Controls.Add(new models.controlDrag(ing));
            }

            CarregarIngredientes();

        }

        private List<Ingrediente> CarregarEvitados()
        {
            return ct.Ingrediente.Where(ing => ct.Perfil.Any(u => u.idUsuario == dados.atual.id && u.idIngrediente == ing.ID && u.status == false)).ToList();
        }
        private List<Ingrediente> CarregarApreciados()
        {
            return ct.Ingrediente.Where(ing => ct.Perfil.Any(u => u.idUsuario == dados.atual.id && u.idIngrediente == ing.ID && u.status == true)).ToList();
        }

        private void CarregarIngredientes(string filtro = null)
        {
            flowLayoutPanel1.Controls.Clear();

            var ingredientesFiltrados = string.IsNullOrWhiteSpace(filtro)
                ? ct.Ingrediente // sem filtro
                : ct.Ingrediente.Where(ingrediente => ingrediente.nome.ToLower().Contains(filtro.ToLower())); // com filtro

            foreach (var item in ingredientesFiltrados)
            {
                if (CarregarApreciados().FirstOrDefault(i => i.ID == item.ID) == null && CarregarEvitados().FirstOrDefault(i => i.ID == item.ID) == null)
                {
                    flowLayoutPanel1.Controls.Add(new models.controlDrag(item));
                }
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            CarregarIngredientes(textBox1.Text); // Passa o texto da caixa de pesquisa como filtro
        }



        // DRAG DROP
        private void flowLayoutPanel1_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(typeof(models.controlDrag)))
            {
                e.Effect = DragDropEffects.Copy;
            }
            else
            {
                e.Effect = DragDropEffects.None;
            }
        }

        private void flowLayoutPanel2_DragDrop(object sender, DragEventArgs e)
        {
            if (e.Data.GetData(typeof(models.controlDrag) ) is controlDrag ob)
            {
                flowLayoutPanel2.Controls.Add(ob);   
            }
            
        }
        private void flowLayoutPanel3_DragDrop(object sender, DragEventArgs e)
        {
            if (e.Data.GetData(typeof(models.controlDrag)) is controlDrag ob)
            {
                flowLayoutPanel3.Controls.Add(ob);
            }
        }

        private void flowLayoutPanel1_DragDrop(object sender, DragEventArgs e)
        {
            if (e.Data.GetData(typeof(models.controlDrag)) is controlDrag ob)
            {
                flowLayoutPanel1.Controls.Add(ob);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ct.Perfil.RemoveRange(ct.Perfil.Where(u => u.idUsuario == dados.atual.id)); // remove todas as preferencias para adiconar as novas
            AdicionarPreferencias(flowLayoutPanel2.Controls, status: true);
            AdicionarPreferencias(flowLayoutPanel3.Controls, status: false);
            ct.SaveChanges();

        }
        private void AdicionarPreferencias(Control.ControlCollection controles, bool status)
        {
            foreach (controlDrag item in controles)
            {
                var ingrediente = ct.Ingrediente.FirstOrDefault(u => u.ID == item.ing.ID);
                if (ingrediente != null)
                {
                    var novaPreferencia = new Perfil
                    {
                        idUsuario = dados.atual.id,
                        idIngrediente = ingrediente.ID,
                        status = status,
                    };
                    ct.Perfil.Add(novaPreferencia);
                }
            }

        }
    }
}
