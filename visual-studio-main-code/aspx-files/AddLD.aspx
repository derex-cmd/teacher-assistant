<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLD.aspx.cs" Inherits="Project_Web.AddLD" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add LD</title>
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
            background-color: #f09819; /* Match the LD and TA button color */
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
        }
        .submit-button:hover {
            background-color: #ff512f; /* Match the LD and TA button hover color */
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
        <asp:TextBox ID="txtLDID" runat="server" CssClass="input-field" placeholder="LD ID"></asp:TextBox>
        <asp:TextBox ID="txtStudentID" runat="server" CssClass="input-field" placeholder="Student ID"></asp:TextBox>
        <asp:TextBox ID="txtRatePerHour" runat="server" CssClass="input-field" placeholder="Rate Per Hour"></asp:TextBox>
        <asp:TextBox ID="txtFacultyID" runat="server" CssClass="input-field" placeholder="Faculty ID"></asp:TextBox>
        <asp:Button ID="btnRegisterLD" runat="server" Text="Register LD" CssClass="submit-button" OnClick="btnRegisterLD_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
    </form>
</body>
</html>
