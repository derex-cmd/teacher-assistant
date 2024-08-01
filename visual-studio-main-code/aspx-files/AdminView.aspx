<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminView.aspx.cs" Inherits="Project_Web.AdminView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
        *,
        *:before,
        *:after {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        body {
            background-color: #080710;
            font-family: 'Poppins', sans-serif;
            text-align: center;
            padding-top: 50px;
        }
        .dashboard-container {
            width: 400px;
            background-color: rgba(255, 255, 255, 0.13);
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
            padding: 20px;
            margin: auto;
        }
        .view-button {
            padding: 15px 30px;
            background-color: rgba(255, 255, 255, 0.07);
            color: #e5e5e5;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin: 10px;
            transition: background-color 0.3s;
        }
        .view-button:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <form id="form1" runat="server">
            <asp:Button ID="btnViewList" runat="server" Text="View TA and Lab Demonstrators" CssClass="view-button" OnClick="btnViewList_Click" /><br />
            <asp:Button ID="btnViewTA" runat="server" Text="View TA" CssClass="view-button" OnClick="btnViewTA_Click" /><br />
            <asp:Button ID="btnViewLD" runat="server" Text="View LD" CssClass="view-button" OnClick="btnViewLD_Click" /><br />
            <asp:Button ID="btnProcessPayments" runat="server" Text="Process Payments" CssClass="view-button" OnClick="btnProcessPayments_Click" /><br />
            <asp:Button ID="btnMostFacultyTasks" runat="server" Text="View Faculty With Most Tasks" CssClass="view-button" OnClick="btnMostFacultyTasks_Click" />
        </form>
    </div>
</body>
</html>
