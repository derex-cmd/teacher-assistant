<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTasksforTA.aspx.cs" Inherits="Project_Web.ViewTasksforTA" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
    <title>TA Tasks Progress</title>
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
        .chart-container {
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            display: inline-block;
        }
        .chart-area {
            background-color: transparent;
            border: none;
        }
        .info-text {
            margin: 10px 0;
        }
        .legend {
            text-align: left;
            margin-top: 20px;
            font-size: 14px;
        }
        .legend span {
            display: inline-block;
            width: 12px;
            height: 12px;
            margin-right: 5px;
        }
        .button-container {
            text-align: right;
            margin-top: 10px;
            margin-bottom: 20px;
        }
        .view-button {
            padding: 10px 20px;
            background-color: #f09819;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .view-button:hover {
            background-color: #ff512f;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="info-text">
                <asp:Label ID="lblTotalTasks" runat="server" Text="Total Tasks: "></asp:Label><br />
                <asp:Label ID="lblCompletedTasks" runat="server" Text="Completed Tasks: "></asp:Label><br />
            </div>

            <div class="chart-container">
                <asp:Chart ID="TaskProgressChart" runat="server" Width="450" Height="300">
                    <Titles>
                        <asp:Title Text="Task Progress" 
                                   ShadowColor="32, 0, 0, 0" 
                                   Font="Poppins, 14pt, style=Bold" 
                                   ForeColor="White" 
                                   Alignment="TopCenter" />
                    </Titles>
                    <Series>
                        <asp:Series Name="ProgressSeries" ChartType="Pie" BorderColor="Transparent">
                            
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" BorderColor="Transparent" BackColor="Transparent" Area3DStyle-Enable3D="true" />
                    </ChartAreas>
                    
                </asp:Chart>
            </div>

            <div class="button-container">
                <asp:Button ID="btnViewTasks" runat="server" Text="View Tasks" CssClass="view-button" OnClick="btnViewTasks_Click" />
            </div>
        </div>
    </form>
</body>
</html>
