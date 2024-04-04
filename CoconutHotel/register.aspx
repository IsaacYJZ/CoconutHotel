<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CoconutHotel.register" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContent" runat="server">
    Register
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="register.css" rel="stylesheet" />
    <form id="form1" runat="server" class="registerForm">
        <div class="register-container">
            <h2>Register</h2>
            <div class="form-group">
                <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName">Name:</asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblIc" runat="server" AssociatedControlID="txtIc">IC Number:</asp:Label>
                <asp:TextBox ID="txtIc" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email:</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPhoneNumber" runat="server" AssociatedControlID="txtPhoneNumber">Phone Number:</asp:Label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword">Confirm Password:</asp:Label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
        </div>
    </form>
</asp:Content>
