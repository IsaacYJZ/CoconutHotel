<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CoconutHotel.login" %>

<asp:Content ID="Content3" ContentPlaceHolderID="titleContent" runat="server">
    Login
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="login.css" rel="stylesheet" />
    <style>
        .successMessage {
            color: green;
            text-align: center;
            font-weight: bold;
            justify-content: center;
        }

        .error {
            color: red;
            text-align: center;
            font-weight: bold;
            justify-content: center;
        }
    </style>
    <form id="form1" runat="server" class="loginForm">
        <div class="login-container">
            <asp:Label ID="lblMessage" runat="server" CssClass="successMessage" Text=""></asp:Label>
            <asp:Label ID="emailFormatErrorMessage" runat="server" CssClass="error" Text=""></asp:Label>
            <asp:Label ID="emailNotFoundErrorMessage" runat="server" CssClass="error" Text=""></asp:Label>
            <asp:Label ID="passwordErrorMessage" runat="server" CssClass="error" Text=""></asp:Label>
            <h2>Login</h2>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required" CssClass="error" Text="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" CssClass="error" Text="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            <p>
                Don't have an account?
                <asp:HyperLink ID="registerLink" runat="server" NavigateUrl="register.aspx">Sign Up</asp:HyperLink>
                <asp:HyperLink ID="adminLogin" runat="server" NavigateUrl="AdminLogin.aspx">Sign Up</asp:HyperLink>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" HeaderText="The following error have encountered" />

    </form>
</asp:Content>
