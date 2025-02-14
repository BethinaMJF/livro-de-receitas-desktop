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
    public partial class ingControl : UserControl
    {
        dbLivroReceitaEntities ct = new dbLivroReceitaEntities();
        public ingControl(int i, string qts)
        {
            InitializeComponent();

            label1.Text = ct.Ingrediente.FirstOrDefault(u=> u.ID == i).nome ;
            label2.Text = qts.ToString();
        }
    }
}
