<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserProfileAdmin.aspx.cs" Inherits="CoconutHotel.UserProfileAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="Css/UserProfileAdmin.css" rel="stylesheet" />

<h1>UserProfile</h1>

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-box clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr>
                                    <th><span>User</span></th>
                                    <th><span>Created</span></th>
                                    <th class="text-center"><span>Status</span></th>
                                    <th><span>Email</span></th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
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
                                    <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
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
                                    <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
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
                                    <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
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
                                    <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
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
                            </tbody>
                        </table>
                        <!-- Edit form -->
                            <asp:Panel ID="editForm" runat="server" CssClass="edit-form" Visible="false">
                                <h2>Edit User Profile</h2>
                                <asp:TextBox ID="txtEditUsername" runat="server" CssClass="form-control" Text="Mila Kunis"></asp:TextBox>
                                <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control" Text="mila@kunis.com"></asp:TextBox>
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

	