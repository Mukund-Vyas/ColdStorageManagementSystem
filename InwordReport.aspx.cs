using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ColdStorageManagementSystem.CSMSDataSet1TableAdapters;
using ColdStorageManagementSystem.CSMSDataSetTableAdapters;

namespace ColdStorageManagementSystem
{
    public partial class InwordReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM Inword_cust";
            }
        }

        protected void search_btn_Click(object sender, EventArgs e)
        {
            if (from.Value != null && to.Value != null)
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM Inword_cust WHERE ( Date BETWEEN '" + from.Value.ToString() + "' AND '" + to.Value.ToString() + "');";
                Response.Write(" ");
            }
        }
    }
}