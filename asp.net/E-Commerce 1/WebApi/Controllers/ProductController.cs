using DataLayer;
using System.Text.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace WebApi.Controllers
{
    public class ProductController : ApiController
    {

        DBHelper dBHelper = new DBHelper();

        [Route("api/product")]
        [HttpGet]
        public HttpResponseMessage Get()
        {
            return Request.CreateResponse(HttpStatusCode.OK, JsonSerializer.Serialize(dBHelper.getAllProducts()));
        }

        // GET: api/Product/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Product
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Product/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/Product/5
        public void Delete(int id)
        {
        }
    }
}
