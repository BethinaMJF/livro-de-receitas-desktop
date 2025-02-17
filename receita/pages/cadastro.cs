using receita.models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace receita.pages
{
    public partial class cadastro : Form2
    {
        dbLivroReceitaEntities ct = new dbLivroReceitaEntities();
        public cadastro()
        {
            InitializeComponent();
        }
        private string VerificarCadastro()
        {
            if (textBox1.Text.Split(' ').Length < 2)
                return "Insira seu nome completo";

            if (ct.Usuario.Any(u => u.email == textBox2.Text))
                return "Insira um email nunca cadastrado";

            if (textBox3.Text.Length < 8)
                return "Insira uma senha com mínimo de 8 caracteres";

            return "Ok";
        }

        private void button1_Click(object sender, EventArgs e)
        {

            if (VerificarCadastro() == "Ok")
            {
                var nv = new Usuario { nome = textBox1.Text, email = textBox2.Text, senha = textBox3.Text };
                ct.Usuario.Add(nv);
                ct.SaveChanges();
                dados.email = textBox2.Text;
                dados.senha = textBox3.Text;
                new login().Show();
                Hide();
            }
            else
            {
                MessageBox.Show(VerificarCadastro(), "Aviso", MessageBoxButtons.OK);
            }

        }
    }
}
