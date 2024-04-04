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
            <div class="col-lg-12">
                <div class="main-box clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Username</th>
                                <th>IC Number</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>User Type</th>
                                <th>User Status</th>
                                <th>Control</th>
                            </tr>
                        </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Mila Kunis</td>
                                <td>IC1234567</td>
                                <td>123456789</td>
                                <td>mila@kunis.com</td>
                                <td>******</td>
                                <td>
                                    <asp:DropDownList ID="ddlUserType1" runat="server">
                                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                        <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlUserStatus1" runat="server">
                                        <asp:ListItem Text="Valid" Value="Valid"></asp:ListItem>
                                        <asp:ListItem Text="Non-Valid" Value="Non-Valid"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:LinkButton ID="EditButton" runat="server" CssClass="table-link" OnClick="EditButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CssClass="table-link danger" OnClick="DeleteButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                             <tr>
                                <td>2</td>
                                <td>Mila Kunis</td>
                                <td>IC1234567</td>
                                <td>123456789</td>
                                <td>mila@kunis.com</td>
                                <td>******</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                        <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                        <asp:ListItem Text="Valid" Value="Valid"></asp:ListItem>
                                        <asp:ListItem Text="Non-Valid" Value="Non-Valid"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="table-link" OnClick="EditButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="table-link danger" OnClick="DeleteButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                               <tr>
                                <td>3</td>
                                <td>Mila Kunis</td>
                                <td>IC1234567</td>
                                <td>123456789</td>
                                <td>mila@kunis.com</td>
                                <td>******</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server">
                                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                        <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server">
                                        <asp:ListItem Text="Valid" Value="Valid"></asp:ListItem>
                                        <asp:ListItem Text="Non-Valid" Value="Non-Valid"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="table-link" OnClick="EditButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="table-link danger" OnClick="DeleteButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Mila Kunis</td>
                                <td>IC1234567</td>
                                <td>123456789</td>
                                <td>mila@kunis.com</td>
                                <td>******</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" runat="server">
                                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                        <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList6" runat="server">
                                        <asp:ListItem Text="Valid" Value="Valid"></asp:ListItem>
                                        <asp:ListItem Text="Non-Valid" Value="Non-Valid"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="table-link" OnClick="EditButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton6" runat="server" CssClass="table-link danger" OnClick="DeleteButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                               <tr>
                                <td>5</td>
                                <td>Mila Kunis</td>
                                <td>IC1234567</td>
                                <td>123456789</td>
                                <td>mila@kunis.com</td>
                                <td>******</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList7" runat="server">
                                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                        <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList8" runat="server">
                                        <asp:ListItem Text="Valid" Value="Valid"></asp:ListItem>
                                        <asp:ListItem Text="Non-Valid" Value="Non-Valid"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:LinkButton ID="LinkButton7" runat="server" CssClass="table-link" OnClick="EditButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton8" runat="server" CssClass="table-link danger" OnClick="DeleteButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                            <!-- Add more rows here -->

                            </tbody>
                        </table>
                        <!-- Edit form -->
                        <asp:Panel ID="editForm" runat="server" CssClass="edit-form" Visible="false">
                            <h2>Edit User Profile</h2>
                            <asp:TextBox ID="txtEditNo" runat="server" CssClass="form-control" Text="1"></asp:TextBox>
                            <asp:TextBox ID="txtEditUsername" runat="server" CssClass="form-control" Text="Mila Kunis"></asp:TextBox>
                            <asp:TextBox ID="txtEditICNumber" runat="server" CssClass="form-control" Text="IC1234567"></asp:TextBox>
                            <asp:TextBox ID="txtEditPhoneNumber" runat="server" CssClass="form-control" Text="123456789"></asp:TextBox>
                            <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control" Text="mila@kunis.com"></asp:TextBox>
                            <asp:TextBox ID="txtEditPassword" runat="server" CssClass="form-control" Text="******"></asp:TextBox>
                            <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="btnSaveChanges_Click" />
                        </asp:Panel>
                        <!-- End of edit form -->

                        <!-- Delete form -->
                            <asp:Panel ID="deleteForm" runat="server" CssClass="edit-form" Visible="false">
                                <h2>Delete User</h2>
                                <p>Are you sure you want to delete this user?</p>
                                <asp:Button ID="btnDeleteUser" runat="server" Text="Yes, Delete" CssClass="btn btn-danger" OnClick="btnDeleteUser_Click" />
                                <asp:Button ID="btnCancelDelete" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancelDelete_Click" />
                            </asp:Panel>
                        <!-- End of delete form -->
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

	