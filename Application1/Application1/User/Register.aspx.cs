using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.User
{
    public partial class Register : System.Web.UI.Page
    {
        string str = @"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    Response.Redirect("G_br_Home.aspx");
                }
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {


        }
        //clearing all fileds after user is Registration
        private void ClearText()
        {
            TextBox1.Text = string.Empty;
            TextBox3.Text = string.Empty;
            DropDownList1.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd1 = new SqlCommand("Select Count(*) from User_Register where Email_id= @mail or Phone_no= @phon", con);

            con.Open();
            cmd1.Parameters.AddWithValue("@mail", TextBox3.Text);
            cmd1.Parameters.AddWithValue("@phon", TextBox5.Text);
            int count = Convert.ToInt32(cmd1.ExecuteScalar());
            con.Close();
            if (count == 0)
            {
                SqlConnection con1 = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand("Insert into User_Register" + "(Name,Email_id,Gender,Phone_no,Password) values (@Fname,@Email,@Gender,@Phone,@Password)", con1);
                con1.Open();
                cmd.Parameters.AddWithValue("@Fname", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Email", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Phone", TextBox5.Text);
                cmd.Parameters.AddWithValue("@Password", TextBox6.Text);
                cmd.ExecuteNonQuery();
                con1.Close();
                ClearText();
                Label1.Text = "Register sussfull";
                ClearText();
                Response.Write("<script>alert('Registration Succfully');</script>");
                Response.AppendHeader("Refresh", "5;url=Login.aspx");
                //Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('This Email and Moblie No Alredy Registered');</script>");
            }
        }
    }
}