<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUserProfile.aspx.cs" Inherits="CoconutHotel.EditUserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit User</title>
    <link href="EditUserProfile.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="editUserProfile">
        <div class="container">
            <h2>Edit Profile</h2>
            <asp:Label ID="lblID" runat="server" />

            <div class="form-group">
                <label for="name">Username:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="icNum">IC Number:</label>
                <asp:TextBox ID="txtICNum" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
            </div>

            <div class="edit">
                <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" CssClass="btn-save" />
            </div>
        </div>
    </form>
</body>
</html>
