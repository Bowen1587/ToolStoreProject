using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolStoreProject
{
    public partial class AddProduct : System.Web.UI.Page
    {
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437");
            if(FileUpload1.HasFile)
            {
                string filename = FileUpload1.PostedFile.FileName;
                string filepath = "Stock/" + FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Stock/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Product values("+TextBox4.Text+ ","+TextBox5.Text+ ",'"+ textInfo.ToTitleCase(TextBox3.Text.ToLower()) +"','" +filepath+ "','"+TextBox2.Text+"')",con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("AdminHome.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}