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
    public partial class DETALHES : Form
    {
        dbLivroReceitaEntities ct = new dbLivroReceitaEntities();
        public DETALHES(UsuarioReceita rec)
        {
            InitializeComponent();
           
        label1.Text = rec.NomeReceita.ToString();
            label2.Text = ct.ReceitaFavorira.Where(u => u.ReceitaID == rec.id).Count() + " saves";
            label3.Text = rec.TempoMinutos + " min";
            label4.Text = ct.Usuario.FirstOrDefault(u=> u.id == rec.UsuarioID).nome;

            pictureBox1.Image = (Image)Properties.Resources.ResourceManager.GetObject($"_{rec.id}");

            this.FormBorderStyle = FormBorderStyle.None;


            var ing = ct.IngredientesReceita.Where(u => u.ReceitaID == rec.id);
            foreach (var item in ing)
            {
                flowLayoutPanel1.Controls.Add(new models.ingControl((int)item.IngredienteID, item.qtdGramas.ToString()));
            }


            var proc = ct.ProcedimentoReceitas.Where(u => u.userRecipeID == rec.id);
            foreach (var item in proc)
            {
                flowLayoutPanel2.Controls.Add(new models.procControl(item));
            }



        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
