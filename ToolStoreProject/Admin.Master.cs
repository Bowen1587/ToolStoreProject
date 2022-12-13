using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolStoreProject
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminLogOut_BT_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        protected void AddProduct_BT_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void UpdateProduct_BT_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateProduct.aspx");
        }

        protected void OrderStatus_BT_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderStatus.aspx");
        }

        protected void ListMembers_BT_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListMembers.aspx");
        }
    }
}