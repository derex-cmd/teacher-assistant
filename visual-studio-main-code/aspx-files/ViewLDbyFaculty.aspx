<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewLDbyFaculty.aspx.cs" Inherits="Project_Web.ViewLDbyFaculty" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab Demonstrators List</title>
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
            background-color: #f09819; /* Match the button color from the second page */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 5px;
        }
        .action-button:hover {
            background-color: #ff512f; /* Match the button hover color from the second page */
        }
        /* Additional style for the textbox and label */
        #lblSelectedLD,
        #txtDate {
            color: white;
            margin: 5px;
        }
        #txtDate {
            background-color: rgba(255, 255, 255, 0.13);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 5px;
            padding: 5px;
            color: white;
        }
        #btnMarkAttendance {
            padding: 10px 15px;
            background-color: #f09819; /* Match the button color from the second page */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 5px;
        }
        #btnMarkAttendance:hover {
            background-color: #ff512f; /* Match the button hover color from the second page */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:GridView ID="GridViewLD" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="LDID" HeaderText="LD ID" />
        <asp:BoundField DataField="CourseName" HeaderText="Course" />
        <asp:BoundField DataField="AttendanceCount" HeaderText="Attendance" />
        <asp:TemplateField HeaderText="">
            <ItemTemplate>
                <asp:RadioButton ID="RadioButtonSelect" runat="server" GroupName="LDSelection" OnCheckedChanged="RadioButtonSelect_CheckedChanged" AutoPostBack="true" />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<script type="text/javascript">
    function uncheckOtherRadios(sender) {
        var gv = document.getElementById('<%= GridViewLD.ClientID %>');
        var radioButtons = gv.getElementsByTagName("input");
        for (var i = 0; i < radioButtons.length; i++) {
            if (radioButtons[i].type == "radio" && radioButtons[i] != sender) {
                radioButtons[i].checked = false;
            }
        }
    }
</script>



            <div>
                <asp:Label ID="lblSelectedLD" runat="server" Text="Selected LD: None"></asp:Label>
                <asp:TextBox ID="txtDate" runat="server" placeholder="Date (yyyy-mm-dd)"></asp:TextBox>
                <asp:Button ID="btnMarkAttendance" runat="server" Text="Mark Attendance" OnClick="btnMarkAttendance_Click" CssClass="action-button" />
            </div>
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
