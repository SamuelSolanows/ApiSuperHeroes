//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ApiSuperHeroes.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Misiones
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Misiones()
        {
            this.SuperHeroe = new HashSet<SuperHeroe>();
        }
    
        public int ID { get; set; }
        public string Descripcion { get; set; }
        public Nullable<int> IDTipo { get; set; }
    
        public virtual TipoMision TipoMision { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SuperHeroe> SuperHeroe { get; set; }
    }
}
