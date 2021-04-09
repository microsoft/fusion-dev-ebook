using System.ComponentModel.DataAnnotations;

namespace FieldEngineerApi.Models
{
    public class KnowledgeBaseTip {
        [Key]
        public long Id { get; set; }
        public long KnowledgeBaseBoilerPartId { get; set; }
        public virtual KnowledgeBaseBoilerPart KnowledgeBaseBoilerPart { get; set; }
        public string KnowledgeBaseEngineerId { get; set; }
        public virtual KnowledgeBaseEngineer KnowledgeBaseEngineer { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
    }
}
