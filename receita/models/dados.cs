using receita.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace receita.pages
{
    public static class dados
    {
        public static string email { get; set; } = "";
        public static string senha { get; set; } = "";
        public static Usuario atual { get; set; } = new Usuario();
    }
}
