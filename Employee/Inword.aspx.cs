using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ColdStorageManagementSystem.Employee
{
    public partial class Inword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["csmsdb"].ConnectionString);
        SqlCommand cmd1 = new SqlCommand();
        SqlCommand cmd = new SqlCommand();
        String rid,cid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            if (Request.QueryString["err"] != null)
            {
                //check.Text = Request.QueryString["err"].ToString();
                rid = Request.QueryString["err"].ToString();
            }
            else
            {
                //check.Text = "Nay thatu";
                Response.Redirect("EmployeeDashboard.aspx");
            }
        }
        private DataTable getData(string Qry)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter data = new SqlDataAdapter(Qry, conn);
            data.Fill(dt);
            return dt;
        }

        protected void ok_btn_Click(object sender, EventArgs e)
        {
            if (Mo_no.Text == "")
            {
                string msg = " <p class='alert alert-danger' role='alert'> Please Enter Mobile Number...</p> ";
                message.Controls.Add(new Literal { Text = msg.ToString() });
            }
            else
            {
                conn.Open();
                DataTable cust_dt = new DataTable();
                string Cust_qry = "Select Cust_Id,Cust_name From Customer where Cust_mo='" + Mo_no.Text.ToString() + "'";
                cust_dt = getData(Cust_qry);
                DataRow row = cust_dt.Rows[0];
                cid = row[cust_dt.Columns[0]].ToString();
                int ad = int.Parse(advance.Value);
                int qty = int.Parse(quantity.Value);
                string query = "insert into Inword (C_Id, R_Id, Total_qty, Ad_Payed) values ("+cid+ "," + rid + "," + qty + "," + ad + ")";
                string rqry = "update Racks set Status = 'full' where R_Id = "+ rid;
                cmd1.CommandText = query;
                cmd1.Connection = conn;

                cmd.CommandText = rqry;
                cmd.Connection = conn;
                if (cmd1.ExecuteNonQuery() != 0 && cmd.ExecuteNonQuery() != 0)
                {
                    Response.Redirect("EmployeeDashboard.aspx");
                }

                else
                {
                    string msg = " <p class='alert alert-danger' role='alert'> Some Problem is there Please Try again...</p> ";
                    message.Controls.Add(new Literal { Text = msg.ToString() });
                }
                //check.Text = query;

            }
        }

        protected void Mo_no_TextChanged(object sender, EventArgs e)
        {
            ok_btn.Enabled = true;
            conn.Open();
            DataTable cust_dt = new DataTable();
            string Cust_qry = "Select Cust_Id,Cust_name From Customer where Cust_mo='"+Mo_no.Text.ToString()+"'";
            cust_dt = getData(Cust_qry);
            if (cust_dt.Rows.Count > 0)
            {
                DataRow row = cust_dt.Rows[0];
                cid = row[cust_dt.Columns[0]].ToString();
                CustName.DataSource = cust_dt;
                CustName.DataTextField = "Cust_name";
                CustName.DataValueField = "Cust_Id";
                CustName.DataBind();
                //check.Text = "rid = " + rid + ", cid = " + cid;
            }
            else
            {
                string msg = " <p class='alert alert-danger' role='alert'> No Such a Custemer...</p> ";
                message.Controls.Add(new Literal { Text = msg.ToString() });
                ok_btn.Enabled = false;
            }
        }
    }
}