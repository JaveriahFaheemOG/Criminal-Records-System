using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class WitnessInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WitnessID.Attributes["min"] = "61";
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Establish connection to the database
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                try
                {
                    conn.Open();

                    // Define the SQL query to insert the witness record into the database
                    string query = @"INSERT INTO Witnesss 
                                     (Witness_ID, First_Name, Last_Name, CNIC, Date_of_Birth, Witness_Status, 
                                      Emotional_Trauma, Contact_Details, Statement_to_Police, addresss_ID) 
                                     VALUES 
                                     (@Witness_ID, @First_Name, @Last_Name, @CNIC, @Date_of_Birth, @Witness_Status, 
                                      @Emotional_Trauma, @Contact_Details, @Statement_to_Police, @addresss_ID)";

                    // Execute the command
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Witness_ID", Convert.ToInt32(WitnessID.Text));
                        cmd.Parameters.AddWithValue("@First_Name", FirstName.Text);
                        cmd.Parameters.AddWithValue("@Last_Name", LastName.Text);
                        cmd.Parameters.AddWithValue("@CNIC", CNIC.Text);
                        cmd.Parameters.AddWithValue("@Date_of_Birth", DateTime.Parse(DateOfBirth.Text));
                        cmd.Parameters.AddWithValue("@Witness_Status", WitnessStatus.Text);
                        cmd.Parameters.AddWithValue("@Emotional_Trauma", EmotionalTrauma.Text);
                        cmd.Parameters.AddWithValue("@Contact_Details", Convert.ToInt64(ContactDetails.Text));
                        cmd.Parameters.AddWithValue("@Statement_to_Police", StatementToPolice.Text);
                        cmd.Parameters.AddWithValue("@addresss_ID", Convert.ToInt32(AddressID.Text));

                        // Execute the query
                        cmd.ExecuteNonQuery();
                    }

                    // Show success message
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Witness record inserted successfully.');", true);
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