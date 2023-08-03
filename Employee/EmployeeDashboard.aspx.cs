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
    public partial class EmployeeDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            if (!this.IsPostBack)
            {
                //Populating a DataTable from database.
                DataTable dt = this.GetData();

                //Building an HTML string.
                StringBuilder html = new StringBuilder();
                string tooltip;

                //Table start.
                html.Append("<table id='table-id'>");

                //Building the Header row.
                html.Append("<thead><tr>");
                for (int i = 0; i < 6; i++)
                {
                    html.Append("<th>");
                    html.Append("Racks");
                    html.Append("</th>");
                }
                //foreach (DataColumn column in dt.Columns)
                //{
                //    html.Append("<th>");
                //    html.Append(column.ColumnName);
                //    html.Append("</th>");
                //}
                html.Append("</tr></thead>");

                int flg = 0;
                html.Append("<tbody><tr>");
                //Building the Data rows.
                foreach (DataRow row in dt.Rows)
                {
                    if (flg == 6)
                    {
                        html.Append("</tr>");
                        html.Append("<tr>");
                        flg = 0;
                    }
                    if (row[dt.Columns[2]].ToString() == "empty")
                    {
                        tooltip = "<td onclick='inword_req("+ row[dt.Columns[0]] + ")' data-tooltip='For " + row[dt.Columns[5]] + " Only, Dimention = " + row[dt.Columns[4]] + " feet, Capacity = " + row[dt.Columns[3]] + " man, Rent = " + row[dt.Columns[6]] + " / Month' data-tooltip-location='left'>";
                        //test.Controls.Add(new Literal { Text = tooltip.ToString() });
                        html.Append(tooltip);
                        html.Append(row[dt.Columns[0]]);
                        html.Append("</td>");
                        flg++;
                    }
                    else
                    {
                        DataTable data = new DataTable();
                        data = GetData1("SELECT * FROM Inword_cust where R_Id = "+row[dt.Columns[0]].ToString() + "and Status = 'Active'");
                        DataRow dr = data.Rows[0];
                        int qty = int.Parse(dr[data.Columns[7]].ToString());
                        string cname = dr[data.Columns[3]].ToString();
                        string cmo = dr[data.Columns[4]].ToString();
                        string prod = dr[data.Columns[5]].ToString();
                        int adv = int.Parse(dr[data.Columns[8]].ToString());

                        tooltip = "<td class='bg-primary' onclick='outword_req(" + row[dt.Columns[0]] + ")' data-tooltip='Customer Name = " + cname + ", Customer Mobile = " + cmo + ", Product = " + prod + ", qty=" + qty + " man, Advance Payed="+adv+ "' data-tooltip-location='left'>";
                        html.Append(tooltip);
                        html.Append(row[dt.Columns[0]]);
                        html.Append("</td>");
                        flg++;
                    }
                    //html.Append("<tr>");
                    //foreach (DataColumn column in dt.Columns)
                    //{
                    //    string tt = row[dt.Columns[2]].ToString();
                    //    string txt = row[column.ColumnName].ToString();
                    //    html.Append("<td>");
                    //    html.Append(row[column.ColumnName]);
                    //    html.Append("</td>");
                    //}
                    //html.Append("</tr>");
                }
                //for (int i = 0; i < 40; i++)
                //{
                //    if (flg == 6)
                //    {
                //        html.Append("</tr>");
                //        html.Append("<tr>");
                //        flg = 0;
                //    }
                //    html.Append("<td>");
                //    html.Append("100");
                //    html.Append("</td>");
                //    flg++;
                //}
                html.Append("</tr></tbody>");
                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                Racks.Controls.Add(new Literal { Text = html.ToString() });
            }
        }

        private DataTable GetData()
        {
            string constr = System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT R_Id, S_Id, Status, Capacity, Dimention, Product, Rent FROM Racks"))
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

        protected void search_Click(object sender, EventArgs e)
        {
            string name = custname.Value.ToString().Trim();
            string mo = custmo.Value.ToString().Trim();
            string qry = "";
            if (name != "" && mo != "")
            {
                qry = "SELECT * FROM Inword_cust where Cust_name = '" + name + "' and Cust_mo = '" + mo + "' and Status='Active';";
            }

            else if (name != "" && mo == "")
            {
                qry = "SELECT * FROM Inword_cust where Cust_name = '" + name + "' and Status='Active';";
            }

            else if (name == "" && mo != "")
            {
                qry = "SELECT * FROM Inword_cust where Cust_mo='" + mo + "' and Status='Active';";
            }

            else
            {
                test.Controls.Add(new Literal { Text = "No Such Custemer in Inword List..!" });
                return;
            }


            StringBuilder html = new StringBuilder();
            DataTable dt = this.GetData1(qry);

            html.Append("<table id='table-id'>");
            html.Append("<thead><tr>");
            for (int i = 0; i < 6; i++)
            {
                html.Append("<th>");
                html.Append("Racks");
                html.Append("</th>");
            }
            html.Append("</tr></thead>");

            int flg = 0;
            string tooltip;

            html.Append("<tbody><tr>");
            foreach (DataRow row in dt.Rows)
            {
                if (flg == 6)
                {
                    html.Append("</tr>");
                    html.Append("<tr>");
                    flg = 0;
                }

                tooltip = "<td class='bg-primary' onclick='outword_req(" + row[dt.Columns[1]] + ")' data-tooltip='Customer Name = " + row[dt.Columns[3]].ToString() + ", Customer Mobile = " + row[dt.Columns[4]].ToString() + ", Product = " + row[dt.Columns[5]].ToString() + ", qty=" + row[dt.Columns[7]].ToString() + " man, Advance Payed=" + row[dt.Columns[8]].ToString() + "' data-tooltip-location='left'>";
                html.Append(tooltip);
                html.Append(row[dt.Columns[1]]);
                html.Append("</td>");
                flg++;
            }
            html.Append("</tr></tbody>");
            html.Append("</table>");

            test.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}