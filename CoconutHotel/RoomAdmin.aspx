<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RoomAdmin.aspx.cs" Inherits="CoconutHotel.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Room Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/RoomAdmin.css" rel="stylesheet" />

    <h1 class="text-left mt-5 mb-4">Room</h1>

    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="roomName">Room Name:</label>
                                <asp:TextBox ID="roomName" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="roomType">Room Type:</label>
                                <asp:DropDownList ID="roomType" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="All" Value="" />
                                    <asp:ListItem Text="Standard" Value="Standard" />
                                    <asp:ListItem Text="Luxury" Value="Luxury" />
                                    <asp:ListItem Text="Junior" Value="Junior" />
                                    <asp:ListItem Text="Executive" Value="Executive" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="priceRange">Price Range:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="minPrice" CssClass="form-control" runat="server" placeholder="Min Price" />
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">-</span>
                                    </div>
                                    <asp:TextBox ID="maxPrice" CssClass="form-control" runat="server" placeholder="Max Price" />
                                </div>
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
                        <asp:Button ID="btnAddRoom" runat="server" Text="Add Room" CssClass="btn btn-primary" OnClick="btnAddRoom_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-box clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr>
                                    <th><span>No.</span></th>
                                    <th><span>Image</span></th>
                                    <th><span>Room Name</span></th>
                                    <th><span>Room Type</span></th>
                                    <th><span>Description</span></th>
                                    <th><span>Price</span></th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" alt="">
                                    </td>
                                    <td>Room 1</td>
                                    <td>Standard</td>
                                    <td>Description of Room 1</td>
                                    <td>$100</td>
                                    <td style="width: 20%;">
                                        <asp:LinkButton ID="EditButton1" runat="server" CssClass="table-link" OnClick="EditButton_Click">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="DeleteButton1" runat="server" CssClass="table-link danger" OnClick="DeleteButton_Click">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>２</td>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" alt="">
                                    </td>
                                    <td>Room 1</td>
                                    <td>Standard</td>
                                    <td>Description of Room 1</td>
                                    <td>$100</td>
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
                                    <td>3</td>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" alt="">
                                    </td>
                                    <td>Room 1</td>
                                    <td>Standard</td>
                                    <td>Description of Room 1</td>
                                    <td>$100</td>
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
                                    <td>4</td>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" alt="">
                                    </td>
                                    <td>Room 1</td>
                                    <td>Standard</td>
                                    <td>Description of Room 1</td>
                                    <td>$100</td>
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
                                    <td>5</td>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" alt="">
                                    </td>
                                    <td>Room 1</td>
                                    <td>Standard</td>
                                    <td>Description of Room 1</td>
                                    <td>$100</td>
                                    <td style="width: 20%;">
                                        <asp:LinkButton ID="LinkButton7" runat="server" CssClass="table-link" OnClick="EditButton_Click" CommandArgument='<%# Eval("RoomID") %>'>
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
                                <!-- Add more rows as needed -->
                            </tbody>
                        </table>

                        <!-- Delete form -->
                        <asp:Panel ID="deleteForm" runat="server" CssClass="edit-form" Visible="false">
                            <h2>Delete Room</h2>
                            <p>Are you sure you want to delete this Room?</p>
                            <asp:Button ID="btnDeleteRoom" runat="server" Text="Yes, Delete" CssClass="btn btn-danger" OnClick="btnDeleteRoom_Click" />
                            <asp:Button ID="btnCancelDelete" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancelRoom_Click" />
                        </asp:Panel>
                        <!-- End of delete form -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
