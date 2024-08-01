<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteLD.aspx.cs" Inherits="Project_Web.DeleteLD" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete LD</title>
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
        <asp:TextBox ID="txtDeleteLDID" runat="server" CssClass="input-field" placeholder="LD ID to Delete"></asp:TextBox>
        <asp:Button ID="btnDeleteLD" runat="server" Text="Delete LD" CssClass="submit-button" OnClick="btnDeleteLD_Click" />
        <asp:Label ID="lblDeleteMessage" runat="server" CssClass="message"></asp:Label>
    </form>
</body>
</html>
