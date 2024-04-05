using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.User
{
    public partial class razorpay_callBack : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");
        bool isTrue = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string paymentId = Request.Form["razorpay_payment_id"];
                string orderId = Request.Form["razorpay_order_id"];
                string signature = Request.Form["razorpay_signature"];

                string key = "rzp_test_YADStPNuxJlWv6";
                string skey = "cUQq8yEF27Xv8KM6ic6bEJX4";

                RazorpayClient client = new RazorpayClient(key, skey);

                Dictionary<string, string> attributes = new Dictionary<string, string>();
                attributes.Add("razorpay_payment_id", paymentId);
                attributes.Add("razorpay_order_id", orderId);
                attributes.Add("razorpay_signature", signature);

                Utils.verifyPaymentSignature(attributes);
                pTxnId.InnerText = paymentId;
                pOrderId.InnerText = orderId;
                h1Message.InnerText = "Transaction Successfull";

                Response.AppendHeader("Refresh", "0;url=home.aspx");
            }
            catch (Exception)
            {
                h1Message.InnerText = "Transaction Faild";
            }

            decreaseQuantity();
            order();
            ClearCart();
            Session["buyitems"] = null;
        }

        public void decreaseQuantity()
        {
            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int pId = Convert.ToInt16(dt.Rows[i]["pid"]);
                int pQuantity = Convert.ToInt16(dt.Rows[i]["pquantity"]);
                SqlDataAdapter sda = new SqlDataAdapter("Select quantity from Product where Product_id='" + pId + "' ", con);
                DataTable dtble = new DataTable();
                sda.Fill(dtble);
                int quantity = Convert.ToInt16(dtble.Rows[0][0]);
                if (quantity > 0)
                {
                    int reducedQuamtity = quantity - pQuantity;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update Product set quantity='" + reducedQuamtity + "' where Product_id='" + pId + "' ", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    isTrue = true;
                }
                else
                {
                    isTrue = false;
                }
            }
        }

        //Deleting the Product from cart after Payment

        public void ClearCart()
        {
            if (Session["username"] != null)
            {
                DataTable dt = (DataTable)Session["buyitems"];
                
                for (int i = 0; i <= dt.Rows.Count-1; i++)
                {
                    int pId = Convert.ToInt16(dt.Rows[i]["pid"]);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete from CartDetails where ProductId='" + pId + "' and Email='" + Session["username"] + "' ", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
               
            }
            else
            {
                Response.Redirect("~/User/Login.aspx");
            }
        }

        //set order in order DataBase

        public void order()
        {
            if (Session["buyitems"] != null && Session["Orderid"] != null)
            {
                DataTable dt = (DataTable)Session["buyitems"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    string pId = dt.Rows[i]["pid"].ToString();
                    int pQuantity = Convert.ToInt16(dt.Rows[i]["pquantity"]);
                    SqlDataAdapter sda = new SqlDataAdapter("Select quantity from Product where Product_id='" + pId + "' ", con);
                    DataTable dtble = new DataTable();
                    sda.Fill(dtble);
                    int quantity = Convert.ToInt16(dtble.Rows[0][0]);
                    if (quantity > 0)
                    {
                        // Insert Order Details in Table
                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into OrderDetails(orderid,sno,productid,productname,price,quantity,orderdate,email,status,mobile_no,size) values('" + Session["Orderid"] + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["pid"] + ",'" + dt.Rows[i]["pname"] + "'," + dt.Rows[i]["pprice"] + "," + dt.Rows[i]["pquantity"] + ",'" + DateTime.Now.ToString("dd/MM/yyyy") + "','" + Session["username"].ToString() + "','Panding','" + Session["mobile"] + "','"+Session["size"].ToString()+"')", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                //Session["buyitems"] = null;
                
            }
            else
            {
                Response.Redirect("AddtoCart.aspx");
            }
        }
    }
}