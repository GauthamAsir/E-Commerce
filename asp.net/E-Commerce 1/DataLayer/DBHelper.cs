using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;


namespace DataLayer
{
    public class DBHelper
    {
        /// <summary>
        /// Status :>  0- Failed  1-Sucess
        /// </summary>
        Entities db = new Entities();


        public Dictionary<string, dynamic> login(string email, string password)
        {

            Dictionary<string, dynamic> result = new Dictionary<string, dynamic>
            {
                { "status", 0 }
            };

            System.Data.Entity.Core.Objects.ObjectParameter status =
                    new System.Data.Entity.Core.Objects.ObjectParameter("success", typeof(int));

            System.Data.Entity.Core.Objects.ObjectParameter roleId =
                    new System.Data.Entity.Core.Objects.ObjectParameter("roleid", typeof(int));

            System.Data.Entity.Core.Objects.ObjectParameter customerId =
                    new System.Data.Entity.Core.Objects.ObjectParameter("cid", typeof(int));

            System.Data.Entity.Core.Objects.ObjectParameter custName =
                    new System.Data.Entity.Core.Objects.ObjectParameter("custName", typeof(string));

            db.sp_login(email, password, status, roleId, customerId, custName);

            if (Convert.ToInt32(status.Value) == 1)
            {
                result.Clear();
                result.Add("status", 1);
                result.Add("roleid", Convert.ToInt32(roleId.Value));
                result.Add("customerId", Convert.ToInt32(customerId.Value));
                result.Add("custName", custName.Value.ToString());
            }


            return result;

        }

        public Dictionary<string, dynamic> register(CustomerDetail customerDetail, string password)
        {

            Dictionary<string, dynamic> result = new Dictionary<string, dynamic>
            {
                { "status", 0 }
            };

            System.Data.Entity.Core.Objects.ObjectParameter status =
                    new System.Data.Entity.Core.Objects.ObjectParameter("success", typeof(int));

            System.Data.Entity.Core.Objects.ObjectParameter custId =
                    new System.Data.Entity.Core.Objects.ObjectParameter("custId", typeof(int));

            System.Data.Entity.Core.Objects.ObjectParameter message =
                    new System.Data.Entity.Core.Objects.ObjectParameter("message", typeof(string));


            db.sp_AddCustomer(customerDetail.Username, customerDetail.FirstName,
                customerDetail.LastName, customerDetail.DateOfBirth, customerDetail.ContactNo,
                customerDetail.Email, 3, password, status, custId, message);

            result.Clear();
            result.Add("status", Convert.ToInt32(status.Value));
            result.Add("custId", custId.Value is DBNull ? 0 : Convert.ToInt32(custId.Value));
            result.Add("message", message is DBNull ? "" : message.Value.ToString());

            return result;

        }

        public List<ProductDetail> getAllProducts()
        {
            List<ProductDetail> products = new List<ProductDetail>();

            var list = db.sp_GetAllProducts();

            list.ToList().ForEach(p => products.Add(new ProductDetail()
            {
                PorductId = p.PorductId,
                PorductName = p.PorductName,
                ProductDescription = p.ProductDescription,
                LastModified = p.LastModified,
                AddedOn = p.AddedOn,
                ProductPrice = p.ProductPrice,
                AddedBy = p.AddedBy,
                isDeleted = p.isDeleted,
                ProductQuantity = p.ProductQuantity,
                LastModifiedBy = p.LastModifiedBy,
                ProductImage = p.ProductImage
            }));
            return products;
        }

        public Dictionary<string, dynamic> getCustomerDetailById(int custId)
        {
            return getCustomerDetails(custId);
        }

        public dynamic getCustomerDetailByEmail(string email)
        {
            return getCustomerDetails(null, email);
        }

        private Dictionary<string, dynamic> getCustomerDetails(int? custId = null, string email = null)
        {
            Dictionary<string, dynamic> result = new Dictionary<string, dynamic>
            {
                { "exists", false }
            };

            dynamic a;

            if (custId != null)
            {
                a = db.sp_GetCustomerDetailsById(custId);
            }
            else
            {
                a = db.sp_GetCustomerDetailsByEmail(email);
            }

            List<CustomerDetail> customers = new List<CustomerDetail>();

            foreach (var b in Enumerable.ToList(a))
            {
                customers.Add(new CustomerDetail()
                {
                    CustomerId = b.CustomerId,
                    ContactNo = b.ContactNo,
                    CustomerAddress = b.CustomerAddress,
                    DateOfBirth = b.DateOfBirth,
                    Email = b.Email,
                    FirstName = b.FirstName,
                    LastName = b.LastName,
                    RoleId = b.RoleId,
                    Username = b.Username,
                });
            }

            if (customers.Count() <= 0)
            {
                return result;
            }

            result["exists"] = true;
            result.Add("data", customers.First());

            return result;
        }

    }
}
