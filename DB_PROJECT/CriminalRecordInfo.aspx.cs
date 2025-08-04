using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class CriminalRecordInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RecordID.Attributes["min"] = "121";
            CourtID.Attributes["min"] = "81";
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                try
                {
                    conn.Open();
                    string query = @"INSERT INTO Criminal_Record 
                                     (Record_ID, Statuss, Parole_Status, Probation_Status, Date_Recorded, Date_List_Updated, Habitual_Offender, No_of_Previous_Convictions, Court_ID) 
                                     VALUES 
                                     (@Record_ID, @Statuss, @Parole_Status, @Probation_Status, @Date_Recorded, @Date_List_Updated, @Habitual_Offender, @No_of_Previous_Convictions, @Court_ID)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Record_ID", Convert.ToInt32(RecordID.Text));
                        cmd.Parameters.AddWithValue("@Statuss", Status.Text);
                        cmd.Parameters.AddWithValue("@Parole_Status", ParoleStatus.Text);
                        cmd.Parameters.AddWithValue("@Probation_Status", ProbationStatus.Text);
                        cmd.Parameters.AddWithValue("@Date_Recorded", DateTime.Parse(DateRecorded.Text));
                        cmd.Parameters.AddWithValue("@Date_List_Updated", DateTime.Parse(DateListUpdated.Text));
                        cmd.Parameters.AddWithValue("@Habitual_Offender", HabitualOffender.Text);
                        cmd.Parameters.AddWithValue("@No_of_Previous_Convictions", Convert.ToInt32(NoOfPreviousConvictions.Text));
                        cmd.Parameters.AddWithValue("@Court_ID", Convert.ToInt32(CourtID.Text));

                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Criminal record inserted successfully.');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}