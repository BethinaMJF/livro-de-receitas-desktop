using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using receita.Properties;

namespace receita.pages
{
    public partial class telaBase : Form2
    {
        public telaBase()
        {
            InitializeComponent();

            limpar();
            label1.BackColor = Color.FromArgb(212, 160, 23);
            telaAtual(new principal());
        }

        private void limpar()
        {
            label1.BackColor = Color.Transparent;
            label2.BackColor = Color.Transparent;
            label3.BackColor = Color.Transparent;
        }


        private void telaAtual(Form tela)
        {
            panel2.Controls.Clear();
            tela.AutoSize = true;
            tela.TopLevel = false;
            tela.FormBorderStyle = FormBorderStyle.None;
            tela.Dock = DockStyle.Fill;
            panel2.Controls.Add(tela);
            tela.Show();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            limpar();
            label1.BackColor = Color.FromArgb(212, 160, 23);
            telaAtual(new principal());

        }

        private void label2_Click(object sender, EventArgs e)
        {
            limpar();
            label2.BackColor = Color.FromArgb(212, 160, 23);
            telaAtual(new salvas());

        }

        private void label3_Click(object sender, EventArgs e)
        {
            limpar();
            label3.BackColor = Color.FromArgb(212, 160, 23);
            telaAtual(new perfilAlimentar());
        }

        private void button1_Click(object sender, EventArgs e)
        {
            new Settings() { lembrar = null }.Save();
        }

  
    }
}
