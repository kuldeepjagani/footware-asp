using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.Admin
{
    public partial class G_br_Admin_Check_FeedBack : System.Web.UI.Page
    {
        string str = (@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("G_br_Login.aspx");
                }
                // LinkButton1.Visible = false;
            }

            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from FeedBack", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            if (Session["admin"] != null)
            {
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from FeedBack", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //LinkButton1.Visible = false;
                clear();
            }
            Response.Write("<script>alert('Delete Sussfull');</script>");

        }
        public void clear()
        {
            GridView1.Columns[0].Visible = false;
            GridView1.Columns[1].Visible = false;
            GridView1.Columns[2].Visible = false;
        }
        // Button To Click Show Spacifik data 
        protected void Button1_Click(object sender, EventArgs e)
        {
            string feed = TextBox1.Text;
            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from FeedBack where id='" + feed + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //getting user id Particluar Row
                string id = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "id"));
                LinkButton linkbutton = (LinkButton)e.Row.FindControl("lnkdelete");
                linkbutton.Attributes.Add("onclick", "javascript:return confirm('Are You Sure to Delete " + id + "')");
            }
        }
        protected void lnkdelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkbut = sender as LinkButton;
            //Getting particluar Row LinkButton
            int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            //getting particluar userid
            int userid = Convert.ToInt32(GridView1.Rows[rowindex].Cells[1].Text);
            int result;
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from FeedBack where id=" + userid.ToString(), con);
            result = cmd.ExecuteNonQuery();
            con.Close();
            data();
        }
        public void data()
        {
            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from FeedBack", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}