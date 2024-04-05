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
    public partial class user_ms : System.Web.UI.MasterPage
    {

        string str1 = @"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            if (dt != null)
            {
                Label2.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label2.Text = "0";
            }

            SqlConnection con = new SqlConnection(str1);
            con.Open();
            SqlCommand cmd = new SqlCommand("select Name from User_Register where Email_id=@article_id", con);
            cmd.Parameters.AddWithValue("@article_id", Session["username"].ToString());
            Label1.Text = cmd.ExecuteScalar().ToString();

            con.Close();

            // Label1.Text= " "+ sda;

        }

        protected void cart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddtoCart.aspx");
            //Server.Transfer("order-details.aspx", true);
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

        //Auto Complite Search Text Box
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchUser(string prefixText)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");
            SqlDataAdapter da;
            DataTable dt;
            DataTable result = new DataTable();
            string str = "select Product_name from Product where Product_name like'%" + prefixText + "%'";
            da = new SqlDataAdapter(str, con);
            dt = new DataTable();
            da.Fill(dt);
            List<string> Output = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
                Output.Add(dt.Rows[i][0].ToString());
            con.Close();
            return Output;

        }

        protected void search_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("search.aspx?id={0}", TextBox1.Text));
        }
    }
}