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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace receita.pages
{
    public partial class detalhes : Form
    {
        dbLivroReceitaEntities ct = new dbLivroReceitaEntities();
        public detalhes(UsuarioReceita receita)
        {
            InitializeComponent();

            this.FormBorderStyle = FormBorderStyle.None;
            label1.Text = receita.NomeReceita.ToString();
            label2.Text = ct.ReceitaFavorira.Where(u => u.ReceitaID == receita.id).Count() + " saves";
            label3.Text = receita.TempoMinutos + " min";
            label4.Text = ct.Usuario.FirstOrDefault(u => u.id == receita.UsuarioID).nome;
            label8.Text = "Classificação: "+ ct.NotaReceita
                        .Where(a => a.ReceitaID == receita.id)
                        .DefaultIfEmpty()
                    .Average(f => (double?)f.nota.Value ?? 0).ToString() ;
                
            pictureBox1.Image = (Image)Properties.Resources.ResourceManager.GetObject($"_{receita.id}");

            var ingredientes = ct.IngredientesReceita.Where(u => u.ReceitaID == receita.id);
            foreach (var item in ingredientes)
            {
                flowLayoutPanel1.Controls.Add(new models.ingControl((int)item.IngredienteID, item.qtdGramas.ToString()));
            }

            var procedimentos = ct.ProcedimentoReceitas.Where(u => u.userRecipeID == receita.id);
            foreach (var item in procedimentos)
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
