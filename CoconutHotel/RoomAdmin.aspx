<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RoomAdmin.aspx.cs" Inherits="CoconutHotel.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/RoomAdmin.css" rel="stylesheet" />

    <h1>Room</h1>

        <section class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="resultType">Result Type:</label>
                                    <asp:ListBox ID="resultType" CssClass="form-control select2" runat="server" SelectionMode="Multiple">
                                        <asp:ListItem>Text only</asp:ListItem>
                                        <asp:ListItem>Images</asp:ListItem>
                                        <asp:ListItem>Video</asp:ListItem>
                                    </asp:ListBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="sortOrder">Sort Order:</label>
                                    <asp:DropDownList ID="sortOrder" CssClass="form-control select2" runat="server">
                                        <asp:ListItem Selected="True">ASC</asp:ListItem>
                                        <asp:ListItem>DESC</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="orderBy">Order By:</label>
                                    <asp:DropDownList ID="orderBy" CssClass="form-control select2" runat="server">
                                        <asp:ListItem Selected="True">Title</asp:ListItem>
                                        <asp:ListItem>Date</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="searchBox" CssClass="form-control form-control-lg" runat="server" Text="Lorem ipsum" />
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
                                    <th><span>Room</span></th>
                                    <th><span>Created</span></th>
                                    <th class="text-center"><span>Status</span></th>
                                    <th><span>Email</span></th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" / alt="">                           
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
                                        <img src="roomImg/rooms-2.jpg" / alt="">
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
                                        <img src="roomImg/rooms-6.jpg" / alt="">
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
                                        <img src="roomImg/rooms-7.jpg" / alt="">
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
                                        <img src="roomImg/rooms-5.jpg" / alt="">
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
