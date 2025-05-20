using System.Security.Cryptography;
using System.Text;

namespace CafeShop.Config
{
    public class VNPayConfig
    {
        public static string vnp_TmnCode = "DGZWH9KH";
        public static string vnp_HashSecret = "GMPIQM08QMAFKSUEVVQZXV04UXYUL52A";
        public static string vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        public static string vnp_ReturnUrl = "https://localhost:7116/Order/PaymentCallback"; 
        public static string vnp_ApiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";

        public static string GetIpAddress(HttpContext context)
        {
            string ipAddress;
            try
            {
                ipAddress = context.Connection.RemoteIpAddress.ToString();
                if (string.IsNullOrEmpty(ipAddress) || ipAddress.ToLower() == "unknown" || ipAddress.Length > 45)
                    ipAddress = "127.0.0.1";
            }
            catch (Exception ex)
            {
                ipAddress = "127.0.0.1";
            }
            return ipAddress;
        }

        public static string HmacSHA512(string key, string inputData)
        {
            var hash = new StringBuilder();
            byte[] keyBytes = Encoding.UTF8.GetBytes(key);
            byte[] inputBytes = Encoding.UTF8.GetBytes(inputData);
            using (var hmac = new HMACSHA512(keyBytes))
            {
                byte[] hashValue = hmac.ComputeHash(inputBytes);
                foreach (var theByte in hashValue)
                {
                    hash.Append(theByte.ToString("x2"));
                }
            }
            return hash.ToString();
        }
    }
}
