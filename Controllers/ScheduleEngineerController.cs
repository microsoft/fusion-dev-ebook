using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FieldEngineerApi.Models;

namespace FieldEngineerApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScheduleEngineerController : ControllerBase
    {
        private readonly ScheduleContext _context;

        public ScheduleEngineerController(ScheduleContext context)
        {
            _context = context;
        }

        // GET: api/ScheduleEngineer/5/Appointments
        [HttpGet("{id}/Appointments")]
        public async Task<ActionResult<IEnumerable<Appointment>>> GetScheduleEngineerAppointments(string id)
        {
            return await _context.Appointments
                .Where(a => a.EngineerId == id)
                .OrderByDescending(a => a.StartDateTime)
                .Include(c => c.Customer)
                .Include(e => e.Engineer)
                .Include(s => s.AppointmentStatus)
                .ToListAsync();
        }

        // GET: api/ScheduleEngineer
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ScheduleEngineer>>> GetEngineers()
        {
            return await _context.Engineers.ToListAsync();
        }

        // GET: api/ScheduleEngineer/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ScheduleEngineer>> GetScheduleEngineer(string id)
        {
            var scheduleEngineer = await _context.Engineers.FindAsync(id);

            if (scheduleEngineer == null)
            {
                return NotFound();
            }

            return scheduleEngineer;
        }

        // PUT: api/ScheduleEngineer/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutScheduleEngineer(string id, ScheduleEngineer scheduleEngineer)
        {
            if (id != scheduleEngineer.Id)
            {
                return BadRequest();
            }

            _context.Entry(scheduleEngineer).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ScheduleEngineerExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/ScheduleEngineer
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ScheduleEngineer>> PostScheduleEngineer(ScheduleEngineer scheduleEngineer)
        {
            _context.Engineers.Add(scheduleEngineer);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ScheduleEngineerExists(scheduleEngineer.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetScheduleEngineer", new { id = scheduleEngineer.Id }, scheduleEngineer);
        }

        // DELETE: api/ScheduleEngineer/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteScheduleEngineer(string id)
        {
            var scheduleEngineer = await _context.Engineers.FindAsync(id);
            if (scheduleEngineer == null)
            {
                return NotFound();
            }

            _context.Engineers.Remove(scheduleEngineer);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ScheduleEngineerExists(string id)
        {
            return _context.Engineers.Any(e => e.Id == id);
        }
    }
}
