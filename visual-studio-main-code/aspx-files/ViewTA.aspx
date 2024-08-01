<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTA.aspx.cs" Inherits="Project_Web.ViewTA" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teaching Assistants List</title>
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
        .button-container {
            text-align: right;
            margin-right: 5%;
            padding-top: 10px;
        }
        .action-button {
            padding: 10px 15px;
            background-color: #f09819;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 5px;
        }
        .action-button:hover {
            background-color: #ff512f; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
        <asp:BoundField DataField="StudentEmail" HeaderText="Student Email" />
        <asp:BoundField DataField="TAID" HeaderText="TA ID" />
        <asp:BoundField DataField="FacultyName" HeaderText="Faculty Name" />
        <asp:BoundField DataField="COURSENAME" HeaderText="Course Name" />
        <asp:TemplateField HeaderText="Payment">
            <ItemTemplate>
                <asp:Label ID="lblPayment" runat="server" Text='<%# CalculatePayment(Eval("RatePerStudent"), Eval("TotalStudents")) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        <div class="button-container">
            <asp:Button ID="btnAddStudent" runat="server" Text="Add Student" CssClass="action-button" OnClick="btnAddStudent_Click" />
            <asp:Button ID="btnDeleteStudent" runat="server" Text="Delete Student" CssClass="action-button" OnClick="btnDeleteStudent_Click" />
        </div>
    </form>
</body>
</html>
