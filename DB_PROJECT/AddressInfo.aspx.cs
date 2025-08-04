using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class AddressInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AddressID.Attributes["min"] = "42";
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                try
                {
                    conn.Open();
                    string query = @"INSERT INTO Adress (Address_ID, Street, City, States, Postal_Code, Country) 
                                     VALUES (@Address_ID, @Street, @City, @States, @Postal_Code, @Country)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Address_ID", Convert.ToInt32(AddressID.Text));
                        cmd.Parameters.AddWithValue("@Street", Street.Text);
                        cmd.Parameters.AddWithValue("@City", City.Text);
                        cmd.Parameters.AddWithValue("@States", State.Text);
                        cmd.Parameters.AddWithValue("@Postal_Code", Convert.ToInt32(PostalCode.Text));
                        cmd.Parameters.AddWithValue("@Country", Country.Text);

                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Address record inserted successfully.');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}