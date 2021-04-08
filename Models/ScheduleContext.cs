using System;
using Microsoft.EntityFrameworkCore;

namespace FieldEngineerApi.Models
{

    public class ScheduleContext : DbContext
    {
        public ScheduleContext(DbContextOptions<ScheduleContext> options)
            : base(options)
        {

        }

        public DbSet<Appointment> Appointments { get; set; }
        public DbSet<AppointmentStatus> AppointmentStatuses { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<ScheduleEngineer> Engineers { get; set; }
    }
}
