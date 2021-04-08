using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FieldEngineerApi.Models
{
    public class Order {
        [Key]
        public long Id { get; set; }
        public long BoilerPartId { get; set; }
        public BoilerPart BoilerPart { get; set; }
        public long Quantity { get; set; }
        [Column(TypeName = "money")]
        public decimal TotalPrice { get; set; }
        [Display(Name = "OrderedDate")]
        [DataType(DataType.DateTime)]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime OrderedDateTime { get; set; }
        public bool Delivered { get; set; }
        [Display(Name = "DeliveredDate")]
        [DataType(DataType.DateTime)]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime? DeliveredDateTime { get; set; }
    }
}
