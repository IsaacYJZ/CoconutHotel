<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditProfileAdmin.aspx.cs" Inherits="CoconutHotel.EditProfileAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Edit Profile Admin
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="editUserProfileForm" runat="server" CssClass="edit-form">
        <h2>Edit User Profile</h2>
        <div class="form-group">
            <label for="txtUsername">Username:</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control form-control-sm" />
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="txtICNumber">IC Number:</label>
            <asp:TextBox ID="txtICNumber" runat="server" CssClass="form-control form-control-sm" />
            <asp:RequiredFieldValidator ID="rfvICNumber" runat="server" ControlToValidate="txtICNumber" ErrorMessage="IC Number is required." ForeColor="Red" />
            <asp:RegularExpressionValidator ID="revICNumber" runat="server" ControlToValidate="txtICNumber" ErrorMessage="Invalid IC Number format. Please use XXXXXX-XX-XXXX." ValidationExpression="\d{6}-\d{2}-\d{4}" ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="txtPhoneNumber">Phone Number:</label>
            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control form-control-sm" />
            <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required." ForeColor="Red" />
            <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Invalid Phone Number format. Please use XXX-XXXXXXXX." ValidationExpression="\d{3}-\d{8,11}" ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-sm" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ForeColor="Red" />
            <asp:CustomValidator ID="cvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character." OnServerValidate="cvPassword_ServerValidate" ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="ddlUserType">User Type:</label>
            <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control form-control-sm">
                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvUserType" runat="server" ControlToValidate="ddlUserType" ErrorMessage="User Type is required." ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="ddlUserType">User Status:</label>
            <asp:DropDownList ID="ddlUserStatus" runat="server" CssClass="form-control form-control-sm">
                <asp:ListItem Text="Valid" Value="Valid"></asp:ListItem>
                <asp:ListItem Text="Invalid" Value="Invalid"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvUserStatus" runat="server" ControlToValidate="ddlUserStatus" ErrorMessage="User Status is required." ForeColor="Red" />
        </div>

        <asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile" CssClass="btn btn-primary btn-sm" />
    </asp:Panel>
</asp:Content>
