<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="CoconutHotel.AdminHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Admin Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/UserProfileAdmin.css" rel="stylesheet" />
    <link href="css/AdminHomePage.css" rel="stylesheet" />

<div class="container">
    <h2>Dashboard</h2>
    <div class="row">
        <div class="col-md-4 col-xl-4">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Booking Received</h6>
                    <h2 class="text-right"><i class="fa fa-cart-plus f-left"></i><span id="bookingReceivedCount"  runat="server">0</span></h2>
                    <p class="m-b-0">Completed Bookings</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-xl-4">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Rooms Availability</h6>
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i><span id="roomsAvailabilityCount"  runat="server">0</span></h2>
                    <p class="m-b-0">Available Rooms</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-xl-4">
            <div class="card bg-c-pink order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Payment Received</h6>
                    <h2 class="text-right"><i class="fa fa-credit-card f-left"></i><span id="paymentReceivedCount"  runat="server">0</span></h2>
                    <p class="m-b-0">Completed payments</p>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- GridView to display user data -->
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h2>User Profile</h2>
                <div class="main-box clearfix">
                    <div class="table-responsive">
                        <asp:GridView ID="gridViewUsers" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="userID" HeaderText="User ID" />
                                <asp:BoundField DataField="userName" HeaderText="User Name" />
                                <asp:BoundField DataField="icNum" HeaderText="IC Number" />
                                <asp:BoundField DataField="phoneNum" HeaderText="Phone Number" />
                                <asp:BoundField DataField="email" HeaderText="Email" />
                                <asp:BoundField DataField="userType" HeaderText="User Type" />
                                <asp:TemplateField HeaderText="Control">
                                    <ItemTemplate>
                                        <div class="btn-group" role="group">
                                            <asp:LinkButton ID="ViewUserProfileButton" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                            </span>
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <h5>Top Selling Room Type</h5>
                <div id="topSellingRoomsContainer" runat="server">
                    <!-- Top-selling rooms will be dynamically added here -->
                </div>
            </div>
        </div>
    </div>
    <!-- GridView to display room data -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Room</h2>
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
                                <asp:BoundField DataField="AvailableRooms" HeaderText="Available Rooms" />
                                <asp:TemplateField HeaderText="Control">
                                    <ItemTemplate>
                                        <div class="btn-group" role="group">
                                            <asp:LinkButton ID="ViewRoomButton" runat="server" CssClass="table-link" OnClick="ViewRoomButton_Click">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                                </span>
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
</asp:Content>
