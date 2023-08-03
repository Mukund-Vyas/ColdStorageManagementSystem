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
    public partial class EmployeeRegistration : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand Cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void reg_btn_Click(object sender, EventArgs e)
        {
            using (conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString))
            {
                int rcnt = 0;
                string name = ename.Value.ToString();
                string mo = mobile.Value.ToString();
                string mail = email.Value.ToString();
                int slry = int.Parse(salary.Value.ToString());
                string unm = uname.Value.ToString();
                string password = pwd.Value.ToString();
                string query = "insert into Employees (E_name, E_mo, E_mail, Salary, U_name, Password) values ('{0}','{1}','{2}',{3}, '{4}', '{5}')";
                try
                {
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    query = String.Format(query, name, mo, mail, slry, unm, password);
                    Cmd.CommandText = query;
                    Cmd.Connection = conn;
                    rcnt = Cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('" + e.ToString() + "');");
                    throw;
                }
                finally
                {
                    if (rcnt != 0)
                    {
                        string msg = " <p class='alert alert-success' role='alert'> Employee Added Successfuly</p> ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                        ename.Value = " ";
                        mobile.Value = " ";
                        email.Value = " ";
                        salary.Value = " ";
                        uname.Value = " ";
                        pwd.Value = " ";
                    }
                    else
                    {
                        string msg = " <div class='alert alert-danger' role='alert'>Some error occures Please Try again..!!</ div > ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                    }
                }
            }
        }
    }
}