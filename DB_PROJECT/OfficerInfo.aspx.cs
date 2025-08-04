using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class OfficerInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OfficerID.Attributes["min"] = "151";
            AgencyID.Attributes["max"] = "121";


        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                try
                {
                    conn.Open();

                    string query = @"INSERT INTO Officer 
                                     (Officer_ID, First_Name, Last_Name, Badge_Number, CNIC, Ranks, Phone_Numbers, Specialization, Date_of_Birth, Nationality, addresss_ID, Agency_ID) 
                                     VALUES 
                                     (@Officer_ID, @First_Name, @Last_Name, @Badge_Number, @CNIC, @Ranks, @Phone_Numbers, @Specialization, @Date_of_Birth, @Nationality, @addresss_ID, @Agency_ID)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Officer_ID", Convert.ToInt32(OfficerID.Text));
                        cmd.Parameters.AddWithValue("@First_Name", FirstName.Text);
                        cmd.Parameters.AddWithValue("@Last_Name", LastName.Text);
                        cmd.Parameters.AddWithValue("@Badge_Number", BadgeNumber.Text);
                        cmd.Parameters.AddWithValue("@CNIC", CNIC.Text);
                        cmd.Parameters.AddWithValue("@Ranks", Ranks.Text);
                        cmd.Parameters.AddWithValue("@Phone_Numbers", PhoneNumbers.Text);
                        cmd.Parameters.AddWithValue("@Specialization", Specialization.Text);
                        cmd.Parameters.AddWithValue("@Date_of_Birth", DateTime.Parse(DateOfBirth.Text));
                        cmd.Parameters.AddWithValue("@Nationality", Nationality.Text);
                        cmd.Parameters.AddWithValue("@addresss_ID", Convert.ToInt32(AddressID.Text));
                        cmd.Parameters.AddWithValue("@Agency_ID", Convert.ToInt32(AgencyID.Text));

                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Officer record inserted successfully.');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}