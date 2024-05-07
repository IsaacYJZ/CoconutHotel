<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RoomAdmin.aspx.cs" Inherits="CoconutHotel.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Room Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/RoomAdmin.css" rel="stylesheet" />

    <h1 class="text-left mt-5 mb-4">Room</h1>

    <!-- GridView to display room data -->
    <div class="container">
        <div class="row justify-content-center">
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
                                <asp:BoundField DataField="roomPrice" HeaderText="Price" />
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
