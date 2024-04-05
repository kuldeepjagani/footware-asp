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
    public partial class G_br_Admin_UpdateProducts : System.Web.UI.Page
    {
        string str = (@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");
        int Productid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Check wheter Admin is logged in or not
                if (Session["admin"] == null)
                {
                    Response.Redirect("G_br_Login.aspx");
                }
                ShowProduct();
                Category();

            }
        }

        public void ShowProduct()
        {
            SqlConnection conn = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product", conn);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            int index = e.NewEditIndex;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];
            Label productID = (Label)row.FindControl("Label1");
            Productid = int.Parse(productID.Text.ToString());
            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product where Product_id='" + Productid + "' ", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                //getting user id Particluar Row

                //(e.Row.Cells[0].Controls[0] as Button).Attributes["onclick"]= "javascript:return confirm('Are You Sure to Delete');";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int index = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString());
            Label LPimage = (Label)row.FindControl("Label12");
            System.IO.File.Delete(Server.MapPath(LPimage.Text));

            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Product where Product_id = @1", con);
            cmd.Parameters.AddWithValue("@1", index);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Delete Succfully');</script>");
            GridView1.EditIndex = -1;
            ShowProduct();
        }

        //Cancel the row Editing
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            //DropDownList2.SelectedValue = "Select Category";
            ShowProduct();
        }
        //GridView Page Index Changes
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowProduct();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = Productid;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];

            FileUpload fu = (FileUpload)row.FindControl("FileUpload1");

            if (fu.HasFile)
            {
                // Session["ProductId"] = Lable1.Text;
                Label productID = (Label)row.FindControl("Label1");
                TextBox pName = (TextBox)row.FindControl("TextBox1");
                TextBox pDesc = (TextBox)row.FindControl("TextBox2");
                TextBox pPrice = (TextBox)row.FindControl("TextBox3");
                TextBox pQuantity = (TextBox)row.FindControl("TextBox4");
                string pCategory = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[6].FindControl("DropDownList1")).Text;
                //string sCategory = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[7].FindControl("DropDownList3")).Text;
                TextBox nEtwait = (TextBox)row.FindControl("TextBox5");
                TextBox dUmy = (TextBox)row.FindControl("TextBox6");
                Label LPimage = (Label)row.FindControl("Label11");
                fu.SaveAs(Server.MapPath("~/Product/") + Path.GetFileName(fu.FileName));
                String pImage = "~/Product/" + Path.GetFileName(fu.FileName);

                float ori = float.Parse(dUmy.Text);
                float dis = Convert.ToSingle(dUmy.Text) / 100;
                float tot = (dis * Convert.ToSingle(nEtwait.Text));
                int last = Convert.ToInt32(Math.Floor(ori - tot));

                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Product set Product_name=@1, Pimage=@3, Pdesc=@2, Price=@4, quantity=@5, Category=@6, persentage=@8,dumy_price=@9 where Product_id=@7 ", con);
                cmd.Parameters.AddWithValue("@1", pName.Text);
                cmd.Parameters.AddWithValue("@2", pDesc.Text);
                cmd.Parameters.AddWithValue("@3", pImage);
                cmd.Parameters.AddWithValue("@4", last);
                cmd.Parameters.AddWithValue("@5", pQuantity.Text);
                cmd.Parameters.AddWithValue("@6", pCategory);
                cmd.Parameters.AddWithValue("@8", nEtwait.Text);
                cmd.Parameters.AddWithValue("@7", productID.Text);
                cmd.Parameters.AddWithValue("@9", dUmy.Text);
                int ans = cmd.ExecuteNonQuery();
                if (ans > 0)
                {
                    System.IO.File.Delete(Server.MapPath(LPimage.Text));
                    SqlCommand cmd2 = new SqlCommand("Update Product set Pimage=@img where Product_id=@id ", con);
                    cmd2.Parameters.AddWithValue("@img", pImage);
                    cmd2.Parameters.AddWithValue("@id", productID.Text);
                    cmd2.ExecuteNonQuery();
                }
                con.Close();
                GridView1.EditIndex = -1;
                Response.Write("<script>alert('Prouduct Update Sussfull')</script>");
                ShowProduct();
                //DropDownList2.SelectedValue = "Select Category";
            }
            else
            {
                //Response.Write("<script>alert('Please Select Prouduct Image')</script>");
                Label productID = (Label)row.FindControl("Label1");
                TextBox pName = (TextBox)row.FindControl("TextBox1");
                TextBox pDesc = (TextBox)row.FindControl("TextBox2");
                TextBox pPrice = (TextBox)row.FindControl("TextBox3");
                TextBox pQuantity = (TextBox)row.FindControl("TextBox4");
                string pCategory = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[6].FindControl("DropDownList1")).Text;
                //string sCategory = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[7].FindControl("DropDownList3")).Text;
                TextBox nEtwait = (TextBox)row.FindControl("TextBox5");
                TextBox dUmy = (TextBox)row.FindControl("TextBox6");

                /* fu.SaveAs(Server.MapPath("~/Images/") + Path.GetFileName(fu.FileName));
                 String pImage = "Images/" + Path.GetFileName(fu.FileName);*/

                float ori = float.Parse(dUmy.Text);
                float dis = Convert.ToSingle(dUmy.Text) / 100;
                float tot = (dis * Convert.ToSingle(nEtwait.Text));
                int last = Convert.ToInt32(Math.Floor(ori - tot));

                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Product set Product_name=@1, Pdesc=@2, Price=@4, quantity=@5, Category=@6, persentage=@8,dumy_price=@9 where Product_id=@7 ", con);
                cmd.Parameters.AddWithValue("@1", pName.Text);
                cmd.Parameters.AddWithValue("@2", pDesc.Text);
                //cmd.Parameters.AddWithValue("@3", pImage);
                cmd.Parameters.AddWithValue("@4", last);
                cmd.Parameters.AddWithValue("@5", pQuantity.Text);
                cmd.Parameters.AddWithValue("@6", pCategory);
                cmd.Parameters.AddWithValue("@8", nEtwait.Text);
                cmd.Parameters.AddWithValue("@7", productID.Text);
                cmd.Parameters.AddWithValue("@9", dUmy.Text);
                int ans = cmd.ExecuteNonQuery();
                con.Close();
                GridView1.EditIndex = -1;
                Response.Write("<script>alert('Prouduct Update Sussfull')</script>");
                ShowProduct();
            }
        }

        public void Category()
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Category", con);
            DropDownList4.DataSource = cmd.ExecuteReader();
            DropDownList4.DataTextField = "CategoryName";
            DropDownList4.DataValueField = "CategoryId";
            DropDownList4.DataBind();
            con.Close();
        }
        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Cname = DropDownList4.SelectedItem.Value.Trim();
            if (Cname == "Select Category")
            {
                ShowProduct();
            }
            else
            {
                SqlConnection con = new SqlConnection(str);
                SqlDataAdapter sda = new SqlDataAdapter("Select * from Product where Category='" + Cname + "' ", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}