//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pub.Model.DWModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class DimDate
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DimDate()
        {
            this.DimTitle = new HashSet<DimTitle>();
            this.FactSales = new HashSet<FactSales>();
        }
    
        public int DateKey { get; set; }
        public System.DateTime Date { get; set; }
        public string DateName { get; set; }
        public short Month { get; set; }
        public string MonthName { get; set; }
        public short Quarter { get; set; }
        public string QuarterName { get; set; }
        public short Year { get; set; }
        public string YearName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DimTitle> DimTitle { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FactSales> FactSales { get; set; }
    }
}
