using receita.models;
using System.Linq;

namespace receita.pages
{
    internal class teste
    {
        internal IQueryable<NotaReceita> totalNotas;

        public teste()
        {
        }

        public int id { get; set; }
        public double nota { get; set; }
    }
}