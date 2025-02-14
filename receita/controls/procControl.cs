using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace receita.models
{
    public partial class procControl : UserControl
    {
        public procControl(ProcedimentoReceitas pro)
        {
            InitializeComponent();
            label1.Text = pro.stepSequence.ToString();
            label2.Text = pro.step;
        }
    }
}
