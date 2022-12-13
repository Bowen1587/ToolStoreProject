using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolStoreProject
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        string str = "Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437";
        int Productid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ShowProduct();
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
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowProduct();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex= -1;
            ShowProduct();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            int index = e.NewEditIndex;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];
            Label productID = (Label)row.FindControl("Label1");
            Productid = int.Parse(productID.Text.ToString());
            SqlConnection conn = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product where Product_ID='" + Productid + "'", conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = Productid;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];

            FileUpload fu = (FileUpload)row.FindControl("FileUpload1");
            Label productID = (Label)row.FindControl("Label1");
            TextBox pName = (TextBox)row.FindControl("TextBox1");
            TextBox remain = (TextBox)row.FindControl("TextBox3");
            TextBox price = (TextBox)row.FindControl("TextBox4");
            string category = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("DropDownList2")).Text;
            if (fu.HasFile)
            {
                fu.SaveAs(Server.MapPath("~/Stock/") + Path.GetFileName(fu.FileName));
                string pImage = "Stock/" + Path.GetFileName(fu.FileName);

                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Product set Product_Name=@1, category=@2, PImage=@3, remaining=@4, Price=@5 where Product_ID=@6", con);
                cmd.Parameters.AddWithValue("@1", pName.Text);
                cmd.Parameters.AddWithValue("@2", category);
                cmd.Parameters.AddWithValue("@3", pImage);
                cmd.Parameters.AddWithValue("@4", remain.Text);
                cmd.Parameters.AddWithValue("@5", price.Text);
                cmd.Parameters.AddWithValue("@6", productID.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.EditIndex = -1;
                ShowProduct();
            }
            else
            {
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Product set Product_Name=@1, category=@2, remaining=@4, Price=@5 where Product_ID=@6", con);
                cmd.Parameters.AddWithValue("@1", pName.Text);
                cmd.Parameters.AddWithValue("@2", category);
                cmd.Parameters.AddWithValue("@4", remain.Text);
                cmd.Parameters.AddWithValue("@5", price.Text);
                cmd.Parameters.AddWithValue("@6", productID.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.EditIndex = -1;
                ShowProduct();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437");
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product where (Product_Name like '%" + SearchTextBox.Text + "%') AND (category like '%" + DropDownList1.Text + "%')", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSourceID = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}