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
    public class KnowledgeBaseEngineerController : ControllerBase
    {
        private readonly KnowledgeBaseContext _context;

        public KnowledgeBaseEngineerController(KnowledgeBaseContext context)
        {
            _context = context;
        }

            // GET: api/KnowledgeBaseEngineer/5/Tips
        [HttpGet("{id}/Tips")]
        public async Task<ActionResult<IEnumerable<KnowledgeBaseTip>>> GetTipsForEngineer(string id)
        {
            return await _context.Tips.Where(
                t => t.KnowledgeBaseEngineerId == id).ToListAsync();
         }

        // GET: api/KnowledgeBaseEngineer
        [HttpGet]
        public async Task<ActionResult<IEnumerable<KnowledgeBaseEngineer>>> GetEngineers()
        {
            return await _context.Engineers.ToListAsync();
        }

        // GET: api/KnowledgeBaseEngineer/5
        [HttpGet("{id}")]
        public async Task<ActionResult<KnowledgeBaseEngineer>> GetKnowledgeBaseEngineer(string id)
        {
            var knowledgeBaseEngineer = await _context.Engineers.FindAsync(id);

            if (knowledgeBaseEngineer == null)
            {
                return NotFound();
            }

            return knowledgeBaseEngineer;
        }

        // PUT: api/KnowledgeBaseEngineer/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutKnowledgeBaseEngineer(string id, KnowledgeBaseEngineer knowledgeBaseEngineer)
        {
            if (id != knowledgeBaseEngineer.Id)
            {
                return BadRequest();
            }

            _context.Entry(knowledgeBaseEngineer).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!KnowledgeBaseEngineerExists(id))
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

        // POST: api/KnowledgeBaseEngineer
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<KnowledgeBaseEngineer>> PostKnowledgeBaseEngineer(KnowledgeBaseEngineer knowledgeBaseEngineer)
        {
            _context.Engineers.Add(knowledgeBaseEngineer);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (KnowledgeBaseEngineerExists(knowledgeBaseEngineer.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetKnowledgeBaseEngineer", new { id = knowledgeBaseEngineer.Id }, knowledgeBaseEngineer);
        }

        // DELETE: api/KnowledgeBaseEngineer/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteKnowledgeBaseEngineer(string id)
        {
            var knowledgeBaseEngineer = await _context.Engineers.FindAsync(id);
            if (knowledgeBaseEngineer == null)
            {
                return NotFound();
            }

            _context.Engineers.Remove(knowledgeBaseEngineer);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool KnowledgeBaseEngineerExists(string id)
        {
            return _context.Engineers.Any(e => e.Id == id);
        }
    }
}
