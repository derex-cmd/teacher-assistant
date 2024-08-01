<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LDView.aspx.cs" Inherits="Project_Web.LDView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to LD Page</title>
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
    }

    .background {
        width: 430px;
        height: 520px;
        position: absolute;
        transform: translate(-50%, -50%);
        left: 50%;
        top: 50%;
    }

    form {
        height: 520px;
        width: 400px;
        background-color: rgba(255, 255, 255, 0.13);
        position: absolute;
        transform: translate(-50%, -50%);
        top: 50%;
        left: 50%;
        border-radius: 10px;
        backdrop-filter: blur(10px);
        border: 2px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
        padding: 50px 35px;
        text-align: center;
    }
    form h3 {
        color: white;
        font-size: 32px;
        font-weight: 500;
        line-height: 42px;
        margin-bottom: 30px;
    }
    label {
        display: block;
        margin-top: 20px;
        font-size: 16px;
        font-weight: 500;
        color: #ffffff;
    }
    .input {
        display: block;
        height: 50px;
        width: 100%;
        background-color: rgba(255, 255, 255, 0.07);
        border-radius: 3px;
        padding: 0 10px;
        margin-top: 8px;
        font-size: 14px;
        font-weight: 300;
        color: #e5e5e5;
    }
    .button {
        margin-top: 40px;
        width: 100%;
        background-color: #ffffff;
        color: #080710;
        padding: 15px 0;
        font-size: 18px;
        font-weight: 600;
        border-radius: 5px;
        cursor: pointer;
        border: none;
    }
    .button:hover {
        background-color: grey;
        color: #ffffff;
    }
    .message {
        color: #ff512f;
        margin-top: 20px;
        text-align: center;
        font-size: 14px;
    }
    .social {
        margin-top: 30px;
        display: flex;
        justify-content: center;
    }
    .social div {
        width: 150px;
        border-radius: 3px;
        padding: 5px 10px;
        background-color: rgba(255, 255, 255, 0.27);
        color: #eaf0fb;
        text-align: center;
        margin: 0 10px;
    }
    .social div:hover {
        background-color: rgba(255, 255, 255, 0.47);
    }
</style>
</head>
<body>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form id="form1" runat="server">
        <h3>Welcome to LD Page!</h3>

        <label for="textBox1">LD Name:</label>
        <asp:TextBox ID="textBox1" runat="server" CssClass="input" placeholder="LD Name"></asp:TextBox>

        <label for="textBox2">LD ID:</label>
        <asp:TextBox ID="textBox2" runat="server" CssClass="input" placeholder="LD ID"></asp:TextBox>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" OnClick="btnLogin_Click" />

        <!-- Label for displaying messages -->
        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

        <!-- Social media login options or other content can go here -->
    </form>
</body>
</html>
