using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.Admin
{
    public partial class G_br_Admin_UpdatesStatuss : System.Web.UI.Page
    {
        string str = (@"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string date = TextBox1.Text;
            if (date == "")
            {
                Response.Write("<script>alert('Please Select Date');</script>");
            }
            else
            {
                IFormatProvider culture = new CultureInfo("en-US", true);
                DateTime datetime = DateTime.ParseExact(date, "yyyy-MM-dd", culture);
                string selectedDate = datetime.ToString("dd-MM-yyyy");
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter("select Oid as OsNo, orderid as OrderId,productname as ProductName, price as Price, quantity as Quantity,status as Status, orderdate as OrderedDate, mobile_no as Mobile_No from OrderDetails where orderdate='" + selectedDate + "' and status='Panding' ", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    Response.Write("<script>alert('No Record to Display');</script>");
                }
                else
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    GridView1.Columns[0].Visible = true;
                    Button2.Visible = true;
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string id = TextBox2.Text;
            if (id == "")
            {
                Response.Write("<script>alert('Please Enter Text');</script>");
            }
            else
            {
                //Selected data in using status or orderid
                SqlConnection con = new SqlConnection(str);
                //con.Open();
                SqlDataAdapter sda = new SqlDataAdapter("Select Oid as OsNo, orderid as OrderId,productname as ProductName, price as Price, quantity as Quantity, orderdate as OrderedDate,status as Status,mobile_no as Mobile_No from OrderDetails where status='" + id + "' or orderid='" + id + "' ", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    Response.Write("<script>alert('No Record to Display');</script>");
                }
                else
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    GridView1.Columns[0].Visible = true;
                    Button2.Visible = true;
                }


                //Status Complite Than RadioButton Visible False

                SqlDataAdapter sda1 = new SqlDataAdapter("Select orderid as OrderId,productname as ProductName, price as Price, quantity as Quantity, orderdate as OrderedDate,status as Status,mobile_no as Mobile_No from OrderDetails where status='" + id + "' and status='Complite' or status='" + id + "'", con);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                if (dt1.Rows.Count == 0)
                {
                }
                else
                {
                    GridView1.DataSource = dt1;
                    GridView1.DataBind();
                    GridView1.Columns[0].Visible = false;
                    Button2.Visible = false;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                string orderId = row.Cells[1].Text;
                RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
                RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);
                string status;
                if (rb1.Checked)
                {
                    status = rb1.Text;
                }
                else
                {
                    status = rb2.Text;
                }
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update OrderDetails set status=@a where Oid=@b", con);
                cmd.Parameters.AddWithValue("@a", status);
                cmd.Parameters.AddWithValue("@b", orderId);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Write("<script>alert('Status Update Successfull...');</script>");
        }

        protected void AllOrder_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select orderid as OrderId,productname as ProductName, price as Price, quantity as Quantity, orderdate as OrderedDate,email as Email,status as Status,mobile_no as Mobile_No from OrderDetails order by orderdate desc ", con);
            DataSet ds = new DataSet();
            sda.Fill(ds, "OrderDetails");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Columns[0].Visible = false;
            Button2.Visible = false;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
        }
    }
}