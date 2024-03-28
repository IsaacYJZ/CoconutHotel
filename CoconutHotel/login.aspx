<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CoconutHotel.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="login.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <div class="login-container">
            <h2>Login</h2>
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            <p>Don't have an account? <a href="#">Sign up</a></p>
        </div>
    </form>
</body>
</html>
