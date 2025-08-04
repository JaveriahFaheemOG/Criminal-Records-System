using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace DB_PROJECT
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;");
            conn.Open();
            SqlCommand cm;
            string name = TextBox1.Text;
            string un = TextBox2.Text;
            string pass = TextBox3.Text;
            string query = "Insert into SignUp(name, username, password) values ('" + name + "','" + un + "','" + pass + "')";
            cm = new SqlCommand(query, conn);
            cm.ExecuteNonQuery();
            cm.Dispose();
            conn.Close();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}