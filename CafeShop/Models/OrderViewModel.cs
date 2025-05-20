namespace CafeShop.Models
{
    public class OrderViewModel
    {
        public string FullName { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Note { get; set; }
        public decimal TotalAmount { get; set; }
        public List<OrderDetailViewModel> OrderDetails { get; set; }
    }

    public class OrderDetailViewModel
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal TotalAmount { get; set; }
        public List<OrderDetailToppingViewModel> Toppings { get; set; }
    }

    public class OrderDetailToppingViewModel
    {
        public int ToppingId { get; set; }
        public decimal Price { get; set; }
    }
}
