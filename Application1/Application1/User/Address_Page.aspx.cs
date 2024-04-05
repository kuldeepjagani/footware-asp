using Newtonsoft.Json;
using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.User
{
    public partial class Address_Page : System.Web.UI.Page
    {
        private const string _key = "rzp_test_YADStPNuxJlWv6";
        private const string _secret = "cUQq8yEF27Xv8KM6ic6bEJX4";
        private const decimal registrationAmount = 100;
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from User_Register where Email_id='" + Session["username"].ToString() + "'", con);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                TextBox1.Text = sdr.GetValue(1).ToString();
                TextBox2.Text = sdr.GetValue(4).ToString();
                
            }
            con.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        { 
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Customer_Address (First_name,Mobile_no,Pin,State,City,House_building,Road_area_colony,Email) values (@First_name,@Mobile_no,@Pin,@State,@City,@House_building,@Road_area_colony,@Email)", con);
            cmd.Parameters.AddWithValue("@First_name", Session["name"] = TextBox1.Text);
            cmd.Parameters.AddWithValue("@Mobile_no", Session["mobile"] = TextBox2.Text);
            cmd.Parameters.AddWithValue("@Pin", Session["pin"] = TextBox3.Text);
            cmd.Parameters.AddWithValue("@State", Session["state"] = TextBox5.Text);
            cmd.Parameters.AddWithValue("@City", Session["city"] = TextBox6.Text);
            cmd.Parameters.AddWithValue("@House_building", TextBox7.Text);
            cmd.Parameters.AddWithValue("@Road_area_colony", Session["colony"] = TextBox8.Text);
            cmd.Parameters.AddWithValue("@Email", Session["username"]);
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect(string.Format("razorpay_checkout.aspx?Name={0}&Email={1}&Contact={2}&Product={3}&Amount={4}", TextBox1.Text, Session["username"].ToString(), TextBox2.Text, Session["product"].ToString(), Session["totalprice"].ToString()));
            //clear();
            //Response.Redirect("Payment.aspx");


            decimal amountinSubunits = registrationAmount * 100;
            string currency = "INR";
            string name = "Skynet";
            string description = "Razorpay Payment Gateway Demo";
            string imageLogo = "";
            string profileName = TextBox1.Text;
            string profileMobile = TextBox2.Text;
            string profileEmail = Session["username"].ToString();
            Dictionary<string, string> notes = new Dictionary<string, string>()
            {
                { "note 1", "this is a payment note" }, { "note 2", "here another note, you can add max 15 notes" }
            };

            string orderId = CreateOrder(amountinSubunits, currency, notes);

            string jsFunction = "OpenPaymentWindow('" + _key + "', '" + amountinSubunits + "', '" + currency + "', '" + name + "', '" + description + "', '" + imageLogo + "', '" + orderId + "', '" + profileName + "', '" + profileEmail + "', '" + profileMobile + "', '" + JsonConvert.SerializeObject(notes) + "');";
            ClientScript.RegisterStartupScript(this.GetType(), "OpenPaymentWindow", jsFunction, true);
        }


        private string CreateOrder(decimal amountInSubunits, string currency, Dictionary<string, string> notes)
        {
            try
            {
                int paymentCapture = 1;

                RazorpayClient client = new RazorpayClient(_key, _secret);
                Dictionary<string, object> options = new Dictionary<string, object>();
                options.Add("amount", amountInSubunits);
                options.Add("currency", currency);
                options.Add("payment_capture", paymentCapture);
                options.Add("notes", notes);

                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                System.Net.ServicePointManager.Expect100Continue = false;

                Order orderResponse = client.Order.Create(options);
                var orderId = orderResponse.Attributes["id"].ToString();
                return orderId;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public void clear()
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;
            TextBox7.Text = string.Empty;
            TextBox8.Text = string.Empty;


        }

    }
}