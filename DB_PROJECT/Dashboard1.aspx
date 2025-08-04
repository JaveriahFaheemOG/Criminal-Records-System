<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard1.aspx.cs" Inherits="DB_PROJECT.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Query Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1A1A1A;
            color: #EDEDED;
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            width: 80%;
            margin: auto;
            margin-top: 50px;
        }

        .query-button {
            background-color: #FF5733;
            border: none;
            color: white;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .query-button:hover {
            background-color: #E14E2D;
        }

        .result-container {
            background-color: #2E2E2E;
            border-radius: 8px;
            padding: 20px;
            margin-top: 20px;
        }

        h1 {
            text-align: center;
            color: #FF5733;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h1>View Dashboard</h1>
            
            <asp:Button ID="ButtonQuery1" runat="server" CssClass="query-button" Text="Query 1: List Criminals and Addresses" OnClick="ButtonQuery1_Click" />
            <asp:Button ID="ButtonQuery2" runat="server" CssClass="query-button" Text="Query 2: Crimes per City" OnClick="ButtonQuery2_Click" />
            <asp:Button ID="ButtonQuery3" runat="server" CssClass="query-button" Text="Query 3: Severe Trauma Victims" OnClick="ButtonQuery3_Click" />
            <asp:Button ID="ButtonQuery4" runat="server" CssClass="query-button" Text="Query 4: Crimes with > 3 Witnesses" OnClick="ButtonQuery4_Click" />
            <asp:Button ID="ButtonQuery5" runat="server" CssClass="query-button" Text="Query 5: Top 5 Crimes by Witnesses" OnClick="ButtonQuery5_Click" />
            <asp:Button ID="ButtonQuery6" runat="server" CssClass="query-button" Text="Query 6: Arrests per Crime Type" OnClick="ButtonQuery6_Click" />
            <asp:Button ID="ButtonQuery7" runat="server" CssClass="query-button" Text="Query 7: Witnesses in Punjab" OnClick="ButtonQuery7_Click" />
            <asp:Button ID="ButtonQuery8" runat="server" CssClass="query-button" Text="Query 8: Criminals with Previous Convictions" OnClick="ButtonQuery8_Click" />
            <asp:Button ID="ButtonQuery9" runat="server" CssClass="query-button" Text="Query 9: Most Common Crime" OnClick="ButtonQuery9_Click" />
            <asp:Button ID="ButtonQuery10" runat="server" CssClass="query-button" Text="Query 10: Crimes with No Witnesses" OnClick="ButtonQuery10_Click" />
            <asp:Button ID="ButtonQuery11" runat="server" CssClass="query-button" Text="Query 11: Victims' Ages Today" OnClick="ButtonQuery11_Click" />
            <asp:Button ID="ButtonQuery12" runat="server" CssClass="query-button" Text="Query 12: Criminal Records with Case Files" OnClick="ButtonQuery12_Click" />
            <asp:Button ID="ButtonQuery13" runat="server" CssClass="query-button" Text="Query 13: Crimes After 2024-01-01" OnClick="ButtonQuery13_Click" />
            <asp:Button ID="ButtonQuery14" runat="server" CssClass="query-button" Text="Query 14: Total Victims & Witnesses" OnClick="ButtonQuery14_Click" />
            <asp:Button ID="ButtonQuery15" runat="server" CssClass="query-button" Text="Query 15: Arrests with Crimes and Judgments" OnClick="ButtonQuery15_Click" />
            <asp:Button ID="ButtonQuery16" runat="server" CssClass="query-button" Text="Query 16: Criminals per Crime Type" OnClick="ButtonQuery16_Click" />
            <asp:Button ID="ButtonQuery17" runat="server" CssClass="query-button" Text="Query 17: Witnesses Reporting Trauma" OnClick="ButtonQuery17_Click" />
            <asp:Button ID="ButtonQuery18" runat="server" CssClass="query-button" Text="Query 18: Youngest Victim Details" OnClick="ButtonQuery18_Click" />
            <asp:Button ID="ButtonQuery19" runat="server" CssClass="query-button" Text="Query 19: Criminals and Victims" OnClick="ButtonQuery19_Click" />
            <asp:Button ID="ButtonQuery20" runat="server" CssClass="query-button" Text="Query 20: Crimes per Year" OnClick="ButtonQuery20_Click" />
            <asp:Button ID="ButtonQuery21" runat="server" CssClass="query-button" Text="Query 21: Crimes with Specific Weapon" OnClick="ButtonQuery21_Click" />
            <asp:Button ID="ButtonQuery22" runat="server" CssClass="query-button" Text="Query 22: Detailed Crime Information" OnClick="ButtonQuery22_Click" />
            <asp:Button ID="ButtonQuery23" runat="server" CssClass="query-button" Text="Query 23: Arrests with Case Files" OnClick="ButtonQuery23_Click" />
            <asp:Button ID="ButtonQuery24" runat="server" CssClass="query-button" Text="Query 24: Criminals per City and Crime" OnClick="ButtonQuery24_Click" />
            <asp:Button ID="ButtonQuery25" runat="server" CssClass="query-button" Text="Query 25: Witnesses for Criminals" OnClick="ButtonQuery25_Click" />

  
            
            <div class="result-container">
                <asp:GridView ID="GridViewResults" runat="server" CssClass="table"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
