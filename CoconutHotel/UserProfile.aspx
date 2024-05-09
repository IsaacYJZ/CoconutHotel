<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CoconutHotel.UserProfile" %>

<asp:Content ID="Content3" ContentPlaceHolderID="titleContent" runat="server">
    User Profile
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Profile</title>
    <style>
        /* CSS styles for the logout button */
        .logout-btn {
            text-align: center;
            margin-top: 20px;
        }

        .btn-logout {
            background-color: #f44336; /* Red background color */
            color: white; /* White text color */
            padding: 10px 20px; /* Padding */
            border: none; /* Remove border */
            cursor: pointer; /* Cursor style */
            border-radius: 5px; /* Rounded corners */
            font-size: 16px; /* Font size */
        }

            /* Hover effect */
            .btn-logout:hover {
                background-color: #d32f2f; /* Darker red */
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link href="UserProfile.css" rel="stylesheet" type="text/css" />

    <form id="form1" runat="server" class="userProfile">
        <div class="container">
            <h2>User Profile</h2>
            <div class="user-detail">
                <label for="id">ID:</label>
                <asp:Label ID="lblID" runat="server" />
            </div>

            <div class="user-detail">
                <label for="name">Username:</label>
                <asp:Label ID="lblName" runat="server" />
            </div>

            <div class="user-detail">
                <label for="icNum">IC Number:</label>
                <asp:Label ID="lblICNum" runat="server" />
            </div>

            <div class="user-detail">
                <label for="email">Email:</label>
                <asp:Label ID="lblEmail" runat="server" />
            </div>

            <div class="user-detail">
                <label for="phoneNumber">Phone Number:</label>
                <asp:Label ID="lblPhoneNumber" runat="server" />
            </div>

            <div class="user-detail">
                <label for="userType">User Type:</label>
                <asp:Label ID="lblUserType" runat="server" />
            </div>

            <div class="edit-profile">
                <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" OnClick="btnEditProfile_Click" CssClass="btn-edit" />
            </div>

            <div class="booking-history">
                <h2>Booking History</h2>
                <asp:Repeater ID="rptBookingHistory" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Booking ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Room Type</th>
                                <th>Room ID</th>
                                <th>Booking Date</th>
                                <th>Check In Date</th>
                                <th>Check Out Date</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("bookingID") %></td>
                            <td><%# Eval("UserName") %></td>
                            <td><%# Eval("Email") %></td>
                            <td><%# Eval("roomType") %></td>
                            <td><%# Eval("roomID") %></td>
                            <td><%# Eval("bookingDate") %></td>
                            <td><%# Eval("checkInDate") %></td>
                            <td><%# Eval("checkOutDate") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Label ID="lblNoBookingMessage" runat="server" Text="No booking history available." Visible="false"></asp:Label>

            </div>
        </div>
        <div class="logout-btn">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn-logout" />
        </div>
    </form>

</asp:Content>
