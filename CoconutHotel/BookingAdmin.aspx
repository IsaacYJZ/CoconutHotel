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
                                <label for="bookingDateTime">Booking Date and Time:</label>
                                <asp:TextBox ID="bookingDateTime" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="checkInDate">Check In Date:</label>
                                <asp:TextBox ID="checkInDate" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="checkOutDate">Check Out Date:</label>
                                <asp:TextBox ID="checkOutDate" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="paymentType">Payment Type:</label>
                                <asp:DropDownList ID="paymentType" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="All" Value="" />
                                    <asp:ListItem Text="Credit Card" Value="Credit Card" />
                                    <asp:ListItem Text="Cash" Value="Cash" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="numberOfPax">Number of Pax:</label>
                        <asp:TextBox ID="numberOfPax" CssClass="form-control" runat="server" />
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

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <asp:GridView ID="gridViewBookings" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="bookingID" HeaderText="BookingID" />
                            <asp:BoundField DataField="UserName" HeaderText="User Name" />
                            <asp:BoundField DataField="roomName" HeaderText="Room Type" />
                            <asp:BoundField DataField="bookingDate" HeaderText="Booking Date" />
                            <asp:BoundField DataField="checkInDate" HeaderText="Check In Date" />
                            <asp:BoundField DataField="checkOutDate" HeaderText="Check Out Date" />
                            <asp:BoundField DataField="numOfAdult" HeaderText="Number of Adult" />
                            <asp:BoundField DataField="numOfChild" HeaderText="Number of Child" />
                            <asp:BoundField DataField="paymentMethod" HeaderText="Payment Type" />
                            <asp:TemplateField HeaderText="Booking Status">
                                <ItemTemplate>
                                    <asp:DropDownList ID="bookingStatus" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Complete" Value="Complete" />
                                        <asp:ListItem Text="Incomplete" Value="Incomplete" />
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
