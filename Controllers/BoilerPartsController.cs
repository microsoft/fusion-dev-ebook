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
    public class BoilerPartsController : ControllerBase
    {
        private readonly InventoryContext _context;

        public BoilerPartsController(InventoryContext context)
        {
            _context = context;
        }

        // GET: api/BoilerParts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BoilerPart>>> GetBoilerParts()
        {
            return await _context.BoilerParts.ToListAsync();
        }

        // GET: api/BoilerParts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BoilerPart>> GetBoilerPart(long id)
        {
            var boilerPart = await _context.BoilerParts.FindAsync(id);

            if (boilerPart == null)
            {
                return NotFound();
            }

            return boilerPart;
        }

        // GET: api/BoilerParts/5/Reserved 
        [HttpGet("{id}/Reserved")] 
        public async Task<ActionResult<object>> GetTotalReservations(long id) 
        { 
            var reservations = await _context 
                .Reservations 
                .Where(r => r.BoilerPartId == id) 
                .ToListAsync(); 

            int totalReservations = 0; 

            foreach(Reservation reservation in reservations) 
            { 
                totalReservations += reservation.NumberToReserve; 
            } 

            return new {id, totalReservations}; 
        } 

        // PUT: api/BoilerParts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBoilerPart(long id, BoilerPart boilerPart)
        {
            if (id != boilerPart.Id)
            {
                return BadRequest();
            }

            _context.Entry(boilerPart).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BoilerPartExists(id))
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

        // POST: api/BoilerParts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<BoilerPart>> PostBoilerPart(BoilerPart boilerPart)
        {
            _context.BoilerParts.Add(boilerPart);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBoilerPart", new { id = boilerPart.Id }, boilerPart);
        }

        // DELETE: api/BoilerParts/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBoilerPart(long id)
        {
            var boilerPart = await _context.BoilerParts.FindAsync(id);
            if (boilerPart == null)
            {
                return NotFound();
            }

            _context.BoilerParts.Remove(boilerPart);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BoilerPartExists(long id)
        {
            return _context.BoilerParts.Any(e => e.Id == id);
        }
    }
}
