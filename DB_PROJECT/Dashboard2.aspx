<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard2.aspx.cs" Inherits="DB_PROJECT.Dashboard2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1A1A1A;
            color: #EDEDED;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .dashboard-container {
            background-color: #2E2E2E;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px 40px;
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #FF5733;
            margin-bottom: 10px;
        }

        p {
            margin-bottom: 20px;
            color: white;
        }

        .form-row {
            margin-bottom: 20px;
            text-align: left;
        }

        .dashboard-button {
            background-color: #FF5733;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .dashboard-button:hover {
            background-color: #E14E2D;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h1>Insert Dashboard</h1>
            <p>Choose an action to proceed</p>

             <div class="form-row">
              <asp:Button ID="Button9" runat="server" CssClass="dashboard-button" Text="Address Info" OnClick="Button9_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button1" runat="server" CssClass="dashboard-button" Text="Criminal Record" OnClick="Button1_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button8" runat="server" CssClass="dashboard-button" Text="Crime Info" OnClick="Button8_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button7" runat="server" CssClass="dashboard-button" Text="Case File" OnClick="Button7_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button2" runat="server" CssClass="dashboard-button" Text="Criminal Info" OnClick="Button2_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button3" runat="server" CssClass="dashboard-button" Text="Victim Info" OnClick="Button3_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button4" runat="server" CssClass="dashboard-button" Text="Witness Info" OnClick="Button4_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button5" runat="server" CssClass="dashboard-button" Text="Arrest Info" OnClick="Button5_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button6" runat="server" CssClass="dashboard-button" Text="Officer Info" OnClick="Button6_Click" />
            </div>


        </div>
    </form>
</body>
</html>
