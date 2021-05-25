using Microsoft.AspNetCore.Mvc;
using contractorAPI.Models;
using contractorAPI.Services;

namespace contractorAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ContractorJobsController : ControllerBase
    {
        private readonly ContractorJobsService _contractorJobsService;

        public ContractorJobsController(ContractorJobsService cjs)
        {
            _contractorJobsService = cjs;
        }
        [HttpPost]
        public ActionResult<ContractorJob> CreateContractorJob([FromBody] ContractorJob cj)
        {
            try
            {
                ContractorJob newJob = _contractorJobsService.CreateContractorJob(cj);
                return Ok(newJob);
            }
            catch (System.Exception e)
            {
                return BadRequest(e.Message);
            }

        }

        [HttpPut("{id}")]
        public ActionResult<ContractorJob> UpdateContractorJob([FromBody] ContractorJob cj)
        {
            try
            {
                ContractorJob update = _contractorJobsService.UpdateContractorJob(cj);
                return Ok(update);
            }
            catch (System.Exception e)
            {
                return BadRequest(e.Message);
            }
        }

    }
}