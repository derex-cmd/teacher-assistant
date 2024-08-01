<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentView.aspx.cs" Inherits="Project_Web.PaymentView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Processing</title>
</head>
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

    h3 {
        /* left align */
        text-align: left;
        margin-left: 5%;
    }

</style>

<!-- javasecript code to toggle radio button -->
<script type="text/javascript">
    function toggleRadio(rb) {
        if (rb.previous) {
            rb.checked = false;
        }
        rb.previous = rb.checked;

        // clear message
        document.getElementById("lblMessage").innerHTML = "";
    }
</script>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- gridview for TAs -->
            <h3>Teaching Assistants</h3>
            <asp:GridView ID="GridViewTA" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="TAID" HeaderText="TA ID" />
                    <asp:BoundField DataField="TAName" HeaderText="TA Name" />
                    <asp:BoundField DataField="PaymentDue" HeaderText="Payment Due" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <!-- toggle and untoggle -->
                            <asp:RadioButton ID="rbSelectTA" runat="server" GroupName="Selection" OnClick="toggleRadio(this)"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- gridvieww for LDs -->
            <h3>Lab Demonstrators</h3>
            <asp:GridView ID="GridViewLD" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="LDID" HeaderText="LD ID" />
                    <asp:BoundField DataField="LDName" HeaderText="LD Name" />
                    <asp:BoundField DataField="LabsAttended" HeaderText="Labs Attended" />
                    <asp:BoundField DataField="PaymentDue" HeaderText="Payment Due" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:RadioButton ID="rbSelectLD" runat="server" GroupName="Selection" OnClick="toggleRadio(this)"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblTotalPayment" runat="server" ForeColor="White"></asp:Label>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>

            <div class="button-container">
            <asp:Button ID="btnCalculateTotal" runat="server" Text="Calculate Total Payment" OnClick="btnCalculateTotal_Click" CssClass="action-button" />
            <asp:Button ID="btnFinalizePayment" runat="server" Text="Finalize Payment" OnClick="btnFinalizePayment_Click" CssClass="action-button" />
            </div>


        </div>
    </form>
</body>
</html>
