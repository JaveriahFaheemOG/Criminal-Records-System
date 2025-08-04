using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DB_PROJECT
{
    public partial class DeleteRecord : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear the table data on the initial load
                TableData.Text = string.Empty;
            }
        }

        protected void ViewTableButton_Click(object sender, EventArgs e)
        {
            string tableName = TableName.SelectedValue;

            // Validation for empty table selection
            if (string.IsNullOrWhiteSpace(tableName))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a table to view.');", true);
                return;
            }

            // Display the selected table's data
            DisplayTableData(tableName);
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string tableName = TableName.SelectedValue;
            string recordID = RecordID.Text;

            // Validation for empty inputs
            if (string.IsNullOrWhiteSpace(tableName) || string.IsNullOrWhiteSpace(recordID))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a table and provide a valid ID.');", true);
                return;
            }

            // Proceed with the delete operation
            DeleteRecordByID(tableName, recordID);
        }

        private void DisplayTableData(string tableName)
        {
            string connectionString = "Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string query = $"SELECT * FROM {tableName}";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        // Format the data as an HTML table
                        string htmlTable = "<table border='1' style='width:100%; text-align:left;'>";
                        htmlTable += "<tr>";
                        foreach (DataColumn column in dataTable.Columns)
                        {
                            htmlTable += $"<th>{column.ColumnName}</th>";
                        }
                        htmlTable += "</tr>";

                        foreach (DataRow row in dataTable.Rows)
                        {
                            htmlTable += "<tr>";
                            foreach (var cell in row.ItemArray)
                            {
                                htmlTable += $"<td>{cell}</td>";
                            }
                            htmlTable += "</tr>";
                        }
                        htmlTable += "</table>";

                        TableData.Text = htmlTable;
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error displaying table data: {ex.Message}');", true);
                }
            }
        }

        private Dictionary<string, string> GetTablePrimaryKeyMap()
        {
            return new Dictionary<string, string>
            {
                { "Parole_Release", "Parole_ID" },
                { "Criminal_Record", "Record_ID" },
                { "Officer", "Officer_ID" },
                { "Victim", "Victim_ID" },
                { "Criminal", "Criminal_ID" },
                { "Adress", "Address_ID" },
                { "Witnesss", "Witness_ID" },
                { "Crime", "Crime_ID" },
                { "Arrest", "Arrest_ID" },
                { "Law_Enforcement_Agency", "Agency_ID" },
                { "Case_File", "File_IDs" },
                { "Court", "Court_ID" },
                { "Judge", "Judge_ID" },
                { "Legal_Proceedings", "Proceedings_ID" },
                { "Crime_Victim ", "Crime_Victim_ID" },
                { "Crime_Witness", "Crime_Witness_ID" }
            };
        }

        private void DeleteRecordByID(string tableName, string recordID)
        {
            var tableMap = GetTablePrimaryKeyMap();

            // Validate if the selected table exists in the map
            if (!tableMap.ContainsKey(tableName))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid table selected.');", true);
                return;
            }

            string primaryKeyColumn = tableMap[tableName];
            string connectionString = "Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string query = $"DELETE FROM {tableName} WHERE {primaryKeyColumn} = @ID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(recordID));
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record deleted successfully.');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No record found with the given ID.');", true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error deleting record: {ex.Message}');", true);
                }
            }
        }
    }
}
