using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class CriminalRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CriminalID.Attributes["min"] = "161";
                AddressID.Attributes["min"] = "42";
                CrimeID.Attributes["min"] = "72";
                RecordID.Attributes["min"] = "121";
                FileIDs.Attributes["min"] = "141";
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                try
                {
                    conn.Open();

                    string query = @"
                        INSERT INTO Criminal (Criminal_ID, First_Name, Last_Name, Alias, CNIC, Date_of_Birth, Phone_Number, Previous_Conviction, Addresss_ID, Crime_ID, Record_ID, File_IDs) 
                        VALUES (@Criminal_ID, @First_Name, @Last_Name, @Alias, @CNIC, @Date_of_Birth, @Phone_Number, @Previous_Conviction, @Addresss_ID, @Crime_ID, @Record_ID, @File_IDs)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Criminal_ID", Convert.ToInt32(CriminalID.Text));
                        cmd.Parameters.AddWithValue("@First_Name", FirstName.Text);
                        cmd.Parameters.AddWithValue("@Last_Name", LastName.Text);
                        cmd.Parameters.AddWithValue("@Alias", Alias.Text);
                        cmd.Parameters.AddWithValue("@CNIC", CNIC.Text);
                        cmd.Parameters.AddWithValue("@Date_of_Birth", Convert.ToDateTime(DateOfBirth.Text));
                        cmd.Parameters.AddWithValue("@Phone_Number", PhoneNumber.Text);
                        cmd.Parameters.AddWithValue("@Previous_Conviction", PreviousConviction.Text);
                        cmd.Parameters.AddWithValue("@Addresss_ID", Convert.ToInt32(AddressID.Text));
                        cmd.Parameters.AddWithValue("@Crime_ID", Convert.ToInt32(CrimeID.Text));
                        cmd.Parameters.AddWithValue("@Record_ID", Convert.ToInt32(RecordID.Text));
                        cmd.Parameters.AddWithValue("@File_IDs", FileIDs.Text);

                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record inserted successfully.');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }

    }
}