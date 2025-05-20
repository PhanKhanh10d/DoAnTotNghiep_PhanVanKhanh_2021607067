using System.Globalization;
using System.Net;
using System.Text;

namespace CafeShop.Config
{
    public class VnPayLibrary
    {
        private readonly SortedList<string, string> _requestData = new SortedList<string, string>(new VnPayCompare());
        private readonly SortedList<string, string> _responseData = new SortedList<string, string>(new VnPayCompare());

        public void AddRequestData(string key, string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                _requestData.Add(key, value);
            }
        }

        public void AddResponseData(string key, string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                _responseData.Add(key, value);
            }
        }

        public string GetResponseData(string key)
        {
            return _responseData.TryGetValue(key, out string retValue) ? retValue : string.Empty;
        }

        public string CreateRequestUrl(string baseUrl, string vnp_HashSecret)
        {
            StringBuilder data = new StringBuilder();
            foreach (KeyValuePair<string, string> kv in _requestData)
            {
                if (!string.IsNullOrEmpty(kv.Value))
                {
                    data.Append(WebUtility.UrlEncode(kv.Key) + "=" + WebUtility.UrlEncode(kv.Value) + "&");
                }
            }

            string queryString = data.ToString();
            string signData = queryString;
            if (signData.Length > 0)
            {
                signData = signData.Remove(signData.Length - 1, 1);
            }

            string vnp_SecureHash = VNPayConfig.HmacSHA512(vnp_HashSecret, signData);

            baseUrl += "?" + queryString;
            if (!baseUrl.EndsWith("&")) {
                baseUrl += "&";
            }
            baseUrl += "vnp_SecureHash=" + vnp_SecureHash;

            Console.WriteLine($"VNPay URL created: {baseUrl}");
            return baseUrl;
        }

        public bool ValidateSignature(string inputHash)
        {
            if (!_responseData.ContainsKey("vnp_SecureHash"))
            {
                Console.WriteLine("vnp_SecureHash not found in response data");
                return false;
            }

            string secureHash = _responseData["vnp_SecureHash"];

            string rspRaw = GetResponseData();
            string myChecksum = VNPayConfig.HmacSHA512(inputHash, rspRaw);
            bool isValid = myChecksum.Equals(secureHash, StringComparison.InvariantCultureIgnoreCase);

            Console.WriteLine($"Validating signature: {isValid}");
            Console.WriteLine($"Expected: {myChecksum}");
            Console.WriteLine($"Actual: {secureHash}");

            return isValid;
        }

        private string GetResponseData()
        {
            StringBuilder data = new StringBuilder();
            if (_responseData.ContainsKey("vnp_SecureHashType"))
            {
                _responseData.Remove("vnp_SecureHashType");
            }
            if (_responseData.ContainsKey("vnp_SecureHash"))
            {
                _responseData.Remove("vnp_SecureHash");
            }

            foreach (KeyValuePair<string, string> kv in _responseData)
            {
                if (!string.IsNullOrEmpty(kv.Value))
                {
                    data.Append(WebUtility.UrlEncode(kv.Key) + "=" + WebUtility.UrlEncode(kv.Value) + "&");
                }
            }

            if (data.Length > 0)
            {
                data.Remove(data.Length - 1, 1);
            }

            return data.ToString();
        }
    }

    public class VnPayCompare : IComparer<string>
    {
        public int Compare(string x, string y)
        {
            if (x == y) return 0;
            if (x == null) return -1;
            if (y == null) return 1;
            var vnpCompare = CompareInfo.GetCompareInfo("en-US");
            return vnpCompare.Compare(x, y, CompareOptions.Ordinal);
        }
    }
}
