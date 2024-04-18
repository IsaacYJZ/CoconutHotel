<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddRoomAdmin.aspx.cs" Inherits="CoconutHotel.AddRoomAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Add New Room Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="addRoomForm" runat="server" CssClass="edit-form">
        <h2>Add New Room</h2>
        <div class="form-group">
            <label for="txtRoomName">Room Name:</label>
            <asp:TextBox ID="txtRoomName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvRoomName" runat="server" ControlToValidate="txtRoomName" ErrorMessage="Room Name is required." ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="ddlRoomType">Room Type:</label>
            <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="form-control">
                <asp:ListItem Text="Standard" Value="Standard"></asp:ListItem>
                <asp:ListItem Text="Luxury" Value="Luxury"></asp:ListItem>
                <asp:ListItem Text="Junior" Value="Junior"></asp:ListItem>
                <asp:ListItem Text="Executive" Value="Executive"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvRoomType" runat="server" ControlToValidate="ddlRoomType" ErrorMessage="Room Type is required." ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="txtDescription">Description:</label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description is required." ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="txtPrice">Price:</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price is required." ForeColor="Red" />
            <asp:RegularExpressionValidator ID="revPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price must be a valid number." ValidationExpression="\d+(\.\d{1,2})?" ForeColor="Red" />
        </div>

        <div class="form-group">
            <label for="fileUpload">Room Image:</label>
            <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvFileUpload" runat="server" ControlToValidate="fileUpload" ErrorMessage="Room Image is required." ForeColor="Red" />
            <asp:RegularExpressionValidator ID="revFileUpload" runat="server" ControlToValidate="fileUpload" ErrorMessage="Only image files are allowed." ValidationExpression="^.*\.(jpg|jpeg|png|gif)$" ForeColor="Red" />
        </div>

        <asp:ValidationSummary ID="valSummary" runat="server" HeaderText="Validation Errors:" CssClass="alert alert-danger" ForeColor="Red" />
        
        <asp:Button ID="btnAddRoom" runat="server" Text="Add Room" CssClass="btn btn-primary" />
    </asp:Panel>
</asp:Content>

