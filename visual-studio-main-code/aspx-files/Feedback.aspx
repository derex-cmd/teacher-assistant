<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Project_Web.Feedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Feedback for TA/LD</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #080710;
            font-family: 'Poppins', sans-serif;
            color: white;
            text-align: center;
            padding-top: 20px;
        }
        .container {
            max-width: 90%;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.13);
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .grid-view th, .grid-view td {
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 8px;
            text-align: left;
            color: white;
        }
        .grid-view th {
            background-color: rgba(72, 84, 96, 0.5);
        }
        .feedback-form {
            margin-top: 20px;
            text-align: center;
        }
        .feedback-form input, .feedback-form button {
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
        }
        .button {
            background-color: #f09819;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .button:hover {
            background-color: #ff512f;
        }
        .message {
            margin-top: 20px;
            color: #ff512f;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:GridView ID="GridViewTALD" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                    <asp:BoundField DataField="TotalTasks" HeaderText="Total Tasks" />
                    <asp:BoundField DataField="CompletedTasks" HeaderText="Completed Tasks" />
                    <asp:BoundField DataField="AttendanceCount" HeaderText="Attendance Count" />
                </Columns>
            </asp:GridView>

            <div class="feedback-form">
                <asp:TextBox ID="txtStudentID" runat="server" placeholder="Enter Student ID"></asp:TextBox>
                <asp:TextBox ID="txtFeedback" runat="server" placeholder="Enter feedback"></asp:TextBox>
                

                <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" CssClass="button" OnClick="btnSubmitFeedback_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>
    </form>
</body>
</html>
