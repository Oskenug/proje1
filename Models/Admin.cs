//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BACommerce.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Admin
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Admin()
        {
            this.Orders = new HashSet<Order>();
        }
    
        public int AdminID { get; set; }
        [Required(ErrorMessage = "Admin Name Giriniz..")]
        public string AdminName { get; set; }
        [Required(ErrorMessage = "�ifre giriniz.")]
        public string Password { get; set; }
        [Required(ErrorMessage = "!i�lem yapmak i�in >0 de�eri girilmelidir!")]
        public int Rights { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
