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
        public UsuarioReceita at { get; set; }
        public principal hometela { get; set; } 
        public receitaControl(UsuarioReceita rec)
        {
            InitializeComponent();

            label1.Text = rec.NomeReceita.ToString();
            label3.Text = rec.TempoMinutos.ToString() + "min";
            
           pictureBox1.Image = (Image)Properties.Resources.ResourceManager.GetObject($"_{rec.id}");


            if (ct.ReceitaFavorira.FirstOrDefault(u=> u.UsuarioID == dados.atual.id && u.ReceitaID == rec.id) != null)
            {

                pictureBox2.Image = (Bitmap)Properties.Resources.salvar_selecionada;
            }
            else
            {
                pictureBox2.Image = (Bitmap)Properties.Resources.salvar;

            }
            at = rec;
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            new DETALHES(at).Show();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            if (ct.ReceitaFavorira.FirstOrDefault(u => u.UsuarioID == dados.atual.id && u.ReceitaID == at.id) != null)
            {
                // esta salva - tirar
                pictureBox2.Image = (Image)Properties.Resources.salvar;
                var USER = ct.ReceitaFavorira.FirstOrDefault(u=> u.ReceitaID == at.id && u.UsuarioID == dados.atual.id);
                ct.ReceitaFavorira.Remove(USER);
                ct.SaveChanges();

            }
            else
            {
                // nao esta - salva 
                pictureBox2.Image = (Image)Properties.Resources.salvar_selecionada;
                var user = new ReceitaFavorira() { ReceitaID = at.id, UsuarioID = dados.atual.id };
                ct.ReceitaFavorira.Add(user);
                ct.SaveChanges();

            }
        }
    }
}
