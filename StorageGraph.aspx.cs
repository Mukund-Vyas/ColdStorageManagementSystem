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
    public partial class StorageGraph : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!this.IsPostBack)
            {
                //Populating a DataTable from database.
                DataTable dt = this.GetData();

                //Building an HTML string.
                StringBuilder html = new StringBuilder();
                String tooltip;

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
                    Random rand = new Random();
                    if (flg == 6)
                    {
                        html.Append("</tr>");
                        html.Append("<tr>");
                        flg = 0;
                    }
                    if (row[dt.Columns[2]].ToString() == "empty")
                    {
                        html.Append("<td>");
                        html.Append(row[dt.Columns[0]]);
                        html.Append("</td>");
                        flg++;
                    }
                    else
                    {
                        html.Append("<td bgcolor=#3B71CA title='this block is full'>");
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
                using (SqlCommand cmd = new SqlCommand("SELECT R_Id, S_Id, Status FROM Racks"))
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