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

        private void button1_Click(object sender, EventArgs e)
        {


            var ex = ct.Usuario.FirstOrDefault(u=> u.email == textBox2.Text);
            if (textBox1.Text.Split(' ').Count() >= 1
                && ex == null
                && textBox3.Text.Count() >= 8
                )
            {

                var nv = new Usuario() { nome = textBox1.Text , email = textBox2.Text, senha = textBox3.Text };
                ct.Usuario.Add(nv);
                ct.SaveChanges();
                dados.email = textBox2.Text;
                dados.senha = textBox3.Text;
                var nvv = new login() {  };
                nvv.Show();

                this.Hide();
            }
            else
            {
                if (textBox1.Text.Split(' ').Length < 1)
                {
                    MessageBox.Show("Insira seu nome completo", "aviso", MessageBoxButtons.OK   );
                }else if (ex != null)
                {
                    MessageBox.Show("Insira um email nunca cadastrado", "aviso", MessageBoxButtons.OK);

                }
                else
                {
                    MessageBox.Show("Insira uma senha com minimo de 8 caracteres", "aviso", MessageBoxButtons.OK);

                }
            }
        }
    }
}
