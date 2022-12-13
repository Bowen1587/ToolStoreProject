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
    public partial class ListMembers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //SearchTextBox5.Attributes.Add("readonly", "readonly");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437");
            SqlDataAdapter sda = new SqlDataAdapter("SELECT Member_ID, Account, Phone_Number, Mem_Name, CONVERT(varchar, Birth, 111) AS Birth FROM Member " +
                "WHERE (Member_ID like '%" + SearchTextBox1.Text + "%')" +
                "AND (Account like '%" + SearchTextBox2.Text + "%')" +
                "AND (Phone_Number like '%" + SearchTextBox3.Text + "%')" +
                "AND (Mem_Name like '%" + SearchTextBox4.Text + "%')" +
                "AND (Birth LIKE '%" + SearchTextBox5.Text + "%')", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSourceID = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}