using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class VictimInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VictimID.Attributes["min"] = "51";
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Establish connection to the database
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                try
                {
                    conn.Open();

                    // Define the SQL query to insert the victim record into the database
                    string query = @"INSERT INTO Victim 
                                     (Victim_ID, First_Name, Last_Name, CNIC, Date_of_Birth, Relation_to_Criminal, Inquiry_Severity, 
                                      Victim_Status, Emotional_Trauma, Contact, Statement_to_Police, addresss_ID) 
                                     VALUES 
                                     (@Victim_ID, @First_Name, @Last_Name, @CNIC, @Date_of_Birth, @Relation_to_Criminal, @Inquiry_Severity, 
                                      @Victim_Status, @Emotional_Trauma, @Contact, @Statement_to_Police, @addresss_ID)";

                    // Execute the command
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Victim_ID", Convert.ToInt32(VictimID.Text));
                        cmd.Parameters.AddWithValue("@First_Name", FirstName.Text);
                        cmd.Parameters.AddWithValue("@Last_Name", LastName.Text);
                        cmd.Parameters.AddWithValue("@CNIC", CNIC.Text);
                        cmd.Parameters.AddWithValue("@Date_of_Birth", DateTime.Parse(DateOfBirth.Text));
                        cmd.Parameters.AddWithValue("@Relation_to_Criminal", RelationToCriminal.Text);
                        cmd.Parameters.AddWithValue("@Inquiry_Severity", InquirySeverity.Text);
                        cmd.Parameters.AddWithValue("@Victim_Status", VictimStatus.Text);
                        cmd.Parameters.AddWithValue("@Emotional_Trauma", EmotionalTrauma.Text);
                        cmd.Parameters.AddWithValue("@Contact", Convert.ToInt64(Contact.Text));
                        cmd.Parameters.AddWithValue("@Statement_to_Police", StatementToPolice.Text);
                        cmd.Parameters.AddWithValue("@addresss_ID", Convert.ToInt32(AddressID.Text));

                        // Execute the query
                        cmd.ExecuteNonQuery();
                    }

                    // Show success message
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Victim record inserted successfully.');", true);
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