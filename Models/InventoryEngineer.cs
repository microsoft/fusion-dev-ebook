using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace FieldEngineerApi.Models
{

    public class InventoryEngineer
    {
        [Key]
        public string Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string ContactNumber { get; set; }
        public List<Reservation> Reservations { get; set; }
    }
}