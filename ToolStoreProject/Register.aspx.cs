using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolStoreProject
{
    public partial class Register : System.Web.UI.Page
    {
        public bool PasswordSate = true;
        SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=tool; User Id=sa; Password=GGxn%483437");
        protected void Page_Load(object sender, EventArgs e)
        {
            PasswordTB.Attributes.Add("value", PasswordTB.Text);
        }

        protected void CancelBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void LoginBT_Click(object sender, EventArgs e)
        {
            if(AccountTB.Text=="" || PasswordTB.Text=="" || PhoneTB.Text=="" || NameTB.Text=="" || BirthTB.Text=="")
            {
                Response.Write("<script>alert('All fields must be filled in.');</script>");
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Member (Account, Mem_Password, Phone_Number, Mem_Name, Birth) values ('" + AccountTB.Text + "','" + PasswordTB.Text + "','" + PhoneTB.Text + "','" + NameTB.Text + "','" + BirthTB.Text + "');", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Default.aspx");
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (PasswordTB.TextMode == TextBoxMode.Password)
                PasswordTB.TextMode = TextBoxMode.SingleLine;
            else if(PasswordTB.TextMode == TextBoxMode.SingleLine)
                PasswordTB.TextMode = TextBoxMode.Password;

        }
    }
}