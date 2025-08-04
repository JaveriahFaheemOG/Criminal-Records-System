<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CriminalRecordInfo.aspx.cs" Inherits="DB_PROJECT.CriminalRecordInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Criminal Record Entry</title>
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
                <h1>Add Criminal Record</h1>

                <div class="form-row">
                    <label for="RecordID">Record ID</label>
                    <asp:TextBox ID="RecordID" runat="server" TextMode="Number"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="Status">Status</label>
                    <asp:TextBox ID="Status" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="ParoleStatus">Parole Status</label>
                    <asp:TextBox ID="ParoleStatus" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="ProbationStatus">Probation Status</label>
                    <asp:TextBox ID="ProbationStatus" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="DateRecorded">Date Recorded</label>
                    <asp:TextBox ID="DateRecorded" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="DateListUpdated">Date List Updated</label>
                    <asp:TextBox ID="DateListUpdated" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="HabitualOffender">Habitual Offender</label>
                    <asp:TextBox ID="HabitualOffender" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="NoOfPreviousConvictions">Number of Previous Convictions</label>
                    <asp:TextBox ID="NoOfPreviousConvictions" runat="server" TextMode="Number"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="CourtID">Court ID</label>
                    <asp:TextBox ID="CourtID" runat="server" TextMode="Number"></asp:TextBox>
                </div>

                <asp:Button ID="SubmitButton" runat="server" CssClass="submit-button" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
