using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Sample.iPaaS.OData.Model;

namespace Sample.iPaaS.OData.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoreCalendarController : ControllerBase
    {
        private readonly RetailDbContext _context;

        public StoreCalendarController(RetailDbContext context)
        {
            this._context = context;
        }

        [HttpGet(Name = "GetStoreCalendar")]
        [EnableQuery]
        public IEnumerable<StoreCalendar> Get()
        {
            return this._context.StoreCalendarItems;
        }
    }
}
