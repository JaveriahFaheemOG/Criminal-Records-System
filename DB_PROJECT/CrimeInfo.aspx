<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrimeInfo.aspx.cs" Inherits="DB_PROJECT.CrimeInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Crime Record Entry</title>
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
            min-height: 100vh;
            overflow: auto;
        }

        .outer-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            width: 100%;
            min-height: 100vh;
            box-sizing: border-box;
        }

        .form-container {
            background-color: #2E2E2E;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            width: 500px;
        }

        h1 {
            color: #FF5733;
            text-align: center;
        }

        .form-row {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #444;
            color: #EDEDED;
        }

        .submit-button {
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

        .submit-button:hover {
            background-color: #E14E2D;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="outer-container">
            <div class="form-container">
                <h1>Add Crime Info</h1>

                <div class="form-row">
                    <label for="CrimeID">Crime ID</label>
                    <asp:TextBox ID="CrimeID" runat="server" TextMode="Number"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="Description">Description</label>
                    <asp:TextBox ID="Description" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="CrimeType">Crime Type</label>
                    <asp:TextBox ID="CrimeType" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="DateOfCrime">Date of Crime</label>
                    <asp:TextBox ID="DateOfCrime" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="LocationOfCrime">Location of Crime</label>
                    <asp:TextBox ID="LocationOfCrime" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="WeaponUsed">Weapon Used</label>
                    <asp:TextBox ID="WeaponUsed" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="TimeOfCrimeReported">Time of Crime Reported</label>
                    <asp:TextBox ID="TimeOfCrimeReported" runat="server" TextMode="Time"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="TargetedAt">Targeted At</label>
                    <asp:TextBox ID="TargetedAt" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="NoOfWitness">Number of Witnesses</label>
                    <asp:TextBox ID="NoOfWitness" runat="server" TextMode="Number"></asp:TextBox>
                </div>

                <asp:Button ID="SubmitButton" runat="server" CssClass="submit-button" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
