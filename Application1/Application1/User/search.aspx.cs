using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Application1.User
{
    public partial class search : System.Web.UI.Page
    {
        string str = @"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    //Response.Redirect("Login.aspx");
                }
            }

                if(Request.QueryString["id"].ToString() == "")
                {
                    SqlDataAdapter sda2 = new SqlDataAdapter("Select * from Product", con);
                    DataTable dt2 = new DataTable();
                    sda2.Fill(dt2);
                    dlProductList.DataSourceID = null;
                    dlProductList.DataSource = dt2;
                    dlProductList.DataBind();
                }
            
                SqlDataAdapter sda = new SqlDataAdapter("Select * from Product where (Product_name like '%" + Request.QueryString["id"].ToString() + "%')  or (Price like '%" + Request.QueryString["id"].ToString() + "%')", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    string Email = Session["username"].ToString();
                    SqlConnection con1 = new SqlConnection(str);
                    con1.Open();
                    SqlCommand cmd = new SqlCommand("Insert into UserSearch" + "(UserSearch,User_Email) values (@UserSearch,@email)", con1);
                    cmd.Parameters.AddWithValue("@UserSearch", Request.QueryString["id"].ToString());
                    cmd.Parameters.AddWithValue("@email", Email);
                    cmd.ExecuteNonQuery();
                    con1.Close();
                }
                else
                {
                    dlProductList.DataSourceID = null;
                    dlProductList.DataSource = dt;
                    dlProductList.DataBind();
                }
              
                


        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";
            if (e.CommandName == "Addtocart")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Label li = (Label)(e.Item.FindControl("list"));
                Response.Redirect("AddtoCart.aspx?id= " + e.CommandArgument.ToString() + "&quantity=1");
            }
            Session["addproduct"] = "true";
            if (e.CommandName == "View")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Response.Redirect("View_product.aspx?id= " + e.CommandArgument.ToString() + "&quantity= 1");
            }
        }
    }
}