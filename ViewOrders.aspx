<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="GadgetHub.Client.ViewOrders" %>
<%@ Register TagPrefix="uc" TagName="Navbar" Src="~/Navbar.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order History - The Gadget Hub</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 95%;
            max-width: 1100px;
            margin: 70px auto;
            background: #ffffff;
            padding: 35px 40px;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #1e88e5;
            font-size: 30px;
            margin-bottom: 25px;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 15px;
            margin-top: 10px;
        }

        .grid th, .grid td {
            padding: 14px 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .grid th {
            background-color: #1e88e5;
            color: white;
            font-weight: 600;
        }

        .grid tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .grid tr:hover {
            background-color: #e3f2fd;
        }

        .error {
            text-align: center;
            color: #c62828;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Navbar runat="server" ID="Navbar" />

        <div class="container">
            <h2>📜 Order History</h2>

            <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false" />

            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
                    <asp:BoundField DataField="ProductId" HeaderText="Product ID" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price (LKR)"
                        DataFormatString="LKR {0:N2}" HtmlEncode="false" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price (LKR)"
                        DataFormatString="LKR {0:N2}" HtmlEncode="false" />
                    <asp:BoundField DataField="DistributorName" HeaderText="Distributor" />
                    <asp:BoundField DataField="EstimatedDeliveryDays" HeaderText="Delivery (Days)" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date"
                        DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                </Columns>
            </asp:GridView>

            <div class="footer">
                &copy; 2025 The Gadget Hub. All rights reserved.
            </div>
        </div>
    </form>
</body>
</html>
