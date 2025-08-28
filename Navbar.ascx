<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="GadgetHub.Client.Navbar" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .navbar-dark-custom {
        background: linear-gradient(to right, #1c1c1e, #2c2c2e); 
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
    }

    .navbar-brand {
        font-weight: 600;
        font-size: 22px;
        color: #ffffff !important;
    }

    .nav-link {
        color: #d1d1d1 !important;
        font-weight: 500;
        padding: 8px 14px;
        transition: all 0.3s ease;
    }

    .nav-link:hover {
        color: #ffffff !important;
        background-color: rgba(255, 255, 255, 0.1);
        border-radius: 6px;
    }

    .navbar-toggler {
        border-color: rgba(255, 255, 255, 0.4);
    }

    .navbar-toggler-icon {
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23ffffff' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(255,255,255,0.8)' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark navbar-dark-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="Default.aspx">🚀 GadgetHub</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Default.aspx">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Products.aspx">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Cart.aspx">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Checkout.aspx">Checkout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="OrderConfirmation.aspx">Confirmation</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ViewOrders.aspx">Order History</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
