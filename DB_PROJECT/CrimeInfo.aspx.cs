using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class CrimeInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrimeID.Attributes["min"] = "72";
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                try
                {
                    conn.Open();
                    string query = @"INSERT INTO Crime 
                                     (Crime_ID, Description, Crime_Type, Date_of_Crime, Location_of_Crime, Weapon_Used, Time_of_Crime_Reported, Targeted_At, No_of_Witness) 
                                     VALUES 
                                     (@Crime_ID, @Description, @Crime_Type, @Date_of_Crime, @Location_of_Crime, @Weapon_Used, @Time_of_Crime_Reported, @Targeted_At, @No_of_Witness)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Crime_ID", Convert.ToInt32(CrimeID.Text));
                        cmd.Parameters.AddWithValue("@Description", Description.Text);
                        cmd.Parameters.AddWithValue("@Crime_Type", CrimeType.Text);
                        cmd.Parameters.AddWithValue("@Date_of_Crime", DateTime.Parse(DateOfCrime.Text));
                        cmd.Parameters.AddWithValue("@Location_of_Crime", LocationOfCrime.Text);
                        cmd.Parameters.AddWithValue("@Weapon_Used", WeaponUsed.Text);
                        cmd.Parameters.AddWithValue("@Time_of_Crime_Reported", TimeOfCrimeReported.Text);
                        cmd.Parameters.AddWithValue("@Targeted_At", TargetedAt.Text);
                        cmd.Parameters.AddWithValue("@No_of_Witness", Convert.ToInt32(NoOfWitness.Text));

                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Crime record inserted successfully.');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}