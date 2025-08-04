<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DB_PROJECT.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up - Criminal Records</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1A1A1A; /* Dark background to fit a serious theme */
            color: #EDEDED; /* Light font for contrast */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #2E2E2E; /* Slightly lighter than the background for contrast */
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            padding: 30px 40px;
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #FF5733; /* Highlighted heading color */
            margin-bottom: 20px;
        }

        .form-row {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #444444;
            color: #EDEDED;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            outline: none;
            box-shadow: 0 0 5px #FF5733;
        }

        .submit-button {
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

        .submit-button:hover {
            background-color: #E14E2D;
        }

        .form-footer {
            margin-top: 20px;
            font-size: 14px;
        }

        .form-footer a {
            color: #FF5733;
            text-decoration: none;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Sign Up</h2>
            <p>Enter your credentials to create an account</p>

            <div class="form-row">
                <label for="TextBox1">Name</label>
                <asp:TextBox ID="TextBox1" runat="server"/>
            </div>

            <div class="form-row">
                <label for="TextBox2">Username</label>
                <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" CssClass="form-control" />
            </div>

            <div class="form-row">
                <label for="TextBox3">Password</label>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Width="100%" CssClass="form-control" />
            </div>

            <asp:Button ID="Button1" runat="server" CssClass="submit-button" OnClick="Button1_Click" Text="Sign Up" />

            <div class="form-footer">
                <p>Already have an account? <a href="login.aspx">Log in</a></p>
            </div>
        </div>
    </form>
</body>
</html>
