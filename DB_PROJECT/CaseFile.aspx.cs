using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class CaseFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FileIDs.Attributes["min"] = "141";
            AgencyID.Attributes["min"] = "121";
            JudgeID.Attributes["min"] = "71";
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                try
                {
                    conn.Open();
                    string query = @"INSERT INTO Case_File 
                                     (File_IDs, Case_Number, Case_Status, Date_Opened, Date_Closed, Final_Verdict, Attribute, Appeal_Status, Agency_ID, Judge_ID) 
                                     VALUES 
                                     (@File_IDs, @Case_Number, @Case_Status, @Date_Opened, @Date_Closed, @Final_Verdict, @Attribute, @Appeal_Status, @Agency_ID, @Judge_ID)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@File_IDs", Convert.ToInt32(FileIDs.Text));
                        cmd.Parameters.AddWithValue("@Case_Number", CaseNumber.Text);
                        cmd.Parameters.AddWithValue("@Case_Status", CaseStatus.Text);
                        cmd.Parameters.AddWithValue("@Date_Opened", DateTime.Parse(DateOpened.Text));
                        cmd.Parameters.AddWithValue("@Date_Closed", string.IsNullOrEmpty(DateClosed.Text) ? (object)DBNull.Value : DateTime.Parse(DateClosed.Text));
                        cmd.Parameters.AddWithValue("@Final_Verdict", FinalVerdict.Text);
                        cmd.Parameters.AddWithValue("@Attribute", Attribute.Text);
                        cmd.Parameters.AddWithValue("@Appeal_Status", AppealStatus.Text);
                        cmd.Parameters.AddWithValue("@Agency_ID", Convert.ToInt32(AgencyID.Text));
                        cmd.Parameters.AddWithValue("@Judge_ID", Convert.ToInt32(JudgeID.Text));

                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Case file record inserted successfully.');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}