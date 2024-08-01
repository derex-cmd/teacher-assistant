<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminViewList.aspx.cs" Inherits="Project_Web.AdminViewList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TA and Lab Demonstrators List</title>
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
        <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="FacultyName" HeaderText="Faculty Name" />
                <asp:BoundField DataField="FacultyEmail" HeaderText="Faculty Email" />
                <asp:BoundField DataField="COURSENAME" HeaderText="Course Name" />
                <asp:BoundField DataField="TAID" HeaderText="TAID" />
                <asp:BoundField DataField="LDID" HeaderText="LDID" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
