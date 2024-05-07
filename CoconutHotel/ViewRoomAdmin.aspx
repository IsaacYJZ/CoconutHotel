<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewRoomAdmin.aspx.cs" Inherits="CoconutHotel.ViewRoomAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Room Detail Admin
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
                                <label for="roomId">Room ID:</label>
                                <asp:TextBox ID="roomId" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="occupancy">Occupancy:</label>
                                <asp:TextBox ID="occupancy" CssClass="form-control" runat="server" TextMode="Number" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>&nbsp;</label>      
                                <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" CssClass="btn btn-primary btn-block" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
                                        <asp:Image ID="roomImg" runat="server" ImageUrl='<%# Eval("roomImg") %>' Height="100" Width="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="roomID" HeaderText="Room ID" />
                                <asp:BoundField DataField="occupancy" HeaderText="Occupancy" />
                                <asp:BoundField DataField="roomPrice" HeaderText="Price" />
                                <asp:BoundField DataField="roomStatus" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
