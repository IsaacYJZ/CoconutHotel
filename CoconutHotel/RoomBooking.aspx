<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="RoomBooking.aspx.cs" Inherits="CoconutHotel.RoomBooking" %>

<asp:Content ID="Content3" ContentPlaceHolderID="titleContent" runat="server">
    Rooms
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .room-page-item {
            border: 3px solid #ddd; /* Border color */
            padding: 20px; /* Padding around each room container */
            margin-bottom: 20px; /* Margin between each room container */
            border-radius: 5px; /* Optional: Add rounded corners */
        }

        .book-container {
            display: flex;
            justify-content: center;
            align-content: center;
            align-items: center;
        }

        .form-container {
            width: 80%;
            margin-top: 50px; /* Adjust as needed */
            display: flex;
            flex-direction: column;
            align-items: center; /* Center elements horizontally */
            margin-left: auto;
        }

        .row {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px; /* Adjust as needed */
        }

        .col-lg-6 {
            flex: 0 0 48%; /* Adjust as needed */
        }

        .left-label {
            display: block;
            margin-bottom: 5px;
        }

        .textbox,
        .dropdown {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        .available-button {
            padding: 10px 20px;
            background-color: #007bff; /* Adjust as needed */
            color: white;
            border: none;
            cursor: pointer;
        }

        .validation-error {
            color: red;
            margin-top: 5px;
        }
    </style>



    <link rel="stylesheet" href="roomCss/style.css" />
    <link rel="stylesheet" href="roomCss/bootstrap.min.css" />
    <link rel="stylesheet" href="roomCss/font-awesome.min.css" />
    <link href="roomCss/jquery-ui.min.css" rel="stylesheet" />
    <link href="roomCss/linearicons.css" rel="stylesheet" />
    <link href="roomCss/magnific-popup.css" rel="stylesheet" />
    <link href="roomCss/nice-select.css" rel="stylesheet" />
    <link href="roomCss/owl.carousel.min.css" rel="stylesheet" />
    <link href="roomCss/slicknav.min.css" rel="stylesheet" />
    <link href="roomCss/slicknav.min.css" rel="stylesheet" />
    <link href="roomCss/style.css.map" rel="stylesheet" />

    <link href="roomCss/flaticon.css" rel="stylesheet" />
    <link href="roomFonts/Flaticon.eot" rel="stylesheet" />
    <link href="roomFonts/Flaticon.svg" rel="stylesheet" />
    <link href="roomFonts/Flaticon.ttf" rel="stylesheet" />
    <link href="roomFonts/Flaticon.woff" rel="stylesheet" />

    <link href="roomFonts/Linearicons-Free.eot" rel="stylesheet" />
    <link href="roomFonts/Linearicons-Free.svg" rel="stylesheet" />
    <link href="roomFonts/Linearicons-Free.ttf" rel="stylesheet" />
    <link href="roomFonts/Linearicons-Free.woff" rel="stylesheet" />
    <link href="roomFonts/Linearicons-Free.woff2" rel="stylesheet" />

    <link href="roomFonts/fontawesome-webfont.eot" rel="stylesheet" />
    <link href="roomFonts/fontawesome-webfont.svg" rel="stylesheet" />
    <link href="roomFonts/fontawesome-webfont.ttf" rel="stylesheet" />
    <link href="roomFonts/fontawesome-webfont.woff" rel="stylesheet" />
    <link href="roomFonts/fontawesome-webfont.woff2" rel="stylesheet" />

    <form id="form1" runat="server">

        <div class="book-container">
            <div class="form-container">
                <div class="row">
                    <div class="col-lg-6">
                        <label class="left-label" for="checkInDate">Check-In Date:</label>
                        <asp:Calendar ID="checkInCal" CssClass="calendarStyle" runat="server" OnSelectionChanged="checkInCal_SelectionChanged"></asp:Calendar>
                        <asp:TextBox ID="checkInDate" runat="server" CssClass="textbox" Width="267px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCheckInDate" runat="server" ControlToValidate="checkInDate" ErrorMessage="Check-In Date is required." Text="*Please Enter Check In Date" ValidationGroup="checkOutGroup" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvDate" runat="server" ControlToValidate="checkInDate" ErrorMessage="Check-in date cannot be before today" OnServerValidate="cvDate_ServerValidate" EnableClientScript="false" CssClass="validation-error"></asp:CustomValidator>
                    </div>
                    <div class="col-lg-6">
                        <label class="left-label" for="checkOutDate">Check-Out Date:</label>
                        <asp:Calendar ID="checkOutCal" CssClass="calendarStyle" runat="server" OnSelectionChanged="checkOutCal_SelectionChanged"></asp:Calendar>
                        <asp:TextBox ID="checkOutDate" runat="server" CssClass="textbox" Width="265px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCheckOutDate" runat="server" ControlToValidate="checkOutDate" ErrorMessage="*Check-out date is required." Text="*Please Enter Check Out Date" ValidationGroup="checkOutGroup" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmpCheckInOutDates" runat="server"
                            ControlToValidate="checkOutDate"
                            ControlToCompare="checkInDate"
                            Operator="GreaterThanEqual"
                            ErrorMessage="*Check-out date cannot be before check-in date"
                            Type="Date"
                            Display="Dynamic"
                            ValidationGroup="checkOutGroup"
                            EnableClientScript="false"
                            CssClass="validation-error">
                        </asp:CompareValidator>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <label for="adults">Adults:</label>
                        <asp:DropDownList ID="adultsDropdown" runat="server" CssClass="dropdown" Width="68px">
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        </asp:DropDownList>

                        <label for="children">Children:</label>
                        <asp:DropDownList ID="childrenDropdown" runat="server" CssClass="dropdown" Width="68px">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div class="col-lg-6">
                        <asp:Button ID="submitBtn" runat="server" Text="Check Availability" CssClass="available-button" OnClick="submitBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!-- Rooms Section Begin -->
        <section class="room-section spad">
            <div class="container">
                <asp:Repeater ID="RoomRepeater" runat="server">
                    <ItemTemplate>
                        <div class="room-page-item">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="room-pic-slider owl-carousel">
                                        <div class="single-room-pic">
                                            <img src='<%# Eval("roomImage") %>' alt='<%# Eval("roomName") %>'
                                                <%# GetImageSizes((string)Eval("roomImage")) %> />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="room-text">
                                        <div class="room-title">
                                            <h2><%# Eval("roomName") %></h2>
                                            <div class="room-price">
                                                <span>From</span>
                                                <h2>$<%# Eval("roomPrice") %></h2>
                                                <h5>/night</h5>
                                            </div>
                                        </div>
                                        <div class="room-desc">
                                            <p><%# Eval("roomDesc") %></p>
                                        </div>
                                        <div class="room-features">
                                            <asp:Literal ID="roomFeaturesLiteral" runat="server"></asp:Literal>
                                        </div>
                                        <asp:Button ID="bookBtn" runat="server" Text="Book Now" CssClass="primary-btn" CommandName="Book" CommandArgument='<%# Eval("roomType") %>' OnCommand="bookBtn_Command" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>



            </div>
        </section>
        <!-- Rooms Section End -->
    </form>

    <script src="roomJs/jquery-3.3.1.min.js"></script>
    <script src="roomJs/bootstrap.min.js"></script>
    <script src="roomJs/jquery-ui.min.js"></script>
    <script src="roomJs/jquery.nice-select.min.js"></script>
    <script src="roomJs/jquery.magnific-popup.min.js"></script>
    <script src="roomJs/jquery.slicknav.js"></script>
    <script src="roomJs/owl.carousel.min.js"></script>
    <script src="roomJs/main.js"></script>

</asp:Content>
