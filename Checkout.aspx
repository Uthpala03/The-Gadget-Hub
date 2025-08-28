<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="GadgetHub.Client.Checkout" %>
<%@ Register TagPrefix="uc" TagName="Navbar" Src="~/Navbar.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout - GadgetHub</title>
    <style>
        body {
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background-color: #ffffff;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #1e88e5;
            font-size: 32px;
            margin-bottom: 25px;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .grid th, .grid td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .grid th {
            background-color: #1976d2;
            color: white;
        }

        .grid tr.highlight {
            background-color: #d1eaff !important;
            font-weight: bold;
        }

        .message-label {
            display: block;
            font-size: 18px;
            color: #0d47a1;
            margin-top: 15px;
        }

        .btn-success {
            background: linear-gradient(to right, #1e88e5, #1976d2);
            color: white;
            padding: 14px 28px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 20px;
            box-shadow: 0 4px 10px rgba(25, 118, 210, 0.3);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Navbar runat="server" ID="Navbar" />

        <div class="container">
            <h2>📦 Checkout & Compare Quotations</h2>

            <asp:GridView ID="gvQuotations" runat="server" AutoGenerateColumns="False" CssClass="grid" OnRowDataBound="gvQuotations_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="DistributorName" HeaderText="Distributor" />
                    <asp:BoundField DataField="Price" HeaderText="Unit Price (LKR)" DataFormatString="LKR {0:N2}" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total (LKR)" DataFormatString="LKR {0:N2}" />
                    <asp:BoundField DataField="InStockText" HeaderText="Availability" />
                    <asp:BoundField DataField="EstimatedDeliveryDays" HeaderText="Delivery Days" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblMessage" runat="server" CssClass="message-label" />

            <asp:Button ID="btnCheckout" runat="server" Text="✅ Confirm Order" CssClass="btn-success" OnClick="btnCheckout_Click" Visible="false" />
        </div>
    </form>
</body>
</html>
