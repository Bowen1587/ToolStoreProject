using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolStoreProject
{
    public partial class Store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["addProduct"] = "false";
            if (Session["Mem_Name"] != null)
            {
                Name_Label.Text = "使用者: " + Session["Mem_Name"].ToString();
            }
        }

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            Session["addProduct"] = "true";
            if (e.CommandName == "AddToCart")
            {
                //DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                TextBox quantity = (TextBox)(e.Item.FindControl("TextBox1"));
                Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + quantity.Text);
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437");
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product where (Product_Name like '%" + SearchTextBox.Text + "%') AND (category like '%" + DropDownList1.Text + "%')", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddtoCart.aspx");
        }
        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Order.aspx");
        }
    }
}