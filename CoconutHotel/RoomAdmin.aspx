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
    <!-- GridView to display room data -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-box clearfix">
                    <div class="table-responsive">
                        <asp:GridView ID="gridViewRooms" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="roomImage" runat="server" ImageUrl='<%# Eval("roomImage") %>' Height="100" Width="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="roomName" HeaderText="Room Name" />
                                <asp:BoundField DataField="roomDesc" HeaderText="Description" />
                                <asp:BoundField DataField="roomType" HeaderText="Room Type" />
                                <asp:BoundField DataField="roomPrice" HeaderText="Price" />
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
        <h2>Delete Room</h2>
        <p>Are you sure you want to delete this Room?</p>
        <asp:Button ID="btnDeleteRoom" runat="server" Text="Yes, Delete" CssClass="btn btn-danger" OnClick="btnDeleteRoom_Click" />
        <asp:Button ID="btnCancelDelete" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancelRoom_Click" />
    </asp:Panel>
    <!-- End of delete form -->
</asp:Content>
