<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="choice.aspx.cs" Inherits="DB_PROJECT.choice" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Choice</title>
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

        .choice-container {
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

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .choice-button {
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

        .choice-button:hover {
            background-color: #E14E2D;
        }

        .form-footer {
            margin-top: 20px;
            font-size: 14px;
        }

        .form-footer a {
            color: white;
            text-decoration: none;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="choice-container">
            <h1>Choose Your Action</h1>
            <p>Select an option below</p>

            <div class="form-row">
                <asp:Button ID="Button1" runat="server" CssClass="choice-button" Text="View" OnClick="Button1_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button2" runat="server" CssClass="choice-button" Text="Insert" OnClick="Button2_Click" />
            </div>

            <div class="form-row">
                <asp:Button ID="Button3" runat="server" CssClass="choice-button" Text="Delete" OnClick="Button3_Click" />
            </div>

           
        </div>
    </form>
</body>
</html>
