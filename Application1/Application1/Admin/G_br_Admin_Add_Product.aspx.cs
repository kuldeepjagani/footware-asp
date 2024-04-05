using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.Admin
{
    public partial class G_br_Admin_Add_Product : System.Web.UI.Page
    {
        string str = (@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Check The Where Admin Is Login Or not
                if (Session["admin"] == null)
                {
                    Response.Redirect("~/User/Login.aspx");
                }
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Category", con);
                SqlDataReader sdr = cmd.ExecuteReader();
                DropDownList1.DataSource = sdr;
                DropDownList1.DataTextField = "CategoryName";
                DropDownList1.DataValueField = "CategoryId";
                DropDownList1.DataBind();
                sdr.Close();
                con.Close();
            }
        }
        //Select Sub_category 
        public void sub_category()
        {

        }
        //Will Add All Product Details Product
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);

            if (imageUpload.HasFile)
            {
                string filename = imageUpload.PostedFile.FileName;
                string filepath = "~/Product/" + imageUpload.FileName;
                imageUpload.PostedFile.SaveAs(Server.MapPath("~/Product/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Product values(@Product_name,@Pimage,@Pdesc,@Price,@quantity,@Category,@persentage,@dumy_price)", con);

                cmd.Parameters.AddWithValue("@Product_name", txtName.Text);
                cmd.Parameters.AddWithValue("@Pimage", filepath);
                cmd.Parameters.AddWithValue("@Pdesc", txtDesc.Text);
                float ori = float.Parse(txtPrice.Text);
                float dis = Convert.ToSingle(txtPrice.Text) / 100; 
                float tot = (dis * Convert.ToSingle(txtwait.Text));
                int last =Convert.ToInt32(Math.Floor(ori-tot));
   
                cmd.Parameters.AddWithValue("@Price",last);
                cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text);
                cmd.Parameters.AddWithValue("@Category", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@persentage", txtwait.Text);
                cmd.Parameters.AddWithValue("@dumy_price", txtPrice.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                // Response.Redirect("");
                clearcart();
            }
        }
        public void clearcart()
        {
            txtName.Text = string.Empty;
            txtDesc.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtQuantity.Text = string.Empty;

        }
    }
}