using BusinessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace BusinessLayer
{
    public class BusinessClass
    {
        string BASEURL = "https://localhost:44386/";

        public async Task<List<ProductDetails>> GetAllProducts() {

            List<ProductDetails> projects = new List<ProductDetails>();

            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri(BASEURL);
                //client.DefaultRequestHeaders.Clear();
                //client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", accessToken);

                HttpResponseMessage responseMessage = await client.GetAsync("api/Product");

                if (responseMessage.IsSuccessStatusCode)
                {
                    var response = responseMessage.Content.ReadAsStringAsync().Result;
                    projects = JsonConvert.DeserializeObject<List<ProductDetails>>(response);
                }

                return projects;

            }

        }

    }
}
