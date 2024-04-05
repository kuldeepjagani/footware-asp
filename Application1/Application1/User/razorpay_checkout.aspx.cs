using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.User
{
    public partial class razorpay_checkout : System.Web.UI.Page
    {
        public string orderId;
        public string amount;
        public string contact;
        public string name;
        public string product;
        public string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            amount = (Convert.ToInt32(Request.QueryString["Amount"]) * 100).ToString();
            contact = Request.QueryString["Contact"].ToString();
            name = Request.QueryString["Name"].ToString();
            product = Request.QueryString["Product"].ToString();
            email = Request.QueryString["Email"].ToString();

            Dictionary<string, object> input = new Dictionary<string, object>();
            input.Add("amount", amount);
            input.Add("currency", "INR");
            input.Add("payment_capture", 1);

            string key = "rzp_test_YADStPNuxJlWv6";
            string skey = "cUQq8yEF27Xv8KM6ic6bEJX4";

            RazorpayClient client = new RazorpayClient(key, skey);

            Razorpay.Api.Order order = client.Order.Create(input);
            orderId = order["id"].ToString();

        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddtoCart.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}