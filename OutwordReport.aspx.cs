using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ColdStorageManagementSystem
{
    public partial class OutwordReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM [Out_cust]";
            }
        }

        protected void search_btn_Click(object sender, EventArgs e)
        {
            if (from.Value != null && to.Value != null)
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM Out_cust WHERE ( Date BETWEEN '" + from.Value.ToString() + "' AND '" + to.Value.ToString() + "');";
                Response.Write(" ");
            }
        }
    }
}