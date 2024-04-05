using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.User
{
    public partial class FeedBack : System.Web.UI.Page
    {
        string str = @"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from User_Register where Email_id='"+ Session["username"].ToString()+"'", con);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                TextBox1.Text = sdr.GetValue(2).ToString();
               
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into FeedBack" + "(Email,FeedBack) values (@Email,@FeedBack)", con);
            cmd.Parameters.AddWithValue("@Email", TextBox1.Text);
            if (RadioButton1.Checked == true)
            {
                cmd.Parameters.AddWithValue("@FeedBack", RadioButton1.Text);
            }
            else if (RadioButton2.Checked == true)
            {
                cmd.Parameters.AddWithValue("@FeedBack", RadioButton2.Text);
            }
            else if (RadioButton3.Checked == true)
            {
                cmd.Parameters.AddWithValue("@FeedBack", RadioButton3.Text);
            }
            else if (RadioButton4.Checked == true)
            {
                cmd.Parameters.AddWithValue("@FeedBack", RadioButton4.Text);
            }

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Thanku For Your FeedBack');</script>");
            
        }
    }
}