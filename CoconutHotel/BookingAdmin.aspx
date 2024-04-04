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
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th class="text-center" scope="col">No.</th>
                                <th scope="col">BookingID</th>
                                <th scope="col">User Name</th>
                                <th scope="col">Room Type</th>
                                <th scope="col">Booking Date and Time</th>
                                <th scope="col">Check In Date</th>
                                <th scope="col">Check Out Date</th>
                                <th scope="col">Number of Adult</th>
                                <th scope="col">Number of Child</th>
                                <th scope="col">Payment Type</th>
                                <th scope="col">Booking Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>123456</td>
                                <td>John Doe</td>
                                <td>Standard</td>
                                <td>2024-04-04 09:00 AM</td>
                                <td>2024-04-05</td>
                                <td>2024-04-07</td>
                                <td>2</td>
                                <td>1</td>
                                <td>Credit Card</td>
                                <td>
                                    <asp:DropDownList ID="bookingStatus1" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Complete" Value="Complete" />
                                        <asp:ListItem Text="Incomplete" Value="Incomplete" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td>2</td>
                                <td>123456</td>
                                <td>John Doe</td>
                                <td>Standard</td>
                                <td>2024-04-04 09:00 AM</td>
                                <td>2024-04-05</td>
                                <td>2024-04-07</td>
                                <td>2</td>
                                <td>1</td>
                                <td>Credit Card</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Complete" Value="Complete" />
                                        <asp:ListItem Text="Incomplete" Value="Incomplete" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td>3</td>
                                <td>123456</td>
                                <td>John Doe</td>
                                <td>Standard</td>
                                <td>2024-04-04 09:00 AM</td>
                                <td>2024-04-05</td>
                                <td>2024-04-07</td>
                                <td>2</td>
                                <td>1</td>
                                <td>Credit Card</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Complete" Value="Complete" />
                                        <asp:ListItem Text="Incomplete" Value="Incomplete" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td>4</td>
                                <td>123456</td>
                                <td>John Doe</td>
                                <td>Standard</td>
                                <td>2024-04-04 09:00 AM</td>
                                <td>2024-04-05</td>
                                <td>2024-04-07</td>
                                <td>2</td>
                                <td>1</td>
                                <td>Credit Card</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Complete" Value="Complete" />
                                        <asp:ListItem Text="Incomplete" Value="Incomplete" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td>5</td>
                                <td>123456</td>
                                <td>John Doe</td>
                                <td>Standard</td>
                                <td>2024-04-04 09:00 AM</td>
                                <td>2024-04-05</td>
                                <td>2024-04-07</td>
                                <td>2</td>
                                <td>1</td>
                                <td>Credit Card</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Complete" Value="Complete" />
                                        <asp:ListItem Text="Incomplete" Value="Incomplete" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <!-- Add more rows here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
