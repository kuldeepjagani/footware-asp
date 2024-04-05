using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Application1.Admin
{
    public partial class G_br_AdminLogin : System.Web.UI.Page
    {
        string strcon = (@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("~/Admin/G_br_AdminLogin.aspx");
                }
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            SqlDataAdapter sda = new SqlDataAdapter("Select * from AdminLogin where UserName='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "' ", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Session["login"] = TextBox1.Text;
                //Session["admin"] = TextBox1.Text;
                Response.Redirect("G_br_Admin_AdminHome.aspx");
            }
            else
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Please Enter Valid Details";

            }

        }
    }
}