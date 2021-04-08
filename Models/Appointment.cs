using System;
using System.ComponentModel.DataAnnotations;

namespace FieldEngineerApi.Models
{

    public class Appointment
    {
        [Key]
        public long Id { get; set; }
        [Required]
        public long CustomerId { get; set; }
        public virtual Customer Customer { get; set; }
        public string ProblemDetails { get; set; }
        [Required]
        public long AppointmentStatusId { get; set; }
        public virtual AppointmentStatus AppointmentStatus { get; set; }
        public string EngineerId { get; set; }
        public virtual ScheduleEngineer Engineer { get ; set; }
        [Display(Name = "StartTime")]
        [DataType(DataType.DateTime)]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy H:mm:ss}")]
        public DateTime StartDateTime { get; set; }
        public string Notes { get; set; }
        public string ImageUrl { get; set; }
    }
}
