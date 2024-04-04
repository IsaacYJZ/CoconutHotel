<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CoconutHotel.login" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContent" runat="server">
    Login
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="login.css" rel="stylesheet" />
    <form id="form1" runat="server" class="loginForm">
        <div class="login-container">
            <h2>Login</h2>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            <p>
                Don't have an account?
                <asp:HyperLink ID="registerLink" runat="server" NavigateUrl="register.aspx">Sign Up</asp:HyperLink>
        </div>
    </form>
</asp:Content>
