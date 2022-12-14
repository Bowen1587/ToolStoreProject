using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.WebSockets;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolStoreProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clientDetailsView.DataBind();
        }

        protected void LoginBT_Click(object sender, EventArgs e)
        {
            clientDetailsView.Visible = false;
            if(AccountTB.Text == "admin" & PasswordTB.Text == "GGxn%483437")
            {
                Response.Redirect("AdminHome.aspx");
            }
            else if(1 == clientDetailsView.DataItemCount)
            {
                Session["Account"] = clientDetailsView.Rows[0].Cells[1].Text;
                Session["Mem_Name"] = clientDetailsView.Rows[1].Cells[1].Text;
                Session["Member_ID"] = clientDetailsView.Rows[2].Cells[1].Text;
                Response.Redirect("Store.aspx");
            }
            else
            {
                Session["Account"] = null;
                Session["Mem_Name"] = null;
                Session["Member_ID"] = null;
                clientDetailsView.Visible = true;
            }
        }
        protected void RegisterBT_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}