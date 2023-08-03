using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ColdStorageManagementSystem.Employee
{
    public partial class Employee : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (session["uname"] == null)
            //{
            //    response.redirect("login.aspx");
            //}
            //else
            //    u_name.text = session["uname"].tostring();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../Login.aspx");
        }
    }
}