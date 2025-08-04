using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonQuery1_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT Criminal_ID, First_Name, Last_Name, a.Street, a.City, a.Country
                                            FROM Criminal
                                            JOIN Adress a ON Criminal.addresss_ID = a.Address_ID");
        }

        protected void ButtonQuery2_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT a.City, COUNT(cr.Crime_ID) AS Crime_Count
                                            FROM Crime cr
                                            JOIN Adress a ON cr.Location_of_Crime = a.City
                                            GROUP BY a.City
                                            ORDER BY Crime_Count DESC");
        }

        protected void ButtonQuery3_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT Victim_ID, First_Name, Last_Name, Emotional_Trauma
                                            FROM Victim
                                            WHERE Emotional_Trauma LIKE '%severe%'");
        }

        protected void ButtonQuery4_Click(object sender, EventArgs e)
        {
            string query = @"SELECT Crime_ID, Crime_Type, Description, No_of_Witness
                     FROM Crime
                     WHERE No_of_Witness > 3;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery5_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT TOP 5 Crime_ID, Crime_Type, No_of_Witness
                                            FROM Crime
                                            ORDER BY No_of_Witness DESC");
        }

        protected void ButtonQuery6_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT cr.Crime_Type, COUNT(ar.Arrest_ID) AS Arrest_Count
                                            FROM Crime cr
                                            JOIN Criminal c ON cr.Crime_ID = c.Crime_ID
                                            JOIN Arrest ar ON c.Criminal_ID = ar.Criminal_ID
                                            GROUP BY cr.Crime_Type");
        }

        protected void ButtonQuery7_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT w.Witness_ID, w.First_Name, w.Last_Name, a.States
                                            FROM Witnesss w
                                            JOIN Adress a ON w.addresss_ID = a.Address_ID
                                            WHERE a.States = 'Punjab'");
        }

        protected void ButtonQuery8_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT Criminal_ID, First_Name, Last_Name, Previous_Conviction
                                            FROM Criminal
                                            WHERE Previous_Conviction IS NOT NULL");
        }

        protected void ButtonQuery9_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT TOP 1 Crime_Type, COUNT(Crime_ID) AS Crime_Count
                                            FROM Crime
                                            GROUP BY Crime_Type
                                            ORDER BY Crime_Count DESC");
        }

        protected void ButtonQuery10_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT Crime_Type, Crime_ID
                                            FROM Crime
                                            WHERE No_of_Witness = 0");
        }

        protected void ButtonQuery11_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT Victim_ID, First_Name, Last_Name, FLOOR(DATEDIFF(DAY, Date_of_Birth, GETDATE()) / 365) AS Age
                                            FROM Victim");
        }

        protected void ButtonQuery12_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT c.Criminal_ID, c.First_Name, cr.Crime_Type, cf.File_IDs
                                            FROM Criminal c
                                            JOIN Crime cr ON c.Crime_ID = cr.Crime_ID
                                            JOIN Case_File cf ON c.File_IDs = cf.File_IDs");
        }

        protected void ButtonQuery13_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT Crime_ID, Crime_Type, Date_of_Crime
                                            FROM Crime
                                            WHERE Date_of_Crime > '2024-01-01'");
        }

        protected void ButtonQuery14_Click(object sender, EventArgs e)
        {
            ExecuteQueryAndBindToGridView(@"SELECT 
                                            (SELECT COUNT(*) FROM Victim) AS Total_Victims,
                                            (SELECT COUNT(*) FROM Witnesss) AS Total_Witnesses");
        }

        protected void ButtonQuery15_Click(object sender, EventArgs e)
        {
            string query = @"SELECT ar.Arrest_ID, cr.Crime_Type, lg.Judgement, cr.Description
                     FROM Arrest ar
                     JOIN Criminal c ON ar.Criminal_ID = c.Criminal_ID
                     JOIN Crime cr ON c.Crime_ID = cr.Crime_ID
                     JOIN Criminal_Record cre ON cre.Record_ID = c.Record_ID
                     JOIN Court cor ON cor.Court_ID = cre.Court_ID
                     JOIN Legal_Proceedings lg ON lg.Court_ID = cor.Court_ID;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery16_Click(object sender, EventArgs e)
        {
            string query = @"SELECT cr.Crime_Type, COUNT(c.Criminal_ID) AS Criminal_Count
                     FROM Crime cr
                     JOIN Criminal c ON cr.Crime_ID = c.Crime_ID
                     GROUP BY cr.Crime_Type;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery17_Click(object sender, EventArgs e)
        {
            string query = @"SELECT w.Witness_ID, w.First_Name, w.Emotional_Trauma, a.Street, a.City, a.Country
                     FROM Witnesss w
                     JOIN Adress a ON w.addresss_ID = a.Address_ID
                     WHERE w.Emotional_Trauma IS NOT NULL;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery18_Click(object sender, EventArgs e)
        {
            string query = @"SELECT TOP 1 Victim_ID, First_Name, Last_Name, Date_of_Birth
                     FROM Victim
                     ORDER BY Date_of_Birth DESC;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery19_Click(object sender, EventArgs e)
        {
            string query = @"SELECT Criminal_ID, CONCAT(c.First_Name, ' ', c.Last_Name) AS Criminal_Name, CONCAT(v.First_Name, ' ', v.Last_Name) AS Victim_Name
                     FROM Criminal c
                     JOIN Crime_Victim cv ON c.Crime_ID = cv.Crime_ID
                     JOIN Victim v ON v.Victim_ID = cv.Victim_ID;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery20_Click(object sender, EventArgs e)
        {
            string query = @"SELECT YEAR(Date_of_Crime) AS Crime_Year, COUNT(Crime_ID) AS Total_Crimes
                     FROM Crime
                     GROUP BY YEAR(Date_of_Crime)
                     ORDER BY Crime_Year DESC;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery21_Click(object sender, EventArgs e)
        {
            string query = @"SELECT c.Crime_ID, c.Description, c.Crime_Type, c.Weapon_Used
                     FROM Crime c
                     WHERE CONVERT(VARCHAR(MAX), c.Weapon_Used) = 'Explosives';";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery22_Click(object sender, EventArgs e)
        {
            string query = @"SELECT cr.Crime_ID, cr.Crime_Type, cr.Description, 
                            c.Criminal_ID, c.First_Name AS Criminal_Name, 
                            v.Victim_ID, v.First_Name AS Victim_Name, 
                            w.Witness_ID, w.First_Name AS Witness_Name,
                            a.City, a.Street
                     FROM Crime cr
                     JOIN Criminal c ON cr.Crime_ID = c.Crime_ID
                     JOIN Crime_Victim cv ON cv.Crime_ID = c.Crime_ID
                     JOIN Victim v ON v.Victim_ID = cv.Victim_ID
                     JOIN Crime_Witness cw ON cw.Crime_ID = c.Crime_ID
                     JOIN Witnesss w ON w.Witness_ID = cw.Witness_ID
                     JOIN Adress a ON a.Address_ID = c.addresss_ID;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery23_Click(object sender, EventArgs e)
        {
            string query = @"SELECT ar.Arrest_ID, 
                            cr.Crime_ID, cr.Crime_Type, cr.Description, 
                            c.Criminal_ID, c.First_Name AS Criminal_Name, 
                            cf.File_IDs
                     FROM Arrest ar
                     JOIN Criminal c ON c.Criminal_ID = ar.Criminal_ID
                     JOIN Crime cr ON cr.Crime_ID = c.Crime_ID
                     JOIN Case_File cf ON cf.File_IDs = c.File_IDs;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery24_Click(object sender, EventArgs e)
        {
            string query = @"SELECT a.City, cr.Crime_Type, COUNT(c.Criminal_ID) AS Criminal_Count
                     FROM Criminal c
                     JOIN Adress a ON c.addresss_ID = a.Address_ID
                     JOIN Crime cr ON c.Crime_ID = cr.Crime_ID
                     JOIN Criminal_Record r ON c.Record_ID = r.Record_ID
                     GROUP BY a.City, cr.Crime_Type
                     ORDER BY Criminal_Count DESC;";
            ExecuteQueryAndBindToGridView(query);
        }

        protected void ButtonQuery25_Click(object sender, EventArgs e)
        {
            string query = @"SELECT w.Witness_ID, w.First_Name AS Witness_Name, 
                            c.Criminal_ID, c.First_Name AS Criminal_Name, 
                            cr.Crime_Type, a.City AS Witness_City
                     FROM Witnesss w
                     JOIN Crime_Witness cw ON cw.Witness_ID = w.Witness_ID
                     JOIN Crime cr ON cr.Crime_ID = cw.Crime_ID
                     JOIN Criminal c ON c.Crime_ID = cr.Crime_ID
                     JOIN Adress a ON a.Address_ID = c.addresss_ID
                     WHERE c.Criminal_ID IN (151, 152);";
            ExecuteQueryAndBindToGridView(query);
        }

        private void ExecuteQueryAndBindToGridView(string query)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Criminal_Record;Integrated Security=True;"))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewResults.DataSource = dt;
                GridViewResults.DataBind();
            }
        }
    }
}
