using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using receita.  models;
using receita.pages;

namespace receita.models
{
    public partial class receitaControl : UserControl
    {
        dbLivroReceitaEntities ct = new dbLivroReceitaEntities();
        public UsuarioReceita atual { get; set; }
        public receitaControl(UsuarioReceita receita)
        {
            InitializeComponent();

            label1.Text = receita.NomeReceita.ToString();
            label3.Text = receita.TempoMinutos.ToString() + "min";
            pictureBox1.Image = (Image)Properties.Resources.ResourceManager.GetObject($"_{receita.id}");

            if (ct.ReceitaFavorira.FirstOrDefault(u=> u.UsuarioID == dados.atual.id && u.ReceitaID == receita.id) != null)
            {
                pictureBox2.Image = (Bitmap)Properties.Resources.salvar_selecionada;
            }
            else
            {
                pictureBox2.Image = (Bitmap)Properties.Resources.salvar;
            }
            atual = receita;
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            new detalhes(atual).Show();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            if (ct.ReceitaFavorira.FirstOrDefault(u => u.UsuarioID == dados.atual.id && u.ReceitaID == atual.id) != null)
            {
                // Está salva (remover)
                pictureBox2.Image = (Image)Properties.Resources.salvar;
                var favorita = ct.ReceitaFavorira.FirstOrDefault(u=> u.ReceitaID == atual.id && u.UsuarioID == dados.atual.id);
                ct.ReceitaFavorira.Remove(favorita);
                ct.SaveChanges();

            }
            else
            {
                // Não esta salvar (adicionar) 
                pictureBox2.Image = (Image)Properties.Resources.salvar_selecionada;
                var favorita = new ReceitaFavorira() { ReceitaID = atual.id, UsuarioID = dados.atual.id };
                ct.ReceitaFavorira.Add(favorita);
                ct.SaveChanges();

            }
        }
    }
}
