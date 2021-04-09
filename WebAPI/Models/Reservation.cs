using System;
using System.ComponentModel.DataAnnotations;

namespace FieldEngineerApi.Models
{
    public class Reservation
    {
        [Key]
        public long Id { get; set; }
        public long BoilerPartId { get; set; }
        public BoilerPart BoilerPart { get; set; }
        public int NumberToReserve { get; set; }
        public string EngineerId { get; set; }
        public InventoryEngineer Engineer { get; set; }
    }
}
