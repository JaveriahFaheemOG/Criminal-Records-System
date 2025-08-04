using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class ArrestInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArrestID.Attributes["min"] = "171";
            CriminalID.Attributes["min"] = "162";
            OfficerID.Attributes["min"] = "141";
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Establish connection to the database
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                try
                {
                    conn.Open();

                    // Define the SQL query to insert the arrest record into the database
                    string query = @"INSERT INTO Arrest 
                                     (Arrest_ID, Arrest_Warrant_Description, Datetime_of_Arrest, Location_of_Arrest, Criminal_ID, Officer_ID) 
                                     VALUES 
                                     (@Arrest_ID, @Arrest_Warrant_Description, @Datetime_of_Arrest, @Location_of_Arrest, @Criminal_ID, @Officer_ID)";

                    // Execute the command
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Arrest_ID", Convert.ToInt32(ArrestID.Text));
                        cmd.Parameters.AddWithValue("@Arrest_Warrant_Description", ArrestWarrantDescription.Text);
                        cmd.Parameters.AddWithValue("@Datetime_of_Arrest", DateTime.Parse(DatetimeOfArrest.Text));
                        cmd.Parameters.AddWithValue("@Location_of_Arrest", LocationOfArrest.Text);
                        cmd.Parameters.AddWithValue("@Criminal_ID", Convert.ToInt32(CriminalID.Text));
                        cmd.Parameters.AddWithValue("@Officer_ID", Convert.ToInt32(OfficerID.Text));

                        // Execute the query
                        cmd.ExecuteNonQuery();
                    }

                    // Show success message
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Arrest record inserted successfully.');", true);
                }
                catch (Exception ex)
                {
                    // Show error message if any exception occurs
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}