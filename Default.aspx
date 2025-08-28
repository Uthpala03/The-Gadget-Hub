<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GadgetHub.Client.Home" %>
<%@ Register TagPrefix="uc" TagName="Navbar" Src="~/Navbar.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Gadget Hub - Home</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
        }

        .header {
            background: linear-gradient(to right, #1e88e5, #1976d2);
            color: white;
            padding: 50px 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .header h1 {
            margin: 0;
            font-size: 42px;
        }

        .header p {
            font-size: 18px;
            margin-top: 10px;
            font-weight: 300;
        }

        .content {
            text-align: center;
            margin-top: 60px;
        }

        .btn {
            padding: 15px 35px;
            margin: 20px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            background-color: #2196f3;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(33, 150, 243, 0.3);
        }

        .btn:hover {
            background-color: #0d47a1;
            box-shadow: 0 6px 15px rgba(13, 71, 161, 0.4);
        }

        .icon {
            font-size: 40px;
            display: block;
            margin-bottom: 10px;
        }

        .footer {
            margin-top: 100px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Navbar runat="server" ID="Navbar" />

        <div class="header">
            <div class="icon">✨</div>
            <h1>Welcome to <strong>The Gadget Hub</strong></h1>
            <p>Your one-stop shop for the latest and greatest gadgets</p>
        </div>

        <div class="content">
            <asp:Button ID="btnPlaceOrder" runat="server" Text="🛒 Place an Order" CssClass="btn" OnClick="btnPlaceOrder_Click" />
            <asp:Button ID="btnViewOrders" runat="server" Text="📜 View Order History" CssClass="btn" OnClick="btnViewOrders_Click" />
        </div>

        <div class="footer">
            &copy; 2025 The Gadget Hub. All rights reserved.
        </div>
    </form>
</body>
</html>
