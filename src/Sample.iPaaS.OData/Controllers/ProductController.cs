using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Sample.iPaaS.OData.Model;

namespace Sample.iPaaS.OData.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : Controller
    {
        private readonly RetailDbContext _context;

        public ProductController(RetailDbContext context)
        {
            this._context = context;
        }

        [HttpGet(Name = "GetProducts")]
        [EnableQuery]
        public IEnumerable<Product> Get()
        {
            return this._context.Products;
        }
    }
}
