using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using CafeShop.Models;
using CafeShop.Models.DTOs;
using CafeShop.Config;

namespace CafeShop.Services
{
    public class PdfService
    {
        public byte[] GenerateInvoicePdf(Order order, List<OrderDetailsDto> orderDetails, string storeName, string storeAddress, string storePhone)
        {
            StringBuilder html = new StringBuilder();
            html.Append("<!DOCTYPE html>");
            html.Append("<html>");
            html.Append("<head>");
            html.Append("<meta charset='UTF-8'>");
            html.Append("<title>Hóa đơn</title>");
            html.Append("<style>");
            html.Append("body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }");
            html.Append(".invoice-container { max-width: 800px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; }");
            html.Append(".invoice-header { text-align: center; margin-bottom: 20px; }");
            html.Append(".invoice-header h1 { margin-bottom: 5px; color: #333; }");
            html.Append(".invoice-details { margin-bottom: 20px; }");
            html.Append(".invoice-details p { margin: 5px 0; }");
            html.Append(".invoice-items { width: 100%; border-collapse: collapse; margin-bottom: 20px; }");
            html.Append(".invoice-items th, .invoice-items td { padding: 10px; border: 1px solid #ddd; text-align: left; }");
            html.Append(".invoice-items th { background-color: #f5f5f5; }");
            html.Append(".invoice-total { text-align: right; margin-top: 20px; font-weight: bold; }");
            html.Append(".invoice-footer { margin-top: 30px; text-align: center; font-size: 14px; color: #777; }");
            html.Append("</style>");
            html.Append("</head>");
            html.Append("<body>");
            html.Append("<div class='invoice-container'>");

            html.Append("<div class='invoice-header'>");
            html.Append($"<h1>{storeName}</h1>");
            html.Append($"<p>{storeAddress}</p>");
            html.Append($"<p>Điện thoại: {storePhone}</p>");
            html.Append("<h2>HÓA ĐƠN THANH TOÁN</h2>");
            html.Append("</div>");

            html.Append("<div class='invoice-details'>");
            html.Append("<div style='display: flex; justify-content: space-between;'>");
            html.Append("<div>");
            html.Append($"<p><strong>Mã đơn hàng:</strong> #{order.OrderCode}</p>");
            html.Append($"<p><strong>Ngày:</strong> {(order.CreateDate?.ToString("dd/MM/yyyy HH:mm") ?? DateTime.Now.ToString("dd/MM/yyyy HH:mm"))}</p>");
            html.Append("</div>");
            html.Append("<div>");
            html.Append($"<p><strong>Khách hàng:</strong> {order.CustomerName}</p>");
            html.Append($"<p><strong>Địa chỉ:</strong> {order.Address}</p>");
            html.Append($"<p><strong>Điện thoại:</strong> {order.PhoneNumber}</p>");
            html.Append("</div>");
            html.Append("</div>");
            html.Append("</div>");

            html.Append("<table class='invoice-items'>");
            html.Append("<thead>");
            html.Append("<tr>");
            html.Append("<th>STT</th>");
            html.Append("<th>Sản phẩm</th>");
            html.Append("<th>SL</th>");
            html.Append("<th>Đơn giá</th>");
            html.Append("<th>Thành tiền</th>");
            html.Append("</tr>");
            html.Append("</thead>");
            html.Append("<tbody>");

            decimal totalAmount = 0;
            for (int i = 0; i < orderDetails.Count; i++)
            {
                var detail = orderDetails[i];
                totalAmount += detail.TotalMoney;

                // Kiểm tra số lượng và tính đơn giá
                Console.WriteLine($"PdfService: Processing product: {detail.ProductName}, Quantity: {detail.Quantity}, TotalMoney: {detail.TotalMoney}");

                decimal unitPrice = 0;
                if (detail.Quantity > 0)
                {
                    unitPrice = detail.TotalMoney / detail.Quantity;
                }
                else
                {
                    Console.WriteLine($"PdfService: Warning - Quantity is {detail.Quantity} for product {detail.ProductName}");
                    unitPrice = detail.TotalMoney;
                }

                html.Append("<tr>");
                html.Append($"<td>{i + 1}</td>");

                html.Append("<td>");
                Console.WriteLine($"PdfService: Using product name: {detail.ProductName}");
                html.Append($"{detail.ProductName}");
                if (detail.lstTopping != null && detail.lstTopping.Count > 0)
                {
                    foreach (var topping in detail.lstTopping)
                    {
                        html.Append($"<br/>+ {topping.ToppingName}");
                    }
                }
                html.Append("</td>");

                html.Append($"<td>{detail.Quantity}</td>");
                html.Append($"<td style='text-align: right;'>{unitPrice.ToString("#,##0")} đ</td>");
                html.Append($"<td style='text-align: right;'>{detail.TotalMoney.ToString("#,##0")} đ</td>");
                html.Append("</tr>");
            }

            html.Append("</tbody>");
            html.Append("<tfoot>");
            html.Append("<tr>");
            html.Append("<td colspan='4' style='text-align: right;'><strong>Tổng tiền hàng:</strong></td>");
            html.Append($"<td style='text-align: right;'><strong>{totalAmount.ToString("#,##0")} đ</strong></td>");
            html.Append("</tr>");
            html.Append("<tr>");
            html.Append("<td colspan='4' style='text-align: right;'><strong>Phí vận chuyển:</strong></td>");
            html.Append("<td style='text-align: right;'><strong>25,000 đ</strong></td>");
            html.Append("</tr>");
            html.Append("<tr style='background-color: #f8f9fa;'>");
            html.Append("<td colspan='4' style='text-align: right;'><strong>Tổng thanh toán:</strong></td>");
            html.Append($"<td style='text-align: right;'><strong>{(totalAmount + 25000).ToString("#,##0")} đ</strong></td>");
            html.Append("</tr>");
            html.Append("</tfoot>");
            html.Append("</table>");

            html.Append("<div class='invoice-details'>");
            html.Append($"<p><strong>Phương thức thanh toán:</strong> {(order.ReasonCancel == "Thanh toán qua VNPay" ? "VNPay" : "Tiền mặt")}</p>");
            html.Append("<p><strong>Trạng thái thanh toán:</strong> Đã thanh toán</p>");
            html.Append("</div>");

            html.Append("<div class='invoice-footer'>");
            html.Append("<p>Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi!</p>");
            html.Append("</div>");

            html.Append("</div>");
            html.Append("</body>");
            html.Append("</html>");

            byte[] bytes = Encoding.UTF8.GetBytes(html.ToString());
            return bytes;
        }
    }
}
