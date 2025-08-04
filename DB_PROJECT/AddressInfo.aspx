<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressInfo.aspx.cs" Inherits="DB_PROJECT.AddressInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Address Entry</title>
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

        input[type="text"], input[type="number"] {
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
                <h1>Add Address Record</h1>

                <div class="form-row">
                    <label for="AddressID">Address ID</label>
                    <asp:TextBox ID="AddressID" runat="server" TextMode="Number"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="Street">Street</label>
                    <asp:TextBox ID="Street" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="City">City</label>
                    <asp:TextBox ID="City" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="State">State</label>
                    <asp:TextBox ID="State" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="PostalCode">Postal Code</label>
                    <asp:TextBox ID="PostalCode" runat="server" TextMode="Number"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="Country">Country</label>
                    <asp:TextBox ID="Country" runat="server"></asp:TextBox>
                </div>

                <asp:Button ID="SubmitButton" runat="server" CssClass="submit-button" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
