using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                conn.Open();
                string username = TextBox1.Text;
                string password = TextBox2.Text;
                string query = "SELECT COUNT(1) FROM SignUp WHERE CAST(username AS NVARCHAR(MAX))=@Username AND CAST(password AS NVARCHAR(MAX))=@Password";

                SqlCommand cm = new SqlCommand(query, conn);
                cm.Parameters.AddWithValue("@Username", username);
                cm.Parameters.AddWithValue("@Password", password);

                int count = Convert.ToInt32(cm.ExecuteScalar());

                if (count == 1) // If credentials are valid
                {
                    // Redirect to another page, e.g., Dashboard.aspx
                    Response.Redirect("choice.aspx");
                }
                else
                {
                    // Show an error message for invalid credentials
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid username or password.');", true);
                }
            }
        }
    }
}