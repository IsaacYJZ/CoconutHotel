<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="BookingAdmin.aspx.cs" Inherits="CoconutHotel.BookingAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Booking Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/BookingAdmin.css" rel="stylesheet" />

    <h1 class="text-left mt-5 mb-4">Booking</h1>


<section class="content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="userName">User Name:</label>
                                <asp:TextBox ID="userName" CssClass="form-control" runat="server" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="roomType">Room Type:</label>
                                <asp:DropDownList ID="roomType" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="All" Value="" />
                                    <asp:ListItem Text="Standard" Value="Standard" />
                                    <asp:ListItem Text="Luxury" Value="Luxury" />
                                    <asp:ListItem Text="Junior" Value="Junior" />
                                    <asp:ListItem Text="Executive" Value="Executive" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="paymentType">Payment Type:</label>
                                <asp:DropDownList ID="paymentType" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="All" Value="" />
                                    <asp:ListItem Text="Credit Card" Value="Credit Card" />
                                    <asp:ListItem Text="Cash" Value="Cash" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-12">
                                <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" CssClass="btn btn-primary btn-block" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


    <asp:Label ID="lblMessage" runat="server" Visible="false" Text="No bookings found." CssClass="text-danger"></asp:Label>


    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <asp:GridView ID="gridViewBookings" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false" DataKeyNames="bookingID">
                        <Columns>
                            <asp:BoundField DataField="bookingID" HeaderText="BookingID" />
                            <asp:BoundField DataField="userName" HeaderText="User Name" />
                            <asp:BoundField DataField="roomName" HeaderText="Room Type" />
                            <asp:BoundField DataField="bookingDate" HeaderText="Booking Date" />
                            <asp:BoundField DataField="checkInDate" HeaderText="Check In Date" />
                            <asp:BoundField DataField="checkOutDate" HeaderText="Check Out Date" />
                            <asp:TemplateField HeaderText="Occupancy">
                                <ItemTemplate>
                                    <%# GetOccupancy(Eval("numOfAdult"), Eval("numOfChild")) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="paymentMethod" HeaderText="Payment Type" />
                            <asp:BoundField DataField="bookingStatus" HeaderText="Booking Status" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
