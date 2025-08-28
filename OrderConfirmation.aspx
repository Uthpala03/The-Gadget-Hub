<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirmation.aspx.cs" Inherits="GadgetHub.Client.OrderConfirmation" %>
<%@ Register TagPrefix="uc" TagName="Navbar" Src="~/Navbar.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Confirmation - The Gadget Hub</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            margin: 0;
            padding: 0;
        }

        .confirmation-container {
            max-width: 700px;
            margin: 80px auto;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.15);
            padding: 40px 30px;
            text-align: center;
        }

        h2 {
            color: #28a745;
            font-size: 26px;
            margin-bottom: 10px;
        }

        .summary-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
        }

        .summary-table th,
        .summary-table td {
            padding: 12px;
            border: 1px solid #ccc;
        }

        .summary-table th {
            background-color: #007bff;
            color: white;
            text-align: left;
            width: 40%;
        }

        .summary-table td {
            text-align: left;
        }

        .success-label {
            color: #28a745;
            font-size: 20px;
            font-weight: bold;
            margin-top: 10px;
        }

        .error-label {
            color: #dc3545;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            margin: 10px 8px;
            padding: 12px 25px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-success {
            background-color: #28a745;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .emoji {
            font-size: 36px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Navbar runat="server" ID="Navbar" />

        <div class="confirmation-container">
            <div class="emoji">🎉</div>
            <h2>Your Order Has Been Placed!</h2>

            <asp:Label ID="lblSuccess" runat="server" CssClass="success-label" Visible="false" />
            <asp:Label ID="lblError" runat="server" CssClass="error-label" Visible="false" />

            <table class="summary-table">
                <tr>
                    <th>Product</th>
                    <td><asp:Label ID="lblProduct" runat="server" /></td>
                </tr>
                <tr>
                    <th>Quantity</th>
                    <td><asp:Label ID="lblQuantity" runat="server" /></td>
                </tr>
                <tr>
                    <th>Distributor</th>
                    <td><asp:Label ID="lblDistributor" runat="server" /></td>
                </tr>
                <tr>
                    <th>Unit Price</th>
                    <td>LKR <asp:Label ID="lblUnitPrice" runat="server" /></td>
                </tr>
                <tr>
                    <th>Total</th>
                    <td>LKR <asp:Label ID="lblTotal" runat="server" /></td>
                </tr>
            </table>

            <asp:Button ID="btnContinueShopping" runat="server" Text="🛍️ Continue Shopping"
                CssClass="btn btn-success" PostBackUrl="~/Products.aspx" />

            <asp:Button ID="btnViewOrderHistory" runat="server" Text="📄 View Order History"
                CssClass="btn" OnClick="btnViewOrderHistory_Click" />
        </div>
    </form>
</body>
</html>
