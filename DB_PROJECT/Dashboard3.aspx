<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard3.aspx.cs" Inherits="DB_PROJECT.DeleteRecord" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Record</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1A1A1A;
            color: #EDEDED;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            background-color: #2E2E2E;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            width: 400px;
        }

        h1 {
            color: #FF5733;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-row {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        select, input[type="text"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #444;
            color: #EDEDED;
        }

        .button {
            background-color: #FF5733;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            margin-top: 10px;
        }

        .button:hover {
            background-color: #E14E2D;
        }

        .table-data {
            margin-top: 20px;
            width: 90%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h1>Delete Record</h1>

            <div class="form-row">
                <label for="TableName">Select Table</label>
                <asp:DropDownList ID="TableName" runat="server">
                    <asp:ListItem Value="Adress" Text="Adress"></asp:ListItem>
                    <asp:ListItem Value="Arrest" Text="Arrest"></asp:ListItem>
                    <asp:ListItem Value="Crime" Text="Crime"></asp:ListItem>
                    <asp:ListItem Value="Criminal" Text="Criminal"></asp:ListItem>
                    <asp:ListItem Value="Criminal_Record" Text="Criminal_Record"></asp:ListItem>
                    <asp:ListItem Value="Case_File" Text="Case_File"></asp:ListItem>
                    <asp:ListItem Value="Court" Text="Court"></asp:ListItem>
                    <asp:ListItem Value="Crime_Victim" Text="Crime_Victim"></asp:ListItem>
                    <asp:ListItem Value="Crime_Witness" Text="Crime_Witness"></asp:ListItem>
                    <asp:ListItem Value="Judge" Text="Judge"></asp:ListItem>
                    <asp:ListItem Value="Law_Enforcement_Agency" Text="Law_Enforcement_Agency"></asp:ListItem>
                   <asp:ListItem Value="Legal_Proceedings" Text="Legal_Proceedings"></asp:ListItem>
                   <asp:ListItem Value="Officer" Text="Officer"></asp:ListItem>
                   <asp:ListItem Value="Parole_Release" Text="Parole_Release"></asp:ListItem>
                   <asp:ListItem Value="Victim" Text="Victim"></asp:ListItem>
                   <asp:ListItem Value="Witnesss" Text="Witness"></asp:ListItem>
                </asp:DropDownList>

            </div>

            <asp:Button ID="ViewTableButton" runat="server" CssClass="button" Text="View Table" OnClick="ViewTableButton_Click" />

            <div class="form-row">
                <label for="RecordID">Enter ID to Delete</label>
                <asp:TextBox ID="RecordID" runat="server" TextMode="Number"></asp:TextBox>
            </div>

            <asp:Button ID="DeleteButton" runat="server" CssClass="button" Text="Delete Record" OnClick="DeleteButton_Click" />
        </div>

        <div class="table-data">
            <asp:Literal ID="TableData" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
