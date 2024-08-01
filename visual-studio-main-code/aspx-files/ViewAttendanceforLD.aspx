<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAttendanceforLD.aspx.cs" Inherits="Project_Web.ViewAttendanceforLD" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LD Attendance View</title>
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
            background-color: rgba(255, 255, 255, 0.13);
            border-radius: 10px;
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
        <div class="container">
            <asp:GridView ID="GridViewAttendance" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="FacultyName" HeaderText="Faculty Name" />
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                    <asp:BoundField DataField="AttendanceDate" HeaderText="Attendance Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="AttendanceStatus" HeaderText="Attendance Status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
