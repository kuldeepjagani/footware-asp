using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace Application1.User
{
    public partial class home : System.Web.UI.Page
    {
        string str = (@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["addproduct"] = "false";
           /* SqlConnection con = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select Product_id,Pimage,Product_name,Price,dumy_price from Product order by(dumy_price - Price) desc", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            dlProductList.DataSourceID = null;
            dlProductList.DataSource = ds.Tables["Product"].ToString();*/

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