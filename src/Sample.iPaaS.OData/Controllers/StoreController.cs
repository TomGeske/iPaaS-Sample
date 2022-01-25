using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Sample.iPaaS.OData.Model;

namespace Sample.iPaaS.OData.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoreController : Controller
    {
        private readonly RetailDbContext _context;

        public StoreController(RetailDbContext context)
        {
            this._context = context;
        }

        [HttpGet(Name = "GetStores")]
        [EnableQuery]
        public IEnumerable<Store> Get()
        {
            return this._context.Stores;
        }
    }
}
