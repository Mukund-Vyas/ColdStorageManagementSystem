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
    public partial class PrintInvoice : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
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
    }
}