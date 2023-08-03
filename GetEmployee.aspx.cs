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
    public partial class GetEmployee : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString);
        SqlCommand Cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("login.aspx");
            }
            ShowItems();
        }
        private void ShowItems()
        {
            String Query = "Select * from Employees";
            EmployeeList.DataSource = GetData(Query);
            EmployeeList.DataBind();
        }

        public DataTable GetData(String Query)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter Sda = new SqlDataAdapter(Query, conn);
            Sda.Fill(dt);
            return dt;
        }
        public int SetData(String Query)
        {
            int rcnt = 0;
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            Cmd.CommandText = Query;
            Cmd.Connection = conn;
            rcnt = Cmd.ExecuteNonQuery();
            conn.Close();
            return rcnt;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ename.Value = EmployeeList.SelectedRow.Cells[2].Text;
            mobile.Value = EmployeeList.SelectedRow.Cells[3].Text;
            email.Value = EmployeeList.SelectedRow.Cells[4].Text;
            salary.Value = EmployeeList.SelectedRow.Cells[5].Text;
            uname.Value = EmployeeList.SelectedRow.Cells[6].Text;
            pwd.Value = EmployeeList.SelectedRow.Cells[7].Text;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "rem()", true);
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (ename.Value == "" || mobile.Value == "" || email.Value == "" || salary.Value == "" || uname.Value == "" || pwd.Value == "")
                {
                    string msg = " <p class='alert alert-danger' role='alert'>Missing Information</ p> ";
                    message.Controls.Add(new Literal { Text = msg.ToString() });
                }
                else
                {
                    string name = ename.Value.ToString();
                    string mo = mobile.Value.ToString();
                    string mail = email.Value.ToString();
                    int slry = int.Parse(salary.Value.ToString());
                    string unm = uname.Value.ToString();
                    string pass = pwd.Value.ToString();
                    string Query = "update Employees set E_name = '" + name + "', E_mo = '" + mo + "', E_mail='"+mail+ "', Salary=" + slry + ", U_name='" + unm + "', Password='" + pass + "' where E_Id =" + Convert.ToInt32(EmployeeList.SelectedRow.Cells[1].Text);
                    //Query = String.Format(Query, name, rnt, Convert.ToInt32(ItemsList.SelectedRow.Cells[1].Text));
                    SetData(Query);
                    ename.Value = " ";
                    mobile.Value = " ";
                    email.Value = " ";
                    salary.Value = " ";
                    uname.Value = " ";
                    pwd.Value = " ";
                    ShowItems();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.StackTrace.ToString());
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            using (conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString))
            {
                int rcnt = 0;
                string name = ename.Value.ToString();
                string mo = mobile.Value.ToString();
                string mail = email.Value.ToString();
                int slry = int.Parse(salary.Value.ToString());
                string unm = uname.Value.ToString();
                string pass = pwd.Value.ToString();
                string query = "insert into Employees (E_name, E_mo, E_mail, Salary, U_name, Password) values ('{0}','{1}','{2}',{3},'{4}','{5}')";
                try
                {
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    query = String.Format(query, name, mo, mail, slry, unm, pass);
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
                        string msg = " <p class='alert alert-success' role='alert'>Employee Added Successfuly</p> ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                        ShowItems();
                        ename.Value = " ";
                        mobile.Value = " ";
                        email.Value = " ";
                        salary.Value = " ";
                        uname.Value = " ";
                        pwd.Value = " ";
                    }
                    else
                    {
                        string msg = " <p class='alert alert-danger' role='alert'>Some error occures Please Try again..!!</ p> ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                    }
                }
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (ename.Value == "" || mobile.Value == "" || email.Value == "" || salary.Value == "" || uname.Value == "")
                {
                    string msg = " <p class='alert alert-danger' role='alert'>Missing Information</ p> ";
                    message.Controls.Add(new Literal { Text = msg.ToString() });
                }
                else
                {

                    string Query = "Delete from Employees Where E_Id='{0}'";
                    Query = String.Format(Query, Convert.ToInt32(EmployeeList.SelectedRow.Cells[1].Text));
                    SetData(Query);
                    ShowItems();
                    string msg = " <p class='alert alert-success' role='alert'>Employee Removed</ p> ";
                    message.Controls.Add(new Literal { Text = msg.ToString() });
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.StackTrace.ToString());

            }
            ename.Value = " ";
            mobile.Value = " ";
            email.Value = " ";
            salary.Value = " ";
            uname.Value = " ";
            pwd.Value = " ";
        }

        protected void EmployeeList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[4].Visible = false;
        }
    }
}