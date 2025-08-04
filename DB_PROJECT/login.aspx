<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DB_PROJECT.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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

        .login-container {
            background-color: #2E2E2E;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
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

        .login-button {
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

        .login-button:hover {
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
        <div class="login-container">
            <h1>Login</h1>
            <p>Enter your credentials to log in</p>
            
            <div class="form-row">
                <label for="TextBox1">Username</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
            </div>

            <div class="form-row">
                <label for="TextBox2">Password</label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control" />
            </div>

            <asp:Button ID="Button1" runat="server" CssClass="login-button" Text="Login" OnClick="Button1_Click" />

            <div class="form-footer">
                <p>Don't have an account? <a href="WebForm1.aspx">Sign Up</a></p>
            </div>
        </div>
    </form>
</body>
</html>
