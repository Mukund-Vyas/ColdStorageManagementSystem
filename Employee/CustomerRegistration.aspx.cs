using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ColdStorageManagementSystem.Employee
{
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand Cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("../login.aspx");
            }
        }

        protected void reg_btn_Click(object sender, EventArgs e)
        {
            using (conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString))
            {
                int rcnt = 0;
                string name = cname.Value.ToString();
                string mo = mobile.Value.ToString();
                string email = mail.Value.ToString();
                string add = address.Value.ToString();

                DataTable modt = new DataTable();
                string qry = "select * from Customer where Cust_mo = '" + mo+"'";
                SqlDataAdapter moda = new SqlDataAdapter(qry, conn);
                moda.Fill(modt);
                //modt = GetData1(qry);

                DataTable maildt = new DataTable();
                string mailqry = "select * from Customer where Cust_mail = '" + email + "'";
                maildt = GetData1(mailqry);
                if (modt.Rows.Count == 0)
                {
                    if (maildt.Rows.Count == 0)
                    {
                        string query = "insert into Customer (Cust_name, Cust_mo, Cust_mail, Cust_address) values ('{0}','{1}','{2}','{3}')";
                        try
                        {
                            if (conn.State == ConnectionState.Closed)
                            {
                                conn.Open();
                            }
                            query = String.Format(query, name, mo, email, add);
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
                                string msg = " <p class='alert alert-success' role='alert'> Customer Added Successfuly</p> ";
                                message.Controls.Add(new Literal { Text = msg.ToString() });
                                cname.Value = " ";
                                mobile.Value = " ";
                                mail.Value = " ";
                                address.Value = " ";
                            }
                            else
                            {
                                string msg = " <div class='alert alert-danger' role='alert'>Some error occures Please Try again..!!</ div > ";
                                message.Controls.Add(new Literal { Text = msg.ToString() });
                            }
                        }
                    }
                    else
                    {
                        string msg = " <div class='alert alert-danger' role='alert'>Customer Already with Same E-mail Address..!!</ div > ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                    }
                }
                else
                {
                    string msg = " <div class='alert alert-danger' role='alert'>Customer Already with Same Mobile Number..!!</ div > ";
                    message.Controls.Add(new Literal { Text = msg.ToString() });
                }
            }
        }

        private DataTable GetData1(string query)
        {
            string constr = System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
    }
}