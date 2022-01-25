using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Sample.iPaaS.OData.Model;

namespace Sample.iPaaS.OData.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OverwriteBusinessLogicController : Controller
    {
        private readonly RetailDbContext _context;

        public OverwriteBusinessLogicController(RetailDbContext context)
        {
            this._context = context;
        }

        [HttpGet(Name = "GetOverwriteBusinessLogic")]
        [EnableQuery]
        public IEnumerable<OverwriteBusinessLogic> Get()
        {
            return this._context.OverwriteBusinessLogicList;
        }
    }
}
