<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTA.aspx.cs" Inherits="Project_Web.AddTA" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add TA</title>
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
        .form-container {
            width: 300px;
            margin: 0 auto;
            padding-top: 20px;
        }
        .input-field {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
            background-color: rgba(255, 255, 255, 0.07);
            border-radius: 3px;
            font-size: 14px;
            font-weight: 300;
            color: #e5e5e5;
            border: none;
        }
        .submit-button {
            width: 100%;
            padding: 10px;
            background-color: #f09819; 
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
        }
        .submit-button:hover {
            background-color: #ff512f;
        }
        .message {
            color: #ff512f;
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-container">
        <asp:TextBox ID="txtTAID" runat="server" CssClass="input-field" placeholder="TA ID"></asp:TextBox>
        <asp:TextBox ID="txtStudentID" runat="server" CssClass="input-field" placeholder="Student ID"></asp:TextBox>
        <asp:TextBox ID="txtRatePerStudent" runat="server" CssClass="input-field" placeholder="Rate Per Student"></asp:TextBox>
        <asp:TextBox ID="txtTotalStudents" runat="server" CssClass="input-field" placeholder="Total Students"></asp:TextBox>
        <asp:TextBox ID="txtFacultyID" runat="server" CssClass="input-field" placeholder="Faculty ID"></asp:TextBox>
        <asp:Button ID="btnRegisterTA" runat="server" Text="Register TA" CssClass="submit-button" OnClick="btnRegisterTA_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
    </form>
</body>
</html>
