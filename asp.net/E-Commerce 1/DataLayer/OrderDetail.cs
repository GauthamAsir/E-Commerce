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
    using System.Collections.Generic;
    
    public partial class OrderDetail
    {
        public int OrderId { get; set; }
        public Nullable<int> PaymentId { get; set; }
        public Nullable<int> CustomerId { get; set; }
        public System.DateTime OrderPlacedOn { get; set; }
        public Nullable<System.DateTime> LastModifiedOn { get; set; }
        public Nullable<int> LastModifiedBy { get; set; }
        public Nullable<int> OrderStatusId { get; set; }
        public string OrderMessage { get; set; }
    
        public virtual CustomerDetail CustomerDetail { get; set; }
        public virtual CustomerDetail CustomerDetail1 { get; set; }
        public virtual OrderStatu OrderStatu { get; set; }
    }
}
