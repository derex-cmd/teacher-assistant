<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Project_Web.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LinkX: Teaching Assistant and Lab Demonstrator Companion</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>

        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap');

       header {
            background-color: #12111f;
            color: #fff;
            text-align: center;
            padding: 10px;
       }

        header h1 {
            font-family: "Open Sans", sans-serif;
            font-size: 36px;
            margin-top: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            color: #fff;
            display: inline-block; 
            /*padding: 10px 20px;*/ 
            /*border: 2px solid #fff;*/
            /*border-radius: 5px;*/ 

        }

        html, body { 
            padding: 0; 
            margin: 0; 
            height: 100%; 
            background-color: #080710;
        }

        /*.page-header {
            background-color: #080710;*/ /* Header background color */
            /*color: #fff;*/ /* Text color */
            /*text-align: center;
            padding: 10px;
            border-bottom: 1px solid #fff;*/ /* Header border */
        /*}*/

        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 65vh; /* view port height used so that the buttons get aligned at the center of the page*/
        }

        .glassIco {
            box-sizing: border-box;
            transition: 200ms;
            width: 200px;
            height: 200px;
            color: #fff;
            font-size: 50px;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(2px);
            border: 1px solid rgba(0, 0, 0, 0.2); 
            box-shadow: 0 20px 30px rgba(0, 0, 0, 0.1);
            text-decoration: none;
            margin: 20px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        .glassIco:before {
            content: "";
            position: absolute;
            display: block;
            width: 50%;
            height: 100%;
            background: rgba(255, 255, 255, 0.5);
            filter: blur(0px);
            transition: 550ms;
            transform: skewX(45deg) translateX(200%); 
        }

        .glassIco:hover {
            transform: translateY(-40px);
            /*color: black;
            border: 4px solid #000;*/
        }

        .glassIco:hover:before {
            transform: skewX(45deg) translateX(-200%); 
        }

        .glassIco > * {
            opacity: 0.8;
        }

        .glassIco i {

        }

        .glassIco span {
            color: #ffff;
            font-size: 25px;
            margin-top: 10px;
            font-family: "Open Sans", sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>LinkX: Teaching Assistant and Lab Demonstrator Companion</h1>
        </header>
        <div class="button-container">
            <asp:LinkButton ID="AdminButton" CssClass="glassIco" runat="server" OnClick="AdminButton_Click">
                <i class="fas fa-user-shield"></i><span>Admin</span>
            </asp:LinkButton>
            <asp:LinkButton ID="FacultyButton" CssClass="glassIco" runat="server" OnClick="FacultyButton_Click">
                <i class="fas fa-user-tie"></i><span>Faculty</span>
            </asp:LinkButton>
            <asp:LinkButton ID="TAButton" CssClass="glassIco" runat="server" OnClick="TAButton_Click">
                <i class="fas fa-user-graduate"></i><span>TA</span>
            </asp:LinkButton>
            <asp:LinkButton ID="LDButton" CssClass="glassIco" runat="server" OnClick="LDButton_Click">
                <i class="fas fa-chalkboard-teacher"></i><span>LD</span>
            </asp:LinkButton>
        </div>
    </form>
</body>
</html>
