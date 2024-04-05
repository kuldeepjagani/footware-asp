using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.Admin
{
    public partial class G_br_Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Navigate To Category Page
        protected void btnCategory_Click(object sender, EventArgs e)
        {
            btnCategory.CssClass = "buttonColor";
            btnCategory.Style.Add(HtmlTextWriterStyle.Color, "green");
            Response.Redirect("G_br_Admin_AddCategory.aspx");
        }

        // Navigate To Add_product Page
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            btnCategory.CssClass = "buttonColor";
            btnCategory.Style.Add(HtmlTextWriterStyle.Color, "green");
            Response.Redirect("G_br_Admin_Add_Product.aspx");
        }

        // Navigate To Update_product Page
        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_br_Admin_UpdateProducts.aspx");
        }
        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_br_Admin_UpdatesStatuss.aspx");
        }
        protected void btnFeedBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_br_Admin_Check_FeedBack.aspx");
        }
        protected void btncard_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_br_Admin_Usercard.aspx");
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_br_Admin_UserSearch.aspx");
        }
        protected void btnregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_br_Admin_UserReg.aspx");
        }
       
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/User/Login.aspx");
        }
        protected void btnaddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_br_Admin_address.aspx");
        }
        protected void btnpdf_Click(object sender, EventArgs e)
        {
            Response.Redirect("G_br_Admin_Pdf.aspx");
        }
    }
}