<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserProfileAdmin.aspx.cs" Inherits="CoconutHotel.UserProfileAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    User Profile Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/UserProfileAdmin.css" rel="stylesheet" />

    <h1 class="text-left mt-5 mb-4">UserProfile</h1>


    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="userName">User Name:</label>
                                <asp:TextBox ID="userName" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="userType">User Type:</label>
                                <asp:DropDownList ID="userType" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="All" Value="" />
                                    <asp:ListItem Text="Admin" Value="Admin" />
                                    <asp:ListItem Text="Customer" Value="Customer" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="userStatus">User Status:</label>
                                <asp:DropDownList ID="userStatus" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="All" Value="" />
                                    <asp:ListItem Text="Valid" Value="Valid" />
                                    <asp:ListItem Text="Invalid" Value="Invalid" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="searchBox" CssClass="form-control form-control-lg" runat="server" Text="" />
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-lg btn-primary">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-10">
                <div class="form-group">
                    <div class="input-group-append ml-2">
                        <asp:Button ID="btnAddProfile" runat="server" Text="Add Profile" CssClass="btn btn-primary" OnClick="btnAddProfile_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- GridView to display user data -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-box clearfix">
                    <div class="table-responsive">
                        <asp:GridView ID="gridViewUsers" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="userID" HeaderText="User ID" />
                                <asp:BoundField DataField="userName" HeaderText="User Name" />
                                <asp:BoundField DataField="icNum" HeaderText="IC Number" />
                                <asp:BoundField DataField="phoneNum" HeaderText="Phone Number" />
                                <asp:BoundField DataField="email" HeaderText="Email" />
                                <asp:BoundField DataField="password" HeaderText="Password" />
                                <asp:BoundField DataField="userType" HeaderText="User Type" />
                                <asp:BoundField DataField="userStatus" HeaderText="User Status" />
                                <asp:TemplateField HeaderText="Control">
                                    <ItemTemplate>
                                        <div class="btn-group" role="group">
                                            <asp:LinkButton ID="EditButton" runat="server" CssClass="btn btn-primary" OnClick="EditButton_Click">
                                            <i class="fa fa-pencil"></i> Edit
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="DeleteButton" runat="server" CssClass="btn btn-danger" OnClick="DeleteButton_Click">
                                            <i class="fa fa-trash-o"></i> Delete
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Delete form -->
    <asp:Panel ID="deleteForm" runat="server" CssClass="edit-form" Visible="false">
        <h2>Delete User</h2>
        <p>Are you sure you want to delete this user?</p>
        <asp:Button ID="btnDeleteUser" runat="server" Text="Yes, Delete" CssClass="btn btn-danger" OnClick="btnDeleteUser_Click" />
        <asp:Button ID="btnCancelDelete" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancelDelete_Click" />
    </asp:Panel>
    <!-- End of delete form -->
</asp:Content>

