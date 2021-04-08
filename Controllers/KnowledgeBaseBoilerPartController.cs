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
    public class KnowledgeBaseBoilerPartController : ControllerBase
    {
        private readonly KnowledgeBaseContext _context;

        public KnowledgeBaseBoilerPartController(KnowledgeBaseContext context)
        {
            _context = context;
        }

        // GET: api/KnowledgeBaseBoilerPart/5/Tips
        [HttpGet("{id}/Tips")]
        public async Task<ActionResult<IEnumerable<KnowledgeBaseTip>>> GetTipsForPart(long id)
        {
            return await _context.Tips.Where(
                t => t.KnowledgeBaseBoilerPartId == id).ToListAsync();
        } 

        // GET: api/KnowledgeBaseBoilerPart
        [HttpGet]
        public async Task<ActionResult<IEnumerable<KnowledgeBaseBoilerPart>>> GetBoilerParts()
        {
            return await _context.BoilerParts.ToListAsync();
        }

        // GET: api/KnowledgeBaseBoilerPart/5
        [HttpGet("{id}")]
        public async Task<ActionResult<KnowledgeBaseBoilerPart>> GetKnowledgeBaseBoilerPart(long id)
        {
            var knowledgeBaseBoilerPart = await _context.BoilerParts.FindAsync(id);

            if (knowledgeBaseBoilerPart == null)
            {
                return NotFound();
            }

            return knowledgeBaseBoilerPart;
        }

        // PUT: api/KnowledgeBaseBoilerPart/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutKnowledgeBaseBoilerPart(long id, KnowledgeBaseBoilerPart knowledgeBaseBoilerPart)
        {
            if (id != knowledgeBaseBoilerPart.Id)
            {
                return BadRequest();
            }

            _context.Entry(knowledgeBaseBoilerPart).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!KnowledgeBaseBoilerPartExists(id))
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

        // POST: api/KnowledgeBaseBoilerPart
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<KnowledgeBaseBoilerPart>> PostKnowledgeBaseBoilerPart(KnowledgeBaseBoilerPart knowledgeBaseBoilerPart)
        {
            _context.BoilerParts.Add(knowledgeBaseBoilerPart);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetKnowledgeBaseBoilerPart", new { id = knowledgeBaseBoilerPart.Id }, knowledgeBaseBoilerPart);
        }

        // DELETE: api/KnowledgeBaseBoilerPart/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteKnowledgeBaseBoilerPart(long id)
        {
            var knowledgeBaseBoilerPart = await _context.BoilerParts.FindAsync(id);
            if (knowledgeBaseBoilerPart == null)
            {
                return NotFound();
            }

            _context.BoilerParts.Remove(knowledgeBaseBoilerPart);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool KnowledgeBaseBoilerPartExists(long id)
        {
            return _context.BoilerParts.Any(e => e.Id == id);
        }
    }
}
