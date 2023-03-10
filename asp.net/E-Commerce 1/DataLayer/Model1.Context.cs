//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class Entities : DbContext
    {
        public Entities()
            : base("name=Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<CustomerDetail> CustomerDetails { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<OrderStatu> OrderStatus { get; set; }
        public virtual DbSet<ProductDetail> ProductDetails { get; set; }
        public virtual DbSet<RoleDetail> RoleDetails { get; set; }
        public virtual DbSet<LoginCredential> LoginCredentials { get; set; }
    
        public virtual int sp_AddCustIdandPassword(Nullable<int> custid, string password)
        {
            var custidParameter = custid.HasValue ?
                new ObjectParameter("custid", custid) :
                new ObjectParameter("custid", typeof(int));
    
            var passwordParameter = password != null ?
                new ObjectParameter("password", password) :
                new ObjectParameter("password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_AddCustIdandPassword", custidParameter, passwordParameter);
        }
    
        public virtual int sp_AddCustomer(string cUserName, string fName, string lName, Nullable<System.DateTime> dob, string phone, string email, Nullable<int> roleId, string pass, ObjectParameter success, ObjectParameter custId, ObjectParameter message)
        {
            var cUserNameParameter = cUserName != null ?
                new ObjectParameter("cUserName", cUserName) :
                new ObjectParameter("cUserName", typeof(string));
    
            var fNameParameter = fName != null ?
                new ObjectParameter("fName", fName) :
                new ObjectParameter("fName", typeof(string));
    
            var lNameParameter = lName != null ?
                new ObjectParameter("lName", lName) :
                new ObjectParameter("lName", typeof(string));
    
            var dobParameter = dob.HasValue ?
                new ObjectParameter("dob", dob) :
                new ObjectParameter("dob", typeof(System.DateTime));
    
            var phoneParameter = phone != null ?
                new ObjectParameter("phone", phone) :
                new ObjectParameter("phone", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            var roleIdParameter = roleId.HasValue ?
                new ObjectParameter("roleId", roleId) :
                new ObjectParameter("roleId", typeof(int));
    
            var passParameter = pass != null ?
                new ObjectParameter("pass", pass) :
                new ObjectParameter("pass", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_AddCustomer", cUserNameParameter, fNameParameter, lNameParameter, dobParameter, phoneParameter, emailParameter, roleIdParameter, passParameter, success, custId, message);
        }
    
        public virtual int sp_AddProduct(string pName, string pDesc, Nullable<decimal> pPrice, Nullable<int> addedBy, Nullable<int> pQuantity, string pImage, ObjectParameter success)
        {
            var pNameParameter = pName != null ?
                new ObjectParameter("pName", pName) :
                new ObjectParameter("pName", typeof(string));
    
            var pDescParameter = pDesc != null ?
                new ObjectParameter("pDesc", pDesc) :
                new ObjectParameter("pDesc", typeof(string));
    
            var pPriceParameter = pPrice.HasValue ?
                new ObjectParameter("pPrice", pPrice) :
                new ObjectParameter("pPrice", typeof(decimal));
    
            var addedByParameter = addedBy.HasValue ?
                new ObjectParameter("AddedBy", addedBy) :
                new ObjectParameter("AddedBy", typeof(int));
    
            var pQuantityParameter = pQuantity.HasValue ?
                new ObjectParameter("pQuantity", pQuantity) :
                new ObjectParameter("pQuantity", typeof(int));
    
            var pImageParameter = pImage != null ?
                new ObjectParameter("pImage", pImage) :
                new ObjectParameter("pImage", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_AddProduct", pNameParameter, pDescParameter, pPriceParameter, addedByParameter, pQuantityParameter, pImageParameter, success);
        }
    
        public virtual ObjectResult<sp_GetAllProducts_Result> sp_GetAllProducts()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetAllProducts_Result>("sp_GetAllProducts");
        }
    
        public virtual ObjectResult<sp_GetAvailableRoles_Result> sp_GetAvailableRoles()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetAvailableRoles_Result>("sp_GetAvailableRoles");
        }
    
        public virtual ObjectResult<sp_GetCustomerDetailsByEmail_Result> sp_GetCustomerDetailsByEmail(string email)
        {
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetCustomerDetailsByEmail_Result>("sp_GetCustomerDetailsByEmail", emailParameter);
        }
    
        public virtual ObjectResult<sp_GetCustomerDetailsById_Result> sp_GetCustomerDetailsById(Nullable<int> cid)
        {
            var cidParameter = cid.HasValue ?
                new ObjectParameter("cid", cid) :
                new ObjectParameter("cid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetCustomerDetailsById_Result>("sp_GetCustomerDetailsById", cidParameter);
        }
    
        public virtual int sp_login(string email, string password, ObjectParameter success, ObjectParameter roleid, ObjectParameter cid, ObjectParameter custName)
        {
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("password", password) :
                new ObjectParameter("password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_login", emailParameter, passwordParameter, success, roleid, cid, custName);
        }
    }
}
