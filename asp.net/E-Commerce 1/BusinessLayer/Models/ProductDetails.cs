using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Models
{
    public class ProductDetails
    {
        public int PorductId { get; set; }

        [Required(ErrorMessage = "Product Name is required")]
        public string PorductName { get; set; }

        [Required(ErrorMessage = "Product Description is required")]
        public string ProductDescription { get; set; }
        public System.DateTime LastModified { get; set; }
        public System.DateTime AddedOn { get; set; }

        [Required(ErrorMessage = "Product Price is required")]
        public decimal ProductPrice { get; set; }
        public Nullable<int> AddedBy { get; set; }
        public Nullable<bool> isDeleted { get; set; }

        [Required(ErrorMessage = "Product Quantity is required")]
        public Nullable<int> ProductQuantity { get; set; }
        public Nullable<int> LastModifiedBy { get; set; }

        [Required(ErrorMessage = "Product Image is required")]
        public string ProductImage { get; set; }
    }
}
