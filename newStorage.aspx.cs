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
    public partial class newStorage : System.Web.UI.Page
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

        protected void add_btn_Click(object sender, EventArgs e)
        {
            using (conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString))
            {
                int rcnt = 0;
                string name = sname.Value.ToString();
                int flr = int.Parse(floor.Value.ToString());
                int rks = int.Parse(racks.Value.ToString());
                string query = "insert into Storage (S_name, Floor, Racks) values ('{0}',{1},{2})";
                try
                {
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    query = String.Format(query, name, flr, rks);
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
                        string msg = " <p class='alert alert-success' role='alert'> Storage Added Successfuly</p> ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                        sname.Value = " ";
                        floor.Value = " ";
                        racks.Value = " ";
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