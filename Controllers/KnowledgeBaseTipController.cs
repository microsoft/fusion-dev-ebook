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
    public class KnowledgeBaseTipController : ControllerBase
    {
        private readonly KnowledgeBaseContext _context;

        public KnowledgeBaseTipController(KnowledgeBaseContext context)
        {
            _context = context;
        }

        // GET: api/KnowledgeBaseTip
        [HttpGet]
        public async Task<ActionResult<IEnumerable<KnowledgeBaseTip>>> GetTips()
        {
            return await _context.Tips.ToListAsync();
        }

        // GET: api/KnowledgeBaseTip/5
        [HttpGet("{id}")]
        public async Task<ActionResult<KnowledgeBaseTip>> GetKnowledgeBaseTip(long id)
        {
            var knowledgeBaseTip = await _context.Tips.FindAsync(id);

            if (knowledgeBaseTip == null)
            {
                return NotFound();
            }

            return knowledgeBaseTip;
        }

        // PUT: api/KnowledgeBaseTip/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutKnowledgeBaseTip(long id, KnowledgeBaseTip knowledgeBaseTip)
        {
            if (id != knowledgeBaseTip.Id)
            {
                return BadRequest();
            }

            _context.Entry(knowledgeBaseTip).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!KnowledgeBaseTipExists(id))
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

        // POST: api/KnowledgeBaseTip
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<KnowledgeBaseTip>> PostKnowledgeBaseTip(KnowledgeBaseTip knowledgeBaseTip)
        {
            _context.Tips.Add(knowledgeBaseTip);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetKnowledgeBaseTip", new { id = knowledgeBaseTip.Id }, knowledgeBaseTip);
        }

        // DELETE: api/KnowledgeBaseTip/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteKnowledgeBaseTip(long id)
        {
            var knowledgeBaseTip = await _context.Tips.FindAsync(id);
            if (knowledgeBaseTip == null)
            {
                return NotFound();
            }

            _context.Tips.Remove(knowledgeBaseTip);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool KnowledgeBaseTipExists(long id)
        {
            return _context.Tips.Any(e => e.Id == id);
        }
    }
}
