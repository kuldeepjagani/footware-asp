using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application1.User
{
    public partial class AddtoCart : System.Web.UI.Page
    {
        string str = @"Data Source=DESKTOP-3B1CQMO\KULDEEP;Initial Catalog=MB FootWare;Integrated Security=True";
        static Boolean availabledesignid = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            if (!IsPostBack)
            {
                // Checking Wheter user is Logged i or Not
                if (Session["username"] == null)
                {
                    Response.Redirect("~/User/Login.aspx");
                }

                //Addting Prouduct With GridView
                //Adding DataRow & Colume To DataTable
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("pid");
                dt.Columns.Add("pname");
                dt.Columns.Add("pimage");
                dt.Columns.Add("pdesc");
                dt.Columns.Add("pprice");
                dt.Columns.Add("pquantity");
                dt.Columns.Add("pcategory");
                dt.Columns.Add("ptotalprice");

                if (Request.QueryString["id"] != null || Request.QueryString["id"] != null)
                {
                    if (Session["buyitems"] == null)
                    {
                        dr = dt.NewRow();
                        SqlDataAdapter da = new SqlDataAdapter("Select * from Product where Product_id='" + Request.QueryString["id"] + "' or Product_id=" + Request.QueryString["id"], con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["Product_id"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Product_name"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];
                        dr["pcategory"] = ds.Tables[0].Rows[0]["Category"].ToString();
                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;

                        dr["ptotalprice"] = TotalPrice;
                        dt.Rows.Add(dr);



                        con.Open();
                        SqlCommand cmd = new SqlCommand("Insert into CartDetails values('" + dr["sno"] + "','" + dr["pid"] + "','" + dr["pname"] + "', '" + dr["pdesc"] + "', '" + dr["pimage"] + "', '" + dr["pprice"] + "', '" + dr["pquantity"] + "', '" + dr["pcategory"] + "', '" + Session["username"].ToString() + "')", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;
                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                        Response.Redirect("~/User/AddtoCart.aspx");

                    }
                    else
                    {
                        checkdesignid();
                        if (availabledesignid == true)
                        {
                            //Response.Write("Designid " + Request.QueryString["id"] + " " + availabledesignid);
                            updatequantity();
                            DataTable dt1;
                            dt1 = (DataTable)Session["buyitems"];
                            GridView1.DataSource = dt1;
                            GridView1.DataBind();
                            availabledesignid = false;
                            GridView1.FooterRow.Cells[6].Text = "Total Amount";
                            GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                            Response.Redirect("~/User/AddtoCart.aspx");

                        }
                        else
                        {
                            dt = (DataTable)Session["buyitems"];
                            int sr;
                            sr = dt.Rows.Count;
                            dr = dt.NewRow();
                            SqlDataAdapter da = new SqlDataAdapter("select * from Product where Product_id='" + Request.QueryString["id"] + "' or Product_id=" + Request.QueryString["id"] + "", con);
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            dr["sno"] = sr + 1;
                            dr["pid"] = ds.Tables[0].Rows[0]["Product_id"].ToString();
                            dr["pname"] = ds.Tables[0].Rows[0]["Product_name"].ToString();
                            dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                            dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                            dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                            dr["pquantity"] = Request.QueryString["quantity"];
                            dr["pcategory"] = ds.Tables[0].Rows[0]["Category"].ToString();
                            int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                            int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                            int TotalPrice = price * Quantity;
                            string product = ds.Tables[0].Rows[0]["Product_name"].ToString();
                            dr["ptotalprice"] = TotalPrice;
                            dt.Rows.Add(dr);

                            Response.Write(product);


                            con.Open();
                            SqlCommand cmd = new SqlCommand("Insert into CartDetails values('" + dr["sno"] + "','" + dr["pid"] + "','" + dr["pname"] + "','" + dr["pdesc"] + "','" + dr["pimage"] + "','" + dr["pprice"] + "','" + dr["pquantity"] + "','" + dr["pcategory"] + "','" + Session["username"].ToString() + "')", con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["buyitems"] = dt;
                            Button1.Enabled = true;
                            GridView1.FooterRow.Cells[6].Text = "Total Amount";
                            GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                            Response.Redirect("~/User/AddtoCart.aspx");
                        }

                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                    }
                }
            }
            // if no product present in cart then it will disable clearcart button & PlaceOrder button
            if (GridView1.Rows.Count.ToString() == "0")
            {
                LinkButton1.Enabled = false;
                LinkButton1.ForeColor = System.Drawing.Color.CadetBlue;
                Button1.Enabled = false;
                Button1.Text = "Oops";
            }
            else
            {
                LinkButton1.Enabled = true;
                Button1.Enabled = true;
            }
            orderid();

            foreach (GridViewRow row in GridView1.Rows)
            {
                DropDownList ddl = (DropDownList)row.FindControl("DropDownList1");
                Session["size"] = ddl.SelectedValue.ToString();
            }
            
            
        }
        //Calcluting Final Price
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int totalprice = 0;
            while (i < nrow)
            {
                totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["ptotalprice"].ToString());
                i = i + 1;
            }
            Session["totalprice"] = totalprice;
            return totalprice;
        }

        // Genrates Order Id for a order created
        public void orderid()
        {
            String alpha = "abCdefghIjklmNopqrStuvwxyz";
            Random r = new Random();
            char[] myArray1 = new char[1];
            char[] myArray2 = new char[2];
            char[] myArray3 = new char[3];
            for (int i = 0; i < 1; i++)
            {

                myArray1[i] = alpha[(int)(26 * r.NextDouble())];
            }
            for (int i = 0; i < 2; i++)
            {
                myArray2[i] = alpha[(int)(26 * r.NextDouble())];
            }
            for (int i = 0; i < 3; i++)
            {
                myArray3[i] = alpha[(int)(26 * r.NextDouble())];
            }
            String orderid;
            orderid = "Order_Id: " + Convert.ToString(r.Next(1, 9)) + new string(myArray1) + Convert.ToString(r.Next(10, 99)) + new string(myArray2) + Convert.ToString(r.Next(100, 999)) + new string(myArray3) + Convert.ToString(r.Next(1000, 9999));

            Session["Orderid"] = orderid;
        }


        //Deleting Seleting Prouduct From cart
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdate;
                string dtdate;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdate = cell.Text;
                dtdate = sr.ToString();
                sr1 = Convert.ToInt32(qdate);
                TableCell prID = GridView1.Rows[e.RowIndex].Cells[1];
                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete top(1) from CartDetails where ProductId='" + prID.Text + "' and Email='" + Session["username"].ToString() + "' ", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //Item has Been Deleted row item from cart
                    break;
                }

            }


            //Setting Sno. after deleting Row item from cart
            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }
            Session["buyitems"] = dt;
            Response.Redirect("~/User/AddtoCart.aspx");
        }


        //Redircting to Payment Page
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Session["size"].ToString() == "Select")
            {
                Response.Write("<script>alert('Pliesh Select the Size')</script>");
            }
            else
            {
                bool isTrue = false;
                //First of all it will check that existing prouduct in cart is in stock or not
                DataTable dt = (DataTable)Session["buyitems"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    int pId = Convert.ToInt16(dt.Rows[i]["pid"]);
                    int pQuantity = Convert.ToInt16(dt.Rows[i]["pquantity"]);

                    string product_name = Convert.ToString(dt.Rows[i]["pname"]);
                    Session["product"] = product_name;
                    SqlConnection con = new SqlConnection(str);
                    SqlDataAdapter sda = new SqlDataAdapter("Select quantity,Product_name from Product where Product_id='" + pId + "' ", con);
                    DataTable dtble = new DataTable();
                    sda.Fill(dtble);
                    int quantity = Convert.ToInt16(dtble.Rows[0][0]);
                    if (quantity == 0)
                    {
                        string pName = dtble.Rows[0][1].ToString();
                        string msg = "" + pName + " is not in stock";
                        Response.Write("<script>alert('" + msg + "');</script>"); //display follwing message that product is not in stock now
                        isTrue = false;
                    }
                    else
                    {
                        isTrue = true;
                    }
                }


                //check if cart constains any product in it or not
                if (GridView1.Rows.Count.ToString() == "0")
                {
                    //Dieplay alert Message Cart Empty
                    Response.Write("<script>alert('Your cart is Empty. You cannot place an order');</script>");
                }
                else
                {
                    if (isTrue == true)
                    {
                        Button1.PostBackUrl = "~/User/Address_Page.aspx";

                    }
                }
            }
        }

        private void btnPlaceOrder(string p)
        {
            throw new NotImplementedException();
        }


        //Deleting all Prouduct at Once
        public void clearCart()
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete from CartDetails where Email='" + Session["username"] + "' ", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("AddtoCart.aspx");
        }

        //link button for clearing Cart items
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["buyitems"] = null;
            clearCart();
        }

        //targate Product the ID
        private void checkdesignid()
        {
            DataTable dt1;
            int designid;
            int querydesignid = Convert.ToInt16(Request.QueryString["id"]);
            dt1 = (DataTable)Session["buyitems"];
            foreach (DataRow row in dt1.Rows)
            {
                designid = Convert.ToInt16(row["pid"].ToString());
                if (designid == querydesignid)
                {
                    availabledesignid = true;
                }
            }
        }

        //add quantity in same line
        private void updatequantity()
        {
            DataTable dt1;
            int designid;
            int querydesignid = Convert.ToInt16(Request.QueryString["id"]);
            dt1 = (DataTable)Session["buyitems"];
            foreach (DataRow row in dt1.Rows)
            {
                designid = Convert.ToInt16(row["pid"].ToString());
                if (designid == querydesignid)
                {
                    int newquantity = Convert.ToInt16(row["pquantity"].ToString()) + Convert.ToInt16(Request.QueryString["quantity"].ToString());
                    row["pquantity"] = newquantity;
                    Int64 price = Convert.ToInt64(row["pprice"].ToString());
                    Int64 totalprice = price * newquantity;
                    row["ptotalprice"] = totalprice;

                    break;
                }
            }
            Session["buyitems"] = dt1;


        }

        //select old Price and Update New Price
        public void updateprice()
        {


            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int pId = Convert.ToInt16(dt.Rows[i]["pid"]);

                int pPrice = Convert.ToInt16(dt.Rows[i]["pprice"]);
                //Response.Write(pId);
                SqlConnection con = new SqlConnection(str);
                SqlDataAdapter sda = new SqlDataAdapter("Select Price from Product where Product_id='" + pId + "' ", con);
                DataTable dtble = new DataTable();
                sda.Fill(dtble);
                int quantity = Convert.ToInt16(dtble.Rows[0][0]);
                int price = Convert.ToInt16(dtble.Rows[0]["Pprice"]);
                //Response.Write(price);
                if (pPrice > price || pPrice < price)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CartDetails set Pprice='" + price + "' where ProductId='" + pId + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}