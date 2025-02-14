using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using receita.models;
using receita.pages;
using receita.Properties;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace receita
{
    internal static class Program
    {
        /// <summary>
        /// Ponto de entrada principal para o aplicativo.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);


            var config = new Settings();
            if (config.uma == false)
            {
                Application.Run(new Form1());
            }
            else
            {
                if (!string.IsNullOrEmpty(config.lembrar))
                {
                    dados.atual = new dbLivroReceitaEntities().Usuario.FirstOrDefault(u => u.email == config.lembrar);

                    Application.Run(new telaBase());
                }
                else
                {
                    Application.Run(new login());
                }
            }

        }
    }
}
