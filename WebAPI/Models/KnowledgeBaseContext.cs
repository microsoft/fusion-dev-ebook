using Microsoft.EntityFrameworkCore;

namespace FieldEngineerApi.Models
{

    public class KnowledgeBaseContext : DbContext
    {
        public KnowledgeBaseContext(DbContextOptions<KnowledgeBaseContext> options)
            : base(options)
        {

        }

        public DbSet<KnowledgeBaseBoilerPart> BoilerParts { get; set; }
        public DbSet<KnowledgeBaseEngineer> Engineers { get; set; }
        public DbSet<KnowledgeBaseTip> Tips { get; set; }
    }
}
