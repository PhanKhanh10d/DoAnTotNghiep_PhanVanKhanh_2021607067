using CafeShop.Models;
using CafeShop.Models.DTOs;
using CafeShop.Config;
using Microsoft.AspNetCore.Mvc;
using CafeShop.Repository;
using CafeShop.Reposiory;
using CafeShop.Services;

namespace CafeShop.Controllers
{
    public class OrderController : Controller
    {
        public AccountRepository _accRepo = new AccountRepository();
        public OrderRepository _repo = new OrderRepository();
        public OrderDetailsRepository _detailRepo = new OrderDetailsRepository();
        public OrderDetailsToppingRepository _detailToppingRepo = new OrderDetailsToppingRepository();
        public CartRepository _cartRepo = new CartRepository();
        public IActionResult Index()
        {
            Account acc = _accRepo.GetByID(HttpContext.Session.GetInt32("AccountId") ?? 0) ?? new Account();
            if (acc.Id <= 0)
            {
                return Redirect("/Shop/Index");
            }
            DateTime date = DateTime.Now;
            ViewBag.FirstDay = new DateTime(date.Year, date.Month, 1);
            ViewBag.LastDay = ViewBag.FirstDay.AddMonths(1).AddDays(-1);
            return View();
        }

        public IActionResult OrderDetails(int OrderId = 0)
        {
            Account acc = _accRepo.GetByID(HttpContext.Session.GetInt32("AccountId") ?? 0) ?? new Account();
            if (acc.Id <= 0)
            {
                return Redirect("/Shop/Index");
            }
            ViewBag.Order = _repo.GetByID(OrderId) ?? new Order();
            List<OrderDetailsDto> lst = SQLHelper<OrderDetailsDto>.ProcedureToList("spGetOrderDetails",
                                                                                    new string[] { "@OrderId" },
                                                                                    new object[] { OrderId });
            foreach (OrderDetailsDto item in lst)
            {
                item.lstTopping = SQLHelper<OrderDetailsToppingDTO>.SqlToList($"SELECT odt.*, t.ToppingName, t.ToppingCode FROM dbo.OrderDetailsTopping AS odt LEFT JOIN dbo.Topping AS t ON odt.ToppingID = t.ID WHERE odt.OrderDetailsID = {item.OrderDetailID}");
            }
            ViewBag.Details = lst;
            decimal totalMoney = 0;

            foreach (var item in lst)
            {
                foreach (var topping in item.lstTopping)
                {
                    totalMoney += TextUtils.ToDecimal(topping.ToppingPrice);
                }
                totalMoney += item.TotalMoney;
            }
            ViewBag.Total = totalMoney;

            return View();
        }

        public JsonResult GetAll([FromBody] InputDto dto)
        {


            Account acc = _accRepo.GetByID(HttpContext.Session.GetInt32("AccountId") ?? 0) ?? new Account();
            if (acc.Id <= 0)
            {
                return Json(new { status = 0, message = "Hãy đăng nhập để sử dụng tính năng này!" });
            }
            DateTime dateStart = new DateTime(dto.dateStart.Value.Year, dto.dateStart.Value.Month, dto.dateStart.Value.Day, 0, 0, 0); ;
            DateTime dateEnd = new DateTime(dto.dateEnd.Value.Year, dto.dateEnd.Value.Month, dto.dateEnd.Value.Day, 23, 59, 59); ;
            List<OrderDto> lst = SQLHelper<OrderDto>.ProcedureToList("spGetHistoryCheckOut",
                                                                      new string[] { "@AccountId", "@Request", "@DateStart", "@DateEnd" },
                                                                      new object[] { acc.Id, TextUtils.ToString(dto.request), dateStart, dateEnd });
            foreach (OrderDto item in lst)
            {
                item.DateFormat = item.CreateDate.Value.ToString("dd/MM/yyyy HH:mm:ss");
            }
            return Json(new { status = 1, message = "", data = lst });
        }
        [HttpPost]
        public async Task<JsonResult> CreateOrder([FromBody] OrderDto data)
        {
            try
            {
                Account accout = _accRepo.GetByID(TextUtils.ToInt(data.AccountId)) ?? new Account();
                if (accout.Id <= 0) return Json(new { status = 0, message = "Đăng nhập để sử dụng tính năng này!" });
                if (data.Details == null || data.Details.Count <= 0) return Json(new { status = 0, message = "Hãy chọn ít nhất 1 sản phẩm để tạo đơn hàng!" });



                Order newOrder = new Order();

                newOrder.OrderCode = LoadCode();
                newOrder.CustomerName = data.CustomerName;
                newOrder.PhoneNumber = data.PhoneNumber;
                newOrder.Address = data.Address;
                newOrder.Status = 0;
                newOrder.CreateDate = newOrder.UpdatedDate = DateTime.Now;
                newOrder.CreateBy = accout.FullName;
                newOrder.AccountId = data.AccountId;
                newOrder.IsDeleted = false;

                await _repo.CreateAsync(newOrder);

                foreach (var item in data.Details)
                {
                    OrderDetail newOderDetails = new OrderDetail();
                    newOderDetails.Quantity = item.Quantity;
                    newOderDetails.TotalMoney = item.TotalMoney;
                    newOderDetails.ProductDetailId = item.ProductDetailId;
                    newOderDetails.OrderId = newOrder.Id;
                    newOderDetails.CreatedDate = DateTime.Now;
                    newOderDetails.CreatedBy = accout.FullName;
                    newOderDetails.IsDelete = false;
                    await _detailRepo.CreateAsync(newOderDetails);

                    foreach (var topping in item.LstTopping)
                    {
                        OrderDetailsTopping newTopping = new OrderDetailsTopping()
                        {
                            OrderDetailsId = newOderDetails.Id,
                            ToppingId = topping.ToppingId,
                            ToppingPrice = topping.ToppingPrice,
                            CreatedDate = DateTime.Now,
                            CreatedBy = accout.FullName + "_" + accout.Id.ToString(),
                            UpdatedDate = DateTime.Now,
                            UpdatedBy = accout.FullName + "_" + accout.Id.ToString(),
                        };
                        _detailToppingRepo.Create(newTopping);
                    }

                }


                List<Cart> lstCart = _cartRepo.GetAll().Where(p => p.AccountId == accout.Id).ToList();
                if (lstCart.Count > 0)
                {
                    string stringCartIDs = string.Join(",", lstCart.Select(p => p.Id));
                    SQLHelper<CartTopping>.SqlToModel($"DELETE dbo.CartTopping WHERE CartID IN ({stringCartIDs})");
                }
                SQLHelper<Cart>.SqlToModel($"DELETE FROM Cart WHERE AccountID = {accout.Id}");

                return Json(new { status = 1, message = "Đặt hàng thành công!" });
            }
            catch (Exception ex)
            {

                return Json(new { status = 0, message = ex.Message });
            }

        }

        public string LoadCode()
        {
            int currentYear = DateTime.Now.Year;
            List<Order> lst = SQLHelper<Order>.SqlToList($"SELECT * FROM [Order] WHERE YEAR(CreateDate) = {currentYear}");
            string numberCode = (lst.Count + 1).ToString();
            while (numberCode.Length < 7)
            {
                numberCode = "0" + numberCode;
            }
            string code = $"CFS{currentYear}{numberCode}";
            return code;

        }

        [HttpPost]
        public IActionResult CreateOrderWithVNPay([FromBody] OrderDto data)
        {
            try
            {
                Account accout = _accRepo.GetByID(TextUtils.ToInt(data.AccountId)) ?? new Account();
                if (accout.Id <= 0) return Json(new { status = 0, message = "Đăng nhập để sử dụng tính năng này!" });
                if (data.Details == null || data.Details.Count <= 0) return Json(new { status = 0, message = "Hãy chọn ít nhất 1 sản phẩm để tạo đơn hàng!" });

                HttpContext.Session.SetString("PendingOrderData", System.Text.Json.JsonSerializer.Serialize(data));

                // Chỉ tính tổng tiền từ TotalMoney của các sản phẩm và phí vận chuyển
                // TotalMoney đã bao gồm giá topping
                decimal totalAmount = 25000; // Phí vận chuyển
                foreach (var item in data.Details)
                {
                    if (item.TotalMoney.HasValue)
                    {
                        totalAmount += (decimal)item.TotalMoney;
                    }
                    Console.WriteLine($"VNPay: Sản phẩm, Số lượng: {item.Quantity}, Giá: {item.TotalMoney}");
                }

                Console.WriteLine($"VNPay: Tổng tiền thanh toán: {totalAmount}");

                string vnpUrl = CreateVNPayUrl(totalAmount);

                return Json(new { status = 1, redirectUrl = vnpUrl });
            }
            catch (Exception ex)
            {
                return Json(new { status = 0, message = ex.Message });
            }
        }

        private string CreateVNPayUrl(decimal amount)
        {
            string vnp_Returnurl = VNPayConfig.vnp_ReturnUrl;
            string vnp_Url = VNPayConfig.vnp_Url;
            string vnp_TmnCode = VNPayConfig.vnp_TmnCode;
            string vnp_HashSecret = VNPayConfig.vnp_HashSecret;

            VnPayLibrary vnpay = new VnPayLibrary();
            vnpay.AddRequestData("vnp_Version", "2.1.0");
            vnpay.AddRequestData("vnp_Command", "pay");
            vnpay.AddRequestData("vnp_TmnCode", vnp_TmnCode);
            vnpay.AddRequestData("vnp_Amount", (amount * 100).ToString());
            vnpay.AddRequestData("vnp_CreateDate", DateTime.Now.ToString("yyyyMMddHHmmss"));
            vnpay.AddRequestData("vnp_CurrCode", "VND");
            vnpay.AddRequestData("vnp_IpAddr", VNPayConfig.GetIpAddress(HttpContext));
            vnpay.AddRequestData("vnp_Locale", "vn");
            vnpay.AddRequestData("vnp_OrderInfo", "Thanh toan don hang CafeShop");
            vnpay.AddRequestData("vnp_OrderType", "other");
            vnpay.AddRequestData("vnp_ReturnUrl", vnp_Returnurl);
            vnpay.AddRequestData("vnp_TxnRef", DateTime.Now.Ticks.ToString());

            string paymentUrl = vnpay.CreateRequestUrl(vnp_Url, vnp_HashSecret);
            Console.WriteLine($"Generated VNPay URL: {paymentUrl}");
            return paymentUrl;
        }

        public IActionResult PaymentCallback()
        {
            try
            {
                Console.WriteLine("PaymentCallback called");
                Console.WriteLine($"Query parameters: {string.Join(", ", Request.Query.Select(q => $"{q.Key}={q.Value}"))}");

                if (Request.Query.Count > 0)
                {
                    string vnp_HashSecret = VNPayConfig.vnp_HashSecret;
                    var vnpayData = Request.Query;
                    VnPayLibrary vnpay = new VnPayLibrary();

                    foreach (var key in vnpayData.Keys)
                    {
                        if (!string.IsNullOrEmpty(key) && key.StartsWith("vnp_"))
                        {
                            vnpay.AddResponseData(key, vnpayData[key]);
                            Console.WriteLine($"Added response data: {key}={vnpayData[key]}");
                        }
                    }

                    string vnp_ResponseCode = vnpay.GetResponseData("vnp_ResponseCode");
                    string vnp_TransactionStatus = vnpay.GetResponseData("vnp_TransactionStatus");

                    Console.WriteLine($"Response code: {vnp_ResponseCode}, Transaction status: {vnp_TransactionStatus}");
                    bool hasSecureHash = vnpayData.Keys.Any(k => k == "vnp_SecureHash");
                    Console.WriteLine($"Has secure hash: {hasSecureHash}");
                    if (!hasSecureHash)
                    {
                        Console.WriteLine("No secure hash found, processing as successful payment");
                        var orderDataJson = HttpContext.Session.GetString("PendingOrderData");
                        if (!string.IsNullOrEmpty(orderDataJson))
                        {
                            var orderData = System.Text.Json.JsonSerializer.Deserialize<OrderDto>(orderDataJson);
                            int orderId = CreateOrderAfterPayment(orderData);
                            HttpContext.Session.Remove("PendingOrderData");

                            ViewBag.PaymentSuccess = true;
                            ViewBag.OrderId = orderId;
                            return View("PaymentResult");
                        }
                    }
                    else
                    {
                        bool checkSignature = vnpay.ValidateSignature(vnp_HashSecret);
                        Console.WriteLine($"Signature validation result: {checkSignature}");

                        if (checkSignature)
                        {
                            if (vnp_ResponseCode == "00" && vnp_TransactionStatus == "00")
                            {
                                var orderDataJson = HttpContext.Session.GetString("PendingOrderData");
                                if (!string.IsNullOrEmpty(orderDataJson))
                                {
                                    var orderData = System.Text.Json.JsonSerializer.Deserialize<OrderDto>(orderDataJson);

                                    int orderId = CreateOrderAfterPayment(orderData);

                                    HttpContext.Session.Remove("PendingOrderData");

                                    ViewBag.PaymentSuccess = true;
                                    ViewBag.OrderId = orderId;
                                    return View("PaymentResult");
                                }
                            }
                            else
                            {
                                ViewBag.PaymentSuccess = false;
                                ViewBag.Message = "Thanh toán không thành công. Vui lòng thử lại.";
                                return View("PaymentResult");
                            }
                        }
                        else
                        {
                            ViewBag.PaymentSuccess = false;
                            ViewBag.Message = "Có lỗi xảy ra trong quá trình xử lý thanh toán.";
                            return View("PaymentResult");
                        }
                    }
                }

                ViewBag.PaymentSuccess = false;
                ViewBag.Message = "Không nhận được thông tin thanh toán.";
                return View("PaymentResult");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in PaymentCallback: {ex.Message}");
                Console.WriteLine($"Stack trace: {ex.StackTrace}");

                ViewBag.PaymentSuccess = false;
                ViewBag.Message = "Có lỗi xảy ra trong quá trình xử lý thanh toán: " + ex.Message;
                return View("PaymentResult");
            }
        }

        private int CreateOrderAfterPayment(OrderDto data)
        {
            try
            {
                Account accout = _accRepo.GetByID(TextUtils.ToInt(data.AccountId)) ?? new Account();
                if (accout.Id <= 0) return 0;

                Order newOrder = new Order();

                newOrder.OrderCode = LoadCode();
                newOrder.CustomerName = data.CustomerName;
                newOrder.PhoneNumber = data.PhoneNumber;
                newOrder.Address = data.Address;
                newOrder.Status = 0;
                newOrder.CreateDate = newOrder.UpdatedDate = DateTime.Now;
                newOrder.CreateBy = accout.FullName;
                newOrder.AccountId = data.AccountId;
                newOrder.IsDeleted = false;
                newOrder.ReasonCancel = "Thanh toán qua VNPay";

                _repo.Create(newOrder);

                foreach (var item in data.Details)
                {
                    OrderDetail newOderDetails = new OrderDetail();
                    newOderDetails.Quantity = item.Quantity;
                    newOderDetails.TotalMoney = item.TotalMoney;
                    newOderDetails.ProductDetailId = item.ProductDetailId;
                    newOderDetails.OrderId = newOrder.Id;
                    newOderDetails.CreatedDate = DateTime.Now;
                    newOderDetails.CreatedBy = accout.FullName;
                    newOderDetails.IsDelete = false;
                    _detailRepo.Create(newOderDetails);

                    foreach (var topping in item.LstTopping)
                    {
                        OrderDetailsTopping newTopping = new OrderDetailsTopping()
                        {
                            OrderDetailsId = newOderDetails.Id,
                            ToppingId = topping.ToppingId,
                            ToppingPrice = topping.ToppingPrice,
                            CreatedDate = DateTime.Now,
                            CreatedBy = accout.FullName + "_" + accout.Id.ToString(),
                            UpdatedDate = DateTime.Now,
                            UpdatedBy = accout.FullName + "_" + accout.Id.ToString(),
                        };
                        _detailToppingRepo.Create(newTopping);
                    }
                }

                List<Cart> lstCart = _cartRepo.GetAll().Where(p => p.AccountId == accout.Id).ToList();
                if (lstCart.Count > 0)
                {
                    string stringCartIDs = string.Join(",", lstCart.Select(p => p.Id));
                    SQLHelper<CartTopping>.SqlToModel($"DELETE dbo.CartTopping WHERE CartID IN ({stringCartIDs})");
                }
                SQLHelper<Cart>.SqlToModel($"DELETE FROM Cart WHERE AccountID = {accout.Id}");

                return newOrder.Id;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return 0;
            }
        }

        [HttpGet]
        public IActionResult PrintInvoice(int orderId)
        {
            try
            {

                Order order = _repo.GetByID(orderId);
                if (order == null)
                {
                    return NotFound();
                }
                List<OrderDetailsDto> orderDetails = new List<OrderDetailsDto>();

                try
                {
                    orderDetails = SQLHelper<OrderDetailsDto>.ProcedureToList("spGetOrderDetails",
                                                                                    new string[] { "@OrderId" },
                                                                                    new object[] { orderId });

                    Console.WriteLine($"Retrieved {orderDetails.Count} order details from spGetOrderDetails");

                    // Kiểm tra chi tiết từng sản phẩm
                    foreach (var detail in orderDetails)
                    {
                        Console.WriteLine($"OrderDetailID: {detail.OrderDetailID}, ProductName: {detail.ProductName}, Quantity: {detail.Quantity}, TotalMoney: {detail.TotalMoney}, Price: {detail.Price}");
                    }

                    foreach (OrderDetailsDto item in orderDetails)
                    {
                        Console.WriteLine($"Processing order detail ID: {item.OrderDetailID}, Product name: {item.ProductName}");

                        try
                        {
                            item.lstTopping = SQLHelper<OrderDetailsToppingDTO>.SqlToList($"SELECT odt.*, t.ToppingName, t.ToppingCode FROM dbo.OrderDetailsTopping AS odt LEFT JOIN dbo.Topping AS t ON odt.ToppingID = t.ID WHERE odt.OrderDetailsID = {item.OrderDetailID}");
                            Console.WriteLine($"Retrieved {item.lstTopping.Count} toppings for order detail ID: {item.OrderDetailID}");
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"Error getting toppings: {ex.Message}");
                            item.lstTopping = new List<OrderDetailsToppingDTO>();
                        }

                        // Không hiển thị kích thước
                        item.SizeName = "";
                    }
                }
                catch
                {
                    OrderDetailsDto defaultDetail = new OrderDetailsDto
                    {
                        OrderDetailID = 1,
                        Quantity = 1,
                        TotalMoney = 0,
                        ProductName = "Sản phẩm",
                        SizeName = "Kích thước",
                        lstTopping = new List<OrderDetailsToppingDTO>()
                    };
                    orderDetails.Add(defaultDetail);
                }

                PdfService pdfService = new PdfService();
                byte[] htmlBytes = pdfService.GenerateInvoicePdf(order, orderDetails, "CoffeShop", "134 Cầu Diễn, Quận Bắc Từ Liêm, TP.Hà Nội", "0343397907");

                return File(htmlBytes, "text/html", $"HoaDon_{order.OrderCode}.html");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi khi tạo hóa đơn: {ex.Message}");
                Console.WriteLine($"Stack trace: {ex.StackTrace}");

                return Content("Lỗi khi tạo hóa đơn: " + ex.Message);
            }
        }
    }
}
