<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostFacultyTask.aspx.cs" Inherits="Project_Web.MostFacultyTask" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty with Most Tasks</title>
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
        .grid-view {
            margin: 20px auto;
            width: 90%;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.13);
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <asp:GridView ID="GridViewMostTasks" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="FacultyID" HeaderText="Faculty ID" />
                <asp:BoundField DataField="FacultyName" HeaderText="Faculty Name" />
                <asp:BoundField DataField="TaskCount" HeaderText="Number of Tasks Assigned" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>