using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ColdStorageManagementSystem
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("login.aspx");
            }

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString);

            DataTable dt = new DataTable();
            SqlDataAdapter data = new SqlDataAdapter("select * from Storage", conn);
            data.Fill(dt);

            storage.Text = dt.Rows.Count.ToString();

            DataTable edt = new DataTable();
            SqlDataAdapter edata = new SqlDataAdapter("select * from Employees", conn);
            edata.Fill(edt);

            employee.Text = edt.Rows.Count.ToString();


            DataTable rdt = new DataTable();
            SqlDataAdapter rdata = new SqlDataAdapter("select COUNT(R_Id) as num from Racks where Status = 'empty';", conn);
            rdata.Fill(rdt);
            DataRow rck = rdt.Rows[0];

            rack.Text = rck[rdt.Columns["num"]].ToString();

            DataTable qdt = new DataTable();
            SqlDataAdapter qdata = new SqlDataAdapter("select SUM(Total_qty) as total from Inword where Status = 'Active';", conn);
            qdata.Fill(qdt);

            DataRow qty = qdt.Rows[0];
            Quantity.Text = qty[qdt.Columns["total"]].ToString();
        }
    }
}