using DataLayer;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Text.Json;
using System.Web;
using System.Web.Http;
using System.Web.Http.Tracing;
using System.Web.Razor.Tokenizer;

namespace WebApi.Controllers
{
    public class AuthController : ApiController
    {
        DBHelper dBHelper = new DBHelper();

        Utils utils = new Utils();

        [Route("api/auth/login")]
        [HttpPost]
        public HttpResponseMessage Login()
        {

            var data = utils.getRequestData();

            var result = dBHelper.login(data["email"], data["password"]);

            return Request.CreateResponse(HttpStatusCode.OK, JsonSerializer.Serialize(result), "application/json");

        }

        [Route("api/auth/signup")]
        [HttpPost]
        public HttpResponseMessage SignUp()
        {
            Dictionary<string, dynamic> result = new Dictionary<string, dynamic>
            {
                { "status", false }
            };
            var data = utils.getRequestData();

            CustomerDetail detail = new CustomerDetail()
            {
                Username = data["Username"],
                FirstName = data["FirstName"],
                LastName = data["LastName"],
                DateOfBirth = DateTime.Parse(data["DateOfBirth"]),
                ContactNo = data["ContactNo"],
                Email = data["Email"],
            };

            try
            {
                result = dBHelper.register(detail, data["password"]);
                result["status"] = true;
            }
            catch (Exception e)
            {
                result.Add("exception", getExMessage(e));
                result["status"] = false;
            }
            return Request.CreateResponse(HttpStatusCode.OK, JsonSerializer.Serialize(result), "application/json");
        }

        [Route("api/auth/user")]
        [HttpPost]
        public HttpResponseMessage UserDetail()
        {
            var data = utils.getRequestData();

            Dictionary<string, dynamic> result;

            if (data.ContainsKey("custId"))
            {
                result = dBHelper.getCustomerDetailById(int.Parse(data["custId"]));
            }
            else if (data.ContainsKey("email"))
            {
                result = dBHelper.getCustomerDetailByEmail(data["email"]);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            return Request.CreateResponse(HttpStatusCode.OK, JsonSerializer.Serialize(result), "application/json");
        }


        private Dictionary<string, dynamic> getExMessage(Exception exception)
        {
            Dictionary<string, dynamic> result = new Dictionary<string, dynamic>
            {
                { "description", exception.Message }
            };

            if (exception.InnerException is SqlException sqlException)
            {
                result.Add("message", sqlException.Message);
                //switch (sqlException.Number)
                //{
                //    case 2627:  // Unique constraint error
                //        result.Add("message", sqlException.Message);

                //        break;
                //    case 547:   // Constraint check violation
                //    case 2601:  // Duplicated key row error
                //                // Constraint violation exception
                //                // A custom exception of yours for concurrency issues
                //        result.Add("message", sqlException.Message);
                //        break;
                //    default:
                //        // A custom exception of yours for other DB issues
                //        result.Add("message", sqlException.Message);
                //        break;
                //}
            }

            return result;
        }
    }
}
