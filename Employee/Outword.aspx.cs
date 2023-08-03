using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ColdStorageManagementSystem.Employee
{
    public partial class Outword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            if (Request.QueryString.AllKeys.Contains("err"))
            {
                if (Request.QueryString["err"] != null)
                {
                    DataTable data = GetData1("SELECT * FROM inword_cust where R_Id = " + Request.QueryString["err"].ToString() + " and Status = 'Active';");
                    DataRow dr = data.Rows[0];
                    DateTime tody = DateTime.Now;
                    DateTime dt = DateTime.Parse(dr[data.Columns[9]].ToString());
                    int datediff = Math.Abs(12 * (tody.Year - dt.Year) + tody.Month - dt.Month);
                    if (datediff <= 0)
                    {
                        datediff = 1;
                    }
                    int amount = datediff * int.Parse(dr[data.Columns[6]].ToString());
                    date.Text = DateTime.Now.ToString("D");
                    idate.Text = DateTime.Parse(dr[data.Columns[9]].ToString()).ToString("D");
                    name.Text = dr[data.Columns[3]].ToString();
                    mobile.Text = dr[data.Columns[4]].ToString();
                    rid.Text = dr[data.Columns[1]].ToString();
                    iid.Text = dr[data.Columns[2]].ToString();
                    qty.Text = dr[data.Columns[7]].ToString();
                    month.Text = datediff.ToString();
                    rent.Text = dr[data.Columns[6]].ToString();
                    amt.Text = amount.ToString();
                    advance.Text = dr[data.Columns[8]].ToString();
                    total.Text = (amount - int.Parse(dr[data.Columns[8]].ToString())).ToString();
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

        private int Update(string query)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = conn;

            int re = cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            return re;
        }

        protected void ok_btn_Click(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("err"))
            {
                if (Request.QueryString["err"] != null)
                {
                    DataTable data = GetData1("SELECT * FROM inword_cust where R_Id = " + Request.QueryString["err"].ToString() + " and Status = 'Active';");
                    DataRow dr = data.Rows[0];
                    DateTime tody = DateTime.Now;
                    DateTime dt = DateTime.Parse(dr[data.Columns[9]].ToString());
                    int datediff = Math.Abs(12 * (tody.Year - dt.Year) + tody.Month - dt.Month);
                    if (datediff <= 0)
                    {
                        datediff = 1;
                    }
                    int amount = datediff * int.Parse(dr[data.Columns[6]].ToString());
                    //date.Text = DateTime.Now.ToString("D");
                    //idate.Text = DateTime.Parse(dr[data.Columns[9]].ToString()).ToString("D");
                    //name.Text = dr[data.Columns[3]].ToString();
                    //mobile.Text = dr[data.Columns[4]].ToString();
                    //rid.Text = dr[data.Columns[1]].ToString();
                    //iid.Text = dr[data.Columns[2]].ToString();
                    //qty.Text = dr[data.Columns[7]].ToString();
                    //month.Text = datediff.ToString();
                    //rent.Text = dr[data.Columns[6]].ToString();
                    //amt.Text = amount.ToString();
                    //advance.Text = dr[data.Columns[8]].ToString();
                    //total.Text = (amount - int.Parse(dr[data.Columns[8]].ToString())).ToString();

                    string upqry = "UPDATE Racks SET Status = 'empty' where R_ID = " + dr[data.Columns[1]].ToString();
                    int re = Update(upqry);

                    int iid = int.Parse(dr[data.Columns[2]].ToString());
                    string inup = "UPDATE Inword SET Status = 'Closed' where In_Id = " + iid.ToString();
                    int inrs = Update(inup);

                    if (re != 0 && inrs > 0)
                    {
                        int qty = int.Parse(dr[data.Columns[7]].ToString());
                        int total = amount - int.Parse(dr[data.Columns[8]].ToString());
                        int cid = int.Parse(dr[data.Columns[0]].ToString());

                        string inqry = "INSERT INTO Outward (In_Id, Cust_ID, Total_amount, Total_qty) values ("+iid+","+cid+",'"+total+"',"+qty+");";
                        int rs = Update(inqry);

                        if (rs < 1)
                        {
                            Response.Write("<script>alert('Some Error accure Please Try again.!');</script>");
                            upqry = "UPDATE Rackes SET Status = 'full' where R_ID = " + dr[data.Columns[1]].ToString();
                            re = Update(upqry);
                        }

                        Response.Redirect("EmployeeDashboard.aspx");
                    }
                }
            }
        }
    }
}