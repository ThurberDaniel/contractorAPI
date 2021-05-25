using System.ComponentModel.DataAnnotations;
using contractorAPI.Models;
namespace contractorAPI.Models
{
    public class ContractorJob
    {
        public int Id { get; set; }
        [Required]
        public int ContractorId { get; set; }
        [Required]
        public int JobId { get; set; }
    }
    public class ContractorJobViewModel : Job
    {
        public string Location { get; set; }
        public int JobId { get; set; }
        public int ContractorId { get; set; }
        public int ContractorJobsId { get; set; }
    }
}