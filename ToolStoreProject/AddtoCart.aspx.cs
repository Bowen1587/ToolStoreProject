using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Discovery;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolStoreProject
{
    public partial class AddtoCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["BuyingItems"] == null)
                {
                    Button1.Enabled = false;
                }
                else
                {
                    Button1.Enabled = true;
                }
                // Adding product to Gridview
                Session["addproduct"] = "false";
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("ID");
                dt.Columns.Add("name");
                dt.Columns.Add("image");
                dt.Columns.Add("price");
                dt.Columns.Add("quantity");
                dt.Columns.Add("total");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["BuyingItems"] == null)
                    {
                        dr = dt.NewRow();
                        SqlConnection conn = new SqlConnection("Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437");
                        
                        SqlDataAdapter da = new SqlDataAdapter("select * from Product where Product_ID=" + Request.QueryString["id"], conn);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = 1;
                        dr["ID"] = ds.Tables[0].Rows[0]["Product_ID"].ToString();
                        dr["name"] = ds.Tables[0].Rows[0]["Product_Name"].ToString();
                        dr["image"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                        dr["price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["quantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["price"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["total"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["BuyingItems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[3].Text = "Total Amount";
                        GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();
                        Response.Redirect("AddtoCart.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["BuyingItems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        SqlConnection conn = new SqlConnection("Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437");

                        SqlDataAdapter da = new SqlDataAdapter("select * from Product where Product_ID=" + Request.QueryString["id"], conn);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = sr + 1;
                        dr["ID"] = ds.Tables[0].Rows[0]["Product_ID"].ToString();
                        dr["name"] = ds.Tables[0].Rows[0]["Product_Name"].ToString();
                        dr["image"] = ds.Tables[0].Rows[0]["PImage"].ToString();
                        dr["price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["quantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["price"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["total"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["BuyingItems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[3].Text = "Total Amount";
                        GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();
                        Response.Redirect("AddtoCart.aspx");
                    }
                }
                else
                {
                    dt = (DataTable)Session["BuyingItems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count> 0) 
                    {
                        GridView1.FooterRow.Cells[3].Text = "Total Amount";
                        GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();
                    }
                }
            }
            string OrderDate = DateTime.Now.ToShortDateString();
            Session["Orderdate"] = OrderDate;
            orderid();

        }

        public void orderid()
        {
            String alpha = "abCdefghIjklmNopqrStuvwXyz123456789";
            Random r = new Random();
            char[] myArray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];
            }
            String orderid;
            orderid = "Order_Id: " + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString()
                + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["Orderid"] = orderid;
        }

        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["BuyingItems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int totalprice = 0;
            while (i < nrow)
            {
                totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["price"].ToString());
                i = i + 1;
            }
            return totalprice;

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["BuyingItems"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    // item had been delete from shopcart
                    break;
                }
            }

            // 5. setting sno after deleting item from cart
            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }
            Session["BuyingItems"] = dt;
            Response.Redirect("AddtoCart.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt  = new DataTable();
            dt = (DataTable)Session["BuyingItems"];
            SqlConnection scon = new SqlConnection(@"Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437");
            
            bool ValidAmount = true;
            for(int i=0; i< dt.Rows.Count; i++)
            {
                scon.Open();
                SqlCommand CheckRemainings = new SqlCommand("SELECT Remaining FROM Product WHERE Product_ID = '" + dt.Rows[i]["ID"] + "'", scon);
                int remaining = Convert.ToInt32(CheckRemainings.ExecuteScalar());
                if(remaining < Convert.ToInt32(dt.Rows[i]["quantity"]))
                {
                    ValidAmount = false;
                    Remaining.Text = "There are only " + remaining.ToString() + " left for " + dt.Rows[i]["name"];
                }
                scon.Close();
            }
            
            if (ValidAmount)
            {
            
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    scon.Open();
                    SqlCommand cmd = new SqlCommand("insert into Orders(Product_ID,Product_Name,Order_Price,Quantity,Order_Date,Member_ID) values(" + dt.Rows[i]["ID"] + ",'" + dt.Rows[i]["name"] + "'," + dt.Rows[i]["price"] + "," + dt.Rows[i]["quantity"] + ",'"
                        + Session["Orderdate"] + "'," + Session["Member_ID"] + ")", scon);
                    cmd.ExecuteNonQuery();
                    scon.Close();
                }
            }

            // If session is null redirecting to login else placing order
            if (Session["Mem_Name"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                if (GridView1.Rows.Count == 0)
                {
                    Response.Write("<script>alert('Your cart is empty. You cannot place an order.');</script>");
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        dt.Rows[i].Delete();
                        dt.AcceptChanges();
                    }
                    Session["BuyingItems"] = null;
                    // place an order, need to be fixed
                    if(ValidAmount)
                        Response.Redirect("Store.aspx");
                }
            }
        }
    }
}