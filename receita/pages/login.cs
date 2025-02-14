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
using receita.Properties;

namespace receita.pages
{
    public partial class login : Form2
    {
        public dbLivroReceitaEntities ct  = new dbLivroReceitaEntities();
        public string email { get; set; } = "";
        public string senha { get; set; } = "";
        public login()
        {
            InitializeComponent();

            if (dados.email != null)
            {
                textBox1.Text = dados.email;
                textBox2.Text = dados.senha;
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            textBox1.Text = string.Empty;
            textBox2.Text = string.Empty;
        }

        private void pictureBox2_MouseDown(object sender, MouseEventArgs e)
        {
            if (textBox2.UseSystemPasswordChar)
            {
                textBox2.UseSystemPasswordChar = false;

            }
            
        }

        private void button1_Click(object sender, EventArgs e)
        {

            if (ct.Usuario.FirstOrDefault(u=> u.email == textBox1.Text && u.senha== textBox2.Text) != null)
            {
                if (checkBox1.Checked)
                {
                    var s = new Settings();
                    s.lembrar = textBox1.Text;
                    s.Save();
                }
                dados.atual = ct.Usuario.FirstOrDefault(u => u.email == textBox1.Text && u.senha == textBox2.Text);
                new telaBase().Show(); 
                this.Hide();
            }
            else
            {
                MessageBox.Show("Campo de email ou senha incorretos", "Erro", MessageBoxButtons.OK);
            }
        }

        private void pictureBox2_MouseUp(object sender, MouseEventArgs e)
        {
            textBox2.UseSystemPasswordChar = true;

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            new cadastro().Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var s = new Settings();
            s.uma = false;
            s.Save();
        }
    }
}
