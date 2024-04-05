using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.User
{
    public partial class Payment : System.Web.UI.Page
    {
        public string orderId;
        public string amount;
        public string contact;
        public string name;
        public string product;
        public string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            amount = (Convert.ToInt32(Session["totalprice"]) * 100).ToString();
            contact = Session["mobile"].ToString();
            name = Session["name"].ToString();
            //product = Session["product"].ToString();
            email = Session["username"].ToString();

            Dictionary<string, object> input = new Dictionary<string, object>();
            input.Add("amount", amount);
            input.Add("Currency", "INR");
            input.Add("payment_capture", 1);

            string key = "rzp_test_FlDmsLBkpdQfGP";
            string skey = "vB0QSYwcyIS9UYJEmOUSJowc";

            RazorpayClient client = new RazorpayClient(key, skey);

            Razorpay.Api.Order order = client.Order.Create(input);
            orderId = order["id"].ToString();

            
        }
    }
}
}