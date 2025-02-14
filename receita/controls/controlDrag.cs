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

namespace receita.models
{
    public partial class controlDrag : UserControl
    {
        public Ingrediente ing { get; set; }
        public controlDrag(Ingrediente i)
        {
            InitializeComponent();
            pictureBox1.Image = (Image)Properties.Resources.ResourceManager.GetObject($"{i.nome.ToLower().Replace(" ", "_")}");
            label1.Text = i.nome;
            ing = i;
        }

        private void controlDrag_MouseDown(object sender, MouseEventArgs e)
        {
            DoDragDrop(this,DragDropEffects.Copy);
        }
    }
}
