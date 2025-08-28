<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="GadgetHub.Client.Products" %>
<%@ Register TagPrefix="uc" TagName="Navbar" Src="~/Navbar.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
        }

        .title {
            text-align: center;
            color: #1e88e5;
            font-size: 38px;
            margin-top: 40px;
            margin-bottom: 25px;
            font-weight: bold;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.08);
        }

        .product-grid {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            padding: 40px;
        }

        .product-card {
            width: 240px;
            background-color: #ffffff;
            border-radius: 12px;
            padding: 18px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 10px rgba(30, 136, 229, 0.08);
            border: 1px solid #e0e0e0;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 22px rgba(25, 118, 210, 0.15);
        }

        .product-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .product-card h3 {
            margin: 10px 0;
            font-size: 20px;
            color: #333;
        }

        .btn-cart {
            background: linear-gradient(to right, #1e88e5, #1976d2);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(30, 136, 229, 0.2);
        }

        .btn-cart:hover {
            background-color: #0d47a1;
            box-shadow: 0 6px 14px rgba(13, 71, 161, 0.3);
        }
    </style>
    <uc:Navbar runat="server" ID="Navbar" />

    <h2 class="title">🛍️ Featured Gadgets</h2>

    <div class="product-grid">
        <div class="product-card">
            <img src="images/Camera.jpg" alt="Camera" />
            <h3>Camera</h3>
            <asp:Button ID="btnCamera" runat="server" Text="Add to Cart" CssClass="btn-cart" OnClick="btnCamera_Click" />
        </div>
        <div class="product-card">
            <img src="images/JBL.jpg" alt="Bluetooth Speaker" />
            <h3>Bluetooth Speaker</h3>
            <asp:Button ID="btnSpeaker" runat="server" Text="Add to Cart" CssClass="btn-cart" OnClick="btnSpeaker_Click" />
        </div>
        <div class="product-card">
            <img src="images/Tab.jpg" alt="Tablet" />
            <h3>Tablet</h3>
            <asp:Button ID="btnTablet" runat="server" Text="Add to Cart" CssClass="btn-cart" OnClick="btnTablet_Click" />
        </div>
        <div class="product-card">
            <img src="images/Headset.png" alt="Headset" />
            <h3>Headset</h3>
            <asp:Button ID="btnHeadset" runat="server" Text="Add to Cart" CssClass="btn-cart" OnClick="btnHeadset_Click" />
        </div>
    </div>

</asp:Content>
