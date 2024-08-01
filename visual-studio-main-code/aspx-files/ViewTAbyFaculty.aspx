<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTAbyFaculty.aspx.cs" Inherits="Project_Web.ViewTAbyFaculty" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Assistants List</title>
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
        .grid-view th:last-child,
        .grid-view td:last-child {
            text-align: right;
        }
        .task-form {
            margin-top: 20px;
            text-align: center;
        }
        .task-form input, .task-form button {
            margin: 10px 0;
        }
        .action-button {
            padding: 10px 15px;
            background-color: #f09819;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .action-button:hover {
            background-color: #ff512f;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
           <asp:GridView ID="GridViewTA" runat="server" CssClass="grid-view" AutoGenerateColumns="False" DataKeyNames="TAID">
                <Columns>
                    <asp:BoundField DataField="TAID" HeaderText="TAID" />
                    <asp:BoundField DataField="CourseName" HeaderText="Course" />
                    <asp:BoundField DataField="TaskID" HeaderText="Task ID" />
                    <asp:BoundField DataField="Details" HeaderText="Task Description" />
                    <asp:BoundField DataField="Scene" HeaderText="Task Status" />
                    <asp:TemplateField HeaderText="Select">
            <ItemTemplate>
                <asp:RadioButton ID="RadioButtonSelect" runat="server" GroupName="TARadio" AutoPostBack="true" OnCheckedChanged="RadioButtonSelect_CheckedChanged" />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblSelectedTA" runat="server" Text="Selected TA: None"></asp:Label>
            <div class="task-form">
                <asp:TextBox ID="txtTaskDetails" runat="server" TextMode="MultiLine" Rows="5" Columns="50" Placeholder="Enter task details..."></asp:TextBox>
                <asp:Button ID="btnAssignTask" runat="server" Text="Assign Task" OnClick="btnAssignTask_Click" CssClass="action-button" />
            </div>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
