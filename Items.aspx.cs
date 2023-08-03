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
    public partial class Items : System.Web.UI.Page
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
            String Query = "Select * from Items";
            ItemsList.DataSource = GetData(Query);
            ItemsList.DataBind();
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

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            using (conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString))
            {
                int rcnt = 0;
                string name = iname.Value.ToString();
                int rnt = int.Parse(rent.Value.ToString());
                string query = "insert into Items (I_name, Rent) values ('{0}',{1})";
                try
                {
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    query = String.Format(query, name, rnt);
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
                        string msg = " <p class='alert alert-success' role='alert'> Item Added Successfuly</p> ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                        ShowItems();
                        iname.Value = " ";
                        rent.Value = " ";
                    }
                    else
                    {
                        string msg = " <p class='alert alert-danger' role='alert'>Some error occures Please Try again..!!</ p> ";
                        message.Controls.Add(new Literal { Text = msg.ToString() });
                    }
                }
            }
        }

        protected void ItemsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            iname.Value = ItemsList.SelectedRow.Cells[2].Text;
            rent.Value = ItemsList.SelectedRow.Cells[3].Text;
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (iname.Value == "" || rent.Value == "")
                {
                    string msg = " <p class='alert alert-danger' role='alert'>Missing Information</ p> ";
                    message.Controls.Add(new Literal { Text = msg.ToString() });
                }
                else
                {

                    string name = iname.Value.ToString();
                    int rnt = int.Parse(rent.Value.ToString());
                    string Query = "update Items set I_name = '"+ name + "', Rent = "+ rnt + " where I_Id ="+ Convert.ToInt32(ItemsList.SelectedRow.Cells[1].Text);
                    //Query = String.Format(Query, name, rnt, Convert.ToInt32(ItemsList.SelectedRow.Cells[1].Text));
                    SetData(Query);
                    iname.Value = " ";
                    rent.Value = " ";
                    ShowItems();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.StackTrace.ToString());


            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (iname.Value == "")
                {
                    string msg = " <p class='alert alert-danger' role='alert'>Missing Information</ p> ";
                    message.Controls.Add(new Literal { Text = msg.ToString() });
                }
                else
                {

                    string Query = "Delete from Items Where I_Id='{0}'";
                    Query = String.Format(Query, Convert.ToInt32(ItemsList.SelectedRow.Cells[1].Text));
                    SetData(Query);
                    ShowItems();
                    string msg = " <p class='alert alert-success' role='alert'>Item Deleted</ p> ";
                    message.Controls.Add(new Literal { Text = msg.ToString() });
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.StackTrace.ToString());

            }
            iname.Value = " ";
            rent.Value = " ";
        }
    }
}