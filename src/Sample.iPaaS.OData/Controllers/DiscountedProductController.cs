using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Sample.iPaaS.OData.Model;

namespace Sample.iPaaS.OData.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiscountedProductController : Controller
    {
        private readonly RetailDbContext _context;

        public DiscountedProductController(RetailDbContext context)
        {
            this._context = context;
        }

        [HttpGet(Name = "GetDiscountedProduct")]
        [EnableQuery]
        public IEnumerable<DiscountedProduct> Get()
        {
            return this._context.DiscountedProducts;
        }
    }
}
