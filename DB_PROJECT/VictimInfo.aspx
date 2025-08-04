<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VictimInfo.aspx.cs" Inherits="DB_PROJECT.VictimInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Victim Record Entry</title>
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

        input[type="text"], input[type="date"], input[type="number"], input[type="tel"], textarea {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #444;
            color: #EDEDED;
        }

        textarea {
            resize: vertical;
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
                <h1>Add Victim Info</h1>

                <div class="form-row">
                    <label for="VictimID">Victim ID</label>
                    <asp:TextBox ID="VictimID" runat="server" TextMode="Number"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="FirstName">First Name</label>
                    <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="LastName">Last Name</label>
                    <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="CNIC">CNIC</label>
                    <asp:TextBox ID="CNIC" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="DateOfBirth">Date of Birth</label>
                    <asp:TextBox ID="DateOfBirth" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="RelationToCriminal">Relation to Criminal</label>
                    <asp:TextBox ID="RelationToCriminal" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="InquirySeverity">Inquiry Severity</label>
                    <asp:TextBox ID="InquirySeverity" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="VictimStatus">Victim Status</label>
                    <asp:TextBox ID="VictimStatus" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="EmotionalTrauma">Emotional Trauma</label>
                    <asp:TextBox ID="EmotionalTrauma" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="Contact">Contact</label>
                    <asp:TextBox ID="Contact" runat="server" TextMode="Number"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="StatementToPolice">Statement to Police</label>
                    <asp:TextBox ID="StatementToPolice" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="AddressID">Address ID</label>
                    <asp:TextBox ID="AddressID" runat="server" TextMode="Number" ></asp:TextBox>
                </div>

                <asp:Button ID="SubmitButton" runat="server" CssClass="submit-button" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
