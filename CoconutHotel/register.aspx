﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CoconutHotel.register" %>

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
            <div style="display: flex; justify-content: space-between;">
                <div style="width: 48%;">
                    <div class="form-group">
                        <asp:Label ID="lbluserName" runat="server" AssociatedControlID="txtuserName">Username:</asp:Label>
                        <asp:TextBox ID="txtuserName" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserName is required" CssClass="error" Text="*" ControlToValidate="txtuserName"></asp:RequiredFieldValidator>
                        <div id="usernameTakenMessage" class="error" style="display: none;"></div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblIc" runat="server" AssociatedControlID="txtIc">IC Number:</asp:Label>
                        <asp:TextBox ID="txtIc" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Identity Card Number is required" CssClass="error" Text="*" ControlToValidate="txtIc"></asp:RequiredFieldValidator>
                        <div id="icNumberTakenMessage" class="error" style="display: none;"></div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email:</asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required" CssClass="error" Text="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        <div id="emailTakenMessage" class="error" style="display: none;"></div>
                    </div>
                </div>
                <div style="width: 48%;">
                    <div class="form-group">
                        <asp:Label ID="lblPhoneNumber" runat="server" AssociatedControlID="txtPhoneNumber">Phone Number:</asp:Label>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone Number is required" CssClass="error" Text="*" ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>
                        <div id="phoneNumberTakenMessage" class="error" style="display: none;"></div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password is required" CssClass="error" Text="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must be exactly six character" CssClass="error" Text="*" ValidationExpression="^.{6,}$" ControlToValidate="txtPassword"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword">Confirm Password:</asp:Label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Confirm Password is required" CssClass="error" Text="*" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match" CssClass="error"></asp:CompareValidator>
                    </div>
                </div>
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
        </div>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" HeaderText="The following error have encountered" />

    </form>
</asp:Content>
