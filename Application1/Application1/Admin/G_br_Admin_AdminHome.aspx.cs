using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.Admin
{
    public partial class G_br_Admin_AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    if (Session["login"] == null)
                    {
                        Response.Redirect("~/Admin/G_br_AdminLogin.aspx");
                    }
                }
            }
            if (Session["login"] != null)
            {
                Label1.Text = "WelCome Admin :- " + Session["login"].ToString();

            }
        }
    }
}