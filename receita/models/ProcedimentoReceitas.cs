//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace receita.models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProcedimentoReceitas
    {
        public int ID { get; set; }
        public Nullable<int> userRecipeID { get; set; }
        public string step { get; set; }
        public Nullable<int> stepSequence { get; set; }
    
        public virtual UsuarioReceita UsuarioReceita { get; set; }
    }
}
