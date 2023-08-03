using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ColdStorageManagementSystem
{
    public class Function
    {
        private SqlConnection conn;
        private SqlCommand Cmd;
        private DataTable dt;
        private SqlDataAdapter Sda;

        public Function()
        {
            conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CSMSdb"].ConnectionString);
            Cmd = new SqlCommand();
            Cmd.Connection = conn;
        }
        public DataTable GetData(String Query)
        {
            dt = new DataTable();
            Sda = new SqlDataAdapter(Query, conn);
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
            rcnt = Cmd.ExecuteNonQuery();
            conn.Close();
            return rcnt;
        }
    }
}