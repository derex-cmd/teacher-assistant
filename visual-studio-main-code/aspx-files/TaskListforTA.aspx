<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskListforTA.aspx.cs" Inherits="Project_Web.TaskListforTA" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TA Task List</title>
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
        .grid-view th,
        .grid-view td {
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 8px;
            text-align: left;
            color: white;
        }
        .task-input {
            margin-top: 20px;
        }
        .task-button {
            padding: 10px 15px;
            background-color: #f09819;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .task-button:hover {
            background-color: #ff512f;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:GridView ID="GridViewTasks" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="TaskID" HeaderText="Task ID" />
                    <asp:BoundField DataField="Details" HeaderText="Description" />
                    <asp:BoundField DataField="Scene" HeaderText="Status" />
                </Columns>
            </asp:GridView>

            <div class="task-input">
                <asp:TextBox ID="txtTaskID" runat="server" CssClass="task-text" Placeholder="Enter Task ID"></asp:TextBox>
                <asp:Button ID="btnMarkComplete" runat="server" Text="Mark as Complete" CssClass="task-button" OnClick="btnMarkComplete_Click" />
            </div>

            <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green" CssClass="info-text"></asp:Label>
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="info-text"></asp:Label>
        </div>
    </form>
</body>
</html>
