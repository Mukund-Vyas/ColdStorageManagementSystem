using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ColdStorageManagementSystem.Employee
{
    public partial class Racks : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString);
        SqlCommand Cmd = new SqlCommand();
        Color dark = ColorTranslator.FromHtml("#0dcaf0");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            ShowItems();
        }

        private void ShowItems()
        {
            String Query = "Select * from Racks";
            rack_list.DataSource = GetData(Query);
            rack_list.DataBind();
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

        protected void rack_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            rid.Value = rack_list.SelectedRow.Cells[1].Text;
            floor.Value = rack_list.SelectedRow.Cells[2].Text;
            capacity.Value = rack_list.SelectedRow.Cells[3].Text;
            rent.Value = rack_list.SelectedRow.Cells[4].Text;
            dimension.Value = rack_list.SelectedRow.Cells[6].Text;
            product.Value = rack_list.SelectedRow.Cells[7].Text;
            rack_list.SelectedRow.BackColor = dark;
            rack_list.SelectedRow.ForeColor = Color.White;
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            using (conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString))
            {
                int rcnt = 0, flag = 0;
                string raid = rid.Value.ToString();
                string fid = floor.Value.ToString();
                string cap = capacity.Value.ToString();
                string rnt = rent.Value.ToString();
                string di = dimension.Value.ToString();
                string prd = product.Value.ToString();

                string query = "insert into Racks (R_Id, Floor_no, Capacity, Rent, Dimention, Product) values ("+raid+ ","+fid+","+cap+","+rnt+",'"+di+"','"+prd+"')";
                try
                {
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    Cmd.CommandText = query;
                    Cmd.Connection = conn;
                    rcnt = Cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Please Try Again');</script>");
                    flag = 1;
                }
                finally
                {
                    if (rcnt != 0)
                    {
                        string msg = " <p class='alert alert-success' role='alert'> Rack Added Successfuly</p> ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                        ShowItems();
                        rid.Value = "";
                        floor.Value = "";
                        capacity.Value = "";
                        rent.Value = "";
                        dimension.Value = "";
                        product.Value = "";
                    }

                    else if (flag == 1)
                    {
                        string msg = " <p class='alert alert-danger' role='alert'>Some error occures Please Try again with diffent Values..!!</ p> ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                    }

                    else
                    {
                        string msg = " <p class='alert alert-danger' role='alert'>Some error occures Please Try again..!!</ p> ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                    }
                }
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (rid.Value == "" || floor.Value == "" || capacity.Value == "" || rent.Value == "" || dimension.Value == "" || product.Value == "")
                {
                    string msg = " <p class='alert alert-danger' role='alert'>Missing Information</ p> ";
                    message.Controls.Add(new Literal { Text = msg.ToString() });
                }
                else
                {
                    string raid = rid.Value.ToString();
                    string fid = floor.Value.ToString();
                    string cap = capacity.Value.ToString();
                    string rnt = rent.Value.ToString();
                    string di = dimension.Value.ToString();
                    string prd = product.Value.ToString();
                    string Query = "update Racks set Floor_no="+fid+",Capacity = "+cap+", Dimention = '"+di+ "', Product = '" + prd + "',Rent = " + rnt + " where R_Id =" + Convert.ToInt32(rack_list.SelectedRow.Cells[1].Text);
                    //Query = String.Format(Query, name, rnt, Convert.ToInt32(ItemsList.SelectedRow.Cells[1].Text));
                    SetData(Query);
                    rid.Value = "";
                    floor.Value = "";
                    capacity.Value = "";
                    rent.Value = "";
                    dimension.Value = "";
                    product.Value = "";
                    ShowItems();
                }
            }
            catch (Exception)
            {
                //Response.Write(ex.StackTrace.ToString());
                string msg = " <p class='alert alert-danger' role='alert'>Some Error is there Please Try again..!</ p> ";
                message.Controls.Add(new Literal { Text = msg.ToString() });
            }
        }
    }
}