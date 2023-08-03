using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ColdStorageManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Btn_Click(object sender, EventArgs e)
        {
            if (uname.Value.ToString() == "admin" && pwd.Value.ToString() == "admin")
            {
                Session["uname"] = uname.Value.ToString();
                Response.Redirect("AdminDashboard.aspx");
                Session.RemoveAll();
            }
            else
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString);
                //SqlDataAdapter data = new SqlDataAdapter("SELECT * FROM Employees where U_name='" + uname.Value.ToString() + "' and Password = '" + pwd.Value.ToString() + "'", conn);
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Employees where U_name='" + uname.Value.ToString() + "' and Password = '" + pwd.Value.ToString() + "';",conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    Session["uname"] = uname.Value.ToString();
                    conn.Close();
                    Response.Redirect("Employee/EmployeeDashboard.aspx");
                    Session.RemoveAll();
                }
                else
                {
                    conn.Close();
                    Response.Redirect("Login.aspx?err=1");
                    Session.RemoveAll();
                }
            }
        }
    }
}