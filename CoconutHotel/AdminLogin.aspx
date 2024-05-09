<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="CoconutHotel.AdminLogin" %>

    <link href="login.css" rel="stylesheet" />
    <style>
        .successMessage {
            color: green;
            text-align: center;
            font-weight: bold;
            justify-content:center;
        }

        .error {
            color: red;
            text-align: center;
            font-weight: bold;
            justify-content:center;
        }
    </style>
    <form id="form1" runat="server" class="loginForm">
        <div class="login-container">
            <asp:Label ID="lblMessage" runat="server" CssClass="successMessage" Text=""></asp:Label>
            <asp:Label ID="emailFormatErrorMessage" runat="server" CssClass="error" Text=""></asp:Label>
            <asp:Label ID="emailNotFoundErrorMessage" runat="server" CssClass="error" Text=""></asp:Label>
            <asp:Label ID="passwordErrorMessage" runat="server" CssClass="error" Text=""></asp:Label>
            <h2>Admin Login</h2>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required" CssClass="error" Text="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" CssClass="error" Text="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" HeaderText="The following error have encountered" />

    </form>
</asp:Content>