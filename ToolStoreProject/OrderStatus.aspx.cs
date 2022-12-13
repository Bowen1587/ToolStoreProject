using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolStoreProject
{
    public partial class OrderStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437");
            SqlDataAdapter sda = new SqlDataAdapter("SELECT Order_ID, Product_ID, Product_Name, Order_Price, Quantity, CONVERT(varchar, Order_Date, 111) AS Order_Date, Member_ID FROM Orders " +
                "WHERE (Order_ID like '%" + SearchTextBox1.Text + "%')" +
                "AND (Product_ID like '%" + SearchTextBox2.Text + "%')" +
                "AND (Product_Name like '%" + SearchTextBox3.Text + "%')" +
                "AND (Order_Price like '%" + SearchTextBox4.Text + "%')" +
                "AND (Quantity like '%" + SearchTextBox5.Text + "%')" +
                "AND (Order_Date like '%" + SearchTextBox6.Text + "%')" +
                "AND (Member_ID LIKE '%" + SearchTextBox7.Text + "%')", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSourceID = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}