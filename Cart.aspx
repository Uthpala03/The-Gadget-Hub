<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="GadgetHub.Client.Cart" %>
<%@ Register TagPrefix="uc" TagName="Navbar" Src="~/Navbar.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
        }

        .title {
            text-align: center;
            color: #1e88e5;
            font-size: 36px;
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .grid {
            width: 90%;
            margin: 0 auto 30px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .grid th {
            background-color: #1976d2;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
        }

        .grid td {
            padding: 10px;
            text-align: center;
            font-size: 15px;
            border: 1px solid #eee;
            background-color: #fff;
        }

        .grid tr:nth-child(even) {
            background-color: #f0f7ff;
        }

        .grid tr:hover {
            background-color: #e3f2fd;
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 14px;
            border: none;
            border-radius: 6px;
            margin: 2px;
            cursor: pointer;
            font-weight: 600;
        }

        .btn-primary {
            background-color: #2196f3;
            color: white;
        }

        .btn-primary:hover {
            background-color: #1565c0;
        }

        .btn-danger {
            background-color: #f44336;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c62828;
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
            display: block;
            margin: 20px auto;
            box-shadow: 0 4px 10px rgba(25, 118, 210, 0.3);
        }

        .btn-success:hover {
            background-color: #0d47a1;
            box-shadow: 0 6px 14px rgba(13, 71, 161, 0.4);
        }

        #lblQuoteGrandTotal {
            text-align: center;
            display: block;
            font-size: 20px;
            margin-top: 10px;
        }
    </style>
    <uc:Navbar runat="server" ID="Navbar" />

    <h2 class="title">🛒 Your Shopping Cart</h2>

    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="grid" OnRowCommand="gvCart_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <img src='<%# Eval("ImageUrl") %>' width="80" height="60" style="border-radius:6px;" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />

            <asp:TemplateField HeaderText="Update Qty">
                <ItemTemplate>
                    <asp:Button ID="btnIncrease" runat="server" CommandName="Increase" CommandArgument='<%# Eval("ProductId") %>' Text="+" CssClass="btn-sm btn-primary" />
                    <asp:Button ID="btnDecrease" runat="server" CommandName="Decrease" CommandArgument='<%# Eval("ProductId") %>' Text="-" CssClass="btn-sm btn-danger" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Compare">
                <ItemTemplate>
                    <asp:Button ID="btnCompare" runat="server" Text="Compare" CommandName="Compare" CommandArgument='<%# Eval("ProductId") %>' CssClass="btn-sm btn-success" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <h3 class="title">📊 Best Quotations from Distributors</h3>

    <asp:GridView ID="gvBestQuotes" runat="server" AutoGenerateColumns="False" CssClass="grid" Visible="false">
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="Product ID" />
            <asp:BoundField DataField="DistributorName" HeaderText="Best Distributor" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price (LKR)" DataFormatString="LKR {0:N2}" />
            <asp:BoundField DataField="TotalPrice" HeaderText="Total Price (LKR)" DataFormatString="LKR {0:N2}" />
            <asp:BoundField DataField="EstimatedDeliveryDays" HeaderText="Delivery (Days)" />
        </Columns>
    </asp:GridView>

    <asp:Label ID="lblQuoteGrandTotal" runat="server" Font-Bold="true" ForeColor="DarkGreen" />

    <asp:Button ID="btnFinalPlaceOrder" runat="server" Text="Place Order" CssClass="btn-success" OnClick="btnPlaceOrder_Click" />
</asp:Content>
