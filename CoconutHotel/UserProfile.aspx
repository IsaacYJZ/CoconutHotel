<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CoconutHotel.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Profile</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link href="UserProfile.css" rel="stylesheet" type="text/css" />


    <form id="form1" runat="server" class="userProfile">
        <div class="container">
            <h2>User Profile</h2>
            <div class="user-detail">
                <label for="name">Name:</label>
                <asp:Label ID="lblName" runat="server" Text="John Doe" />
            </div>
            <div class="user-detail">
                <label for="email">Email:</label>
                <asp:Label ID="lblEmail" runat="server" Text="johndoe@example.com" />
            </div>
            <div class="user-detail">
                <label for="password">Password:</label>
                <asp:Label ID="lblPassword" runat="server" Text="*********" />
            </div>
            <div class="user-detail">
                <label for="phone">Phone Number:</label>
                <asp:Label ID="lblPhone" runat="server" Text="123-456-7890" />
            </div>
            <div class="edit-profile">
                <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" OnClick="btnEditProfile_Click" CssClass="btn-edit" />
                <i class="fas fa-edit"></i>

            </div>

            <div class="booking-history">
                <h2>Booking History</h2>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Room Type</th>
                        <th>Payment Method</th>
                        <th>Payment Date</th>
                        <th>Payment Time</th>
                    </tr>
                    <asp:Repeater ID="rptBookingHistory" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Phone") %></td>
                                <td><%# Eval("RoomType") %></td>
                                <td><%# Eval("PaymentMethod") %></td>
                                <td><%# Eval("PaymentDate", "{0:yyyy-MM-dd}") %></td>
                                <td><%# Eval("PaymentTime", "{0:HH:mm}") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
    </form>


</asp:Content>
