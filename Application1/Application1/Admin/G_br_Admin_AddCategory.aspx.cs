using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.Admin
{
    public partial class G_br_Admin_AddCategory : System.Web.UI.Page
    {
        string str = (@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Check whethre Admin is Logged Or Not
                if (Session["admin"] == null)
                {
                    Response.Redirect("G_br_AdminLogin.aspx");
                }
                ShowGrid();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from Category where CategoryName='" + TextBox1.Text.ToString() + "'", con1);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            //Check wheter the added is category already present or not
            if (dt.Rows.Count == 1)
            {
                Response.Write("<script>alert('This Category is Already Present');</script>");
            }
            else
            {
                SqlConnection con = new SqlConnection(str);

                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Category values (@Cname)", con);
                cmd.Parameters.AddWithValue("@Cname", TextBox1.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('One Record Add');</script>");
                TextBox1.Text = "";
                ShowGrid();
                
            }
        }

        //Display Category in Gridview
        public void ShowGrid()
        {
            SqlConnection conn = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Category ", conn);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        //Cancelling girdveiw row edit
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowGrid();
        }

        //Deleting Category 
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int CId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            Label LPimage = (Label)row.FindControl("Label4");

            if (CId != null)
            {
                SqlConnection con1 = new SqlConnection(str);
                con1.Open();
                SqlCommand cmd1 = new SqlCommand("Delete from Category where CategoryId='" + CId + "'", con1);
                int ans = cmd1.ExecuteNonQuery();
                con1.Close();
                Response.Write("<script>alert('Category Delete Succfully');</script>");
                ShowGrid();
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowGrid();
        }

        //Update Category
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
                int CId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                Label LPimage = (Label)row.FindControl("Label3");
                string CategoryName = (row.FindControl("TextBox2") as TextBox).Text;

              
                SqlConnection con2 = new SqlConnection(str);
                con2.Open();
                SqlCommand cmd1 = new SqlCommand("Update Category set CategoryName=@1 where CategoryId=@2", con2);
                cmd1.Parameters.AddWithValue("@1", CategoryName);
                cmd1.Parameters.AddWithValue("@2", CId);
                int ans = cmd1.ExecuteNonQuery();
                if (ans > 0)
                {
                    System.IO.File.Delete(Server.MapPath(LPimage.Text));
                }
                con2.Close();
                Response.Write("<script>alert('Category Update Succfully');</script>");
                GridView1.EditIndex = -1;
                ShowGrid();
        }

        //Calls when Gridveiw Page Changes
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowGrid();
        }
    }
}