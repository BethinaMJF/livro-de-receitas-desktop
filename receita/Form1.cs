using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using receita.pages;
using receita.Properties;

namespace receita
{
    public partial class Form1 : Form2
    {
        public int ind { get; set; } = 1;
        public List<Image> lista = new List<Image>() 
        {
            (Image)Properties.Resources.p1,
            (Image)Properties.Resources.p2,
            (Image)Properties.Resources.p3,
            (Image)Properties.Resources.p4,
            (Image)Properties.Resources.p4 // para evitar erro de indice

        };   
        public Form1()
        {
            InitializeComponent();
            ind = 1;
            verificar();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ind--;
            verificar();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            if (ind <= 4)
            {
                ind++; 
                verificar(); 
            }           
        }

        private void label1_Click(object sender, EventArgs e)
        {
            ind = 1;
            verificar();
        }


        private void label2_Click(object sender, EventArgs e)
        {
            ind = 2;
            verificar();

        }

        private void label3_Click(object sender, EventArgs e)
        {
            ind = 3;
            verificar();

        }

        private void label4_Click(object sender, EventArgs e)
        {
            ind = 4;
            verificar();

        }

        private void limpar()
        {
            label1.Text = "◌";
            label2.Text = "◌";
            label3.Text = "◌";
            label4.Text = "◌";
        }
        private void verificar()
        {
            if (ind > 4)
            {
                new Settings { uma = true }.Save();
                new login().Show();
                Hide();
                return; // Sai do método para evitar execução desnecessária
            }

            limpar();
            switch (ind)
            {
                case 1:
                    label1.Text = "●";
                    break;
                case 2:
                    label2.Text = "●";
                    break;
                case 3:
                    label3.Text = "●";
                    break;
                case 4:
                    label4.Text = "●";
                    break;

                    
                default: 
                    break;
            };
            button1.Enabled = ind >= 2;
            pictureBox1.Image = lista[ind - 1];

            
        }

    }
}
