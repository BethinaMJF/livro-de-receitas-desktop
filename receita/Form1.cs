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
        public Form1()
        {
            InitializeComponent();

            label1.Text = "●";
            pictureBox1.Image = Properties.Resources.p1;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (ind >= 2)
            {
                button1.Enabled = true;
            }
            else
            {
                button1.Enabled = false;
            }

            if (ind <= 4)
            {
                ind++;
                ve();
                
            }
            if (ind > 4)
            {
                var s = new Settings();
                s.uma = true;
                s.Save();
                new login().Show();
                this.Hide();
            }

        }

        private void label1_Click(object sender, EventArgs e)
        {
            ind = 1;
            ve();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            ind = 2;
            ve();

        }

        private void label3_Click(object sender, EventArgs e)
        {
            ind = 3;
            ve();

        }

        private void label4_Click(object sender, EventArgs e)
        {
            ind = 4;
            ve();

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        private void ve()
        {
            if (ind == 1)
            {
                label1.Text = "●";
                pictureBox1.Image = Properties.Resources.p1;

                label2.Text = "◌";
                label3.Text = "◌";
                label4.Text = "◌";

                

            }
            else if (ind == 2)
            {
                label2.Text = "●";
                pictureBox1.Image = Properties.Resources.p;

                label1.Text = "◌";
                label3.Text = "◌";
                label4.Text = "◌";
            }
            else if (ind == 3)
            {
                label3.Text = "●";
                pictureBox1.Image = Properties.Resources.pp;

                label2.Text = "◌";
                label1.Text = "◌";
                label4.Text = "◌";
            }
            else if (ind == 4)
            {
                label4.Text = "●";
                pictureBox1.Image = Properties.Resources.ppp;

                label2.Text = "◌";
                label3.Text = "◌";
                label1.Text = "◌";
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ind--;
            ve();
        }
    }
}
