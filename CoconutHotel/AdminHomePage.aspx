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
                    <h2 class="text-right"><i class="fa fa-cart-plus f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Completed Bookings<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-4">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Rooms Availability</h6>
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Available Rooms<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-4">
            <div class="card bg-c-pink order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Payment Received</h6>
                    <h2 class="text-right"><i class="fa fa-credit-card f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Completed payments<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
	</div>
</div>

	
<div class="container">
<div class="row">
<div class="col-md-8">
    <h2>User Profile</h2>
    <div class="main-box clearfix">
        <div class="table-responsive">
            <table class="table user-list">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Username</th>
                        <th>IC Number</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Mila Kunis</td>
                        <td>IC1234567</td>
                        <td>123456789</td>
                        <td>mila@kunis.com</td>
                        <td>******</td>
                        <td>
                            <asp:LinkButton ID="ViewUserProfileButton1" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                     <tr>
                        <td>2</td>
                        <td>Mila Kunis</td>
                        <td>IC1234567</td>
                        <td>123456789</td>
                        <td>mila@kunis.com</td>
                        <td>******</td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                       <tr>
                        <td>3</td>
                        <td>Mila Kunis</td>
                        <td>IC1234567</td>
                        <td>123456789</td>
                        <td>mila@kunis.com</td>
                        <td>******</td>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                       <tr>
                        <td>4</td>
                        <td>Mila Kunis</td>
                        <td>IC1234567</td>
                        <td>123456789</td>
                        <td>mila@kunis.com</td>
                        <td>******</td>
                        <td>
                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                      <tr>
                        <td>5</td>
                        <td>Mila Kunis</td>
                        <td>IC1234567</td>
                        <td>123456789</td>
                        <td>mila@kunis.com</td>
                        <td>******</td>
                        <td>
                            <asp:LinkButton ID="LinkButton4" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                       <tr>
                        <td>6</td>
                        <td>Mila Kunis</td>
                        <td>IC1234567</td>
                        <td>123456789</td>
                        <td>mila@kunis.com</td>
                        <td>******</td>
                        <td>
                            <asp:LinkButton ID="LinkButton10" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                      <tr>
                        <td>7</td>
                        <td>Mila Kunis</td>
                        <td>IC1234567</td>
                        <td>123456789</td>
                        <td>mila@kunis.com</td>
                        <td>******</td>
                        <td>
                            <asp:LinkButton ID="LinkButton11" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <!-- Add more rows here -->
                </tbody>
            </table>
        </div>
    </div>
</div>

         <div class="col-md-4">
           <h3>Top Selling Products</h3>
           <div class="top-sales box">
               <div class="title">Room 1</div>
               <div class="image">
                    <img weight="50" height="100" src="roomImg/rooms-1.jpg" alt="Room 1"/>
               </div>
               <div class="details">
                   <p class="price">$1107</p>
                   <p class="product-description">This is Room 1</p>
               </div>
           </div>
           <div class="top-sales box">
               <div class="title">Room 2</div>
               <div class="image">
                    <img weight="50" height="100" src="roomImg/rooms-2.jpg" alt="Room 2"/>
               </div>
               <div class="details">
                   <p class="price">$1107</p>
                   <p class="product-description">This is Room 2</p>
               </div>
           </div>
           <div class="top-sales box">
               <div class="title">Room 3</div>
               <div class="image">
                    <img weight="50" height="100" src="roomImg/rooms-5.jpg" alt="Room 3"/>
               </div>
               <div class="details">
                   <p class="price">$1107</p>
                   <p class="product-description">This is Room 3</p>
               </div>
           </div>
       <!-- Repeat for other top selling products -->
   </div>

    <div class="container">
        <div class="row">
        <div class="col-md-8">
        <h2>Room</h2>
        <div class="main-box clearfix">
        <div class="table-responsive">
            <table class="table user-list">
                <thead>
                          <tr>
                               <th><span>No.</span></th>
                               <th><span>Image</span></th>
                               <th><span>Room Name</span></th>
                               <th><span>Room Type</span></th>
                               <th><span>Description</span></th>
                               <th><span>Price</span></th>
                               <th>&nbsp;</th>
                           </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" alt="">
                                    </td>
                                    <td>Room 1</td>
                                    <td>Standard</td>
                                    <td>Description of Room 1</td>
                                    <td>$100</td>
                                    <td>
                            <asp:LinkButton ID="LinkButton5" runat="server" CssClass="table-link" OnClick="ViewRoomButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                                <tr>
                                    <td>2</td>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" alt="">
                                    </td>
                                    <td>Room 2</td>
                                    <td>Standard</td>
                                    <td>Description of Room 1</td>
                                    <td>$100</td>
                                    <td>
                            <asp:LinkButton ID="LinkButton6" runat="server" CssClass="table-link" OnClick="ViewRoomButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                             <tr>
                                <td>3</td>
                                <td>
                                    <img src="roomImg/rooms-1.jpg" alt="">
                                </td>
                                <td>Room 3</td>
                                <td>Standard</td>
                                <td>Description of Room 1</td>
                                <td>$100</td>
                                <td>
                        <asp:LinkButton ID="LinkButton7" runat="server" CssClass="table-link" OnClick="ViewRoomButton_Click">
                            <span class="fa-stack">
                                <i class="fa fa-square fa-stack-2x"></i>
                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                            </span>
                        </asp:LinkButton>
                    </td>
                </tr>
                                   <tr>
                                    <td>4</td>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" alt="">
                                    </td>
                                    <td>Room 4</td>
                                    <td>Standard</td>
                                    <td>Description of Room 1</td>
                                    <td>$100</td>
                                    <td>
                            <asp:LinkButton ID="LinkButton8" runat="server" CssClass="table-link" OnClick="ViewRoomButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                                  <tr>
                                    <td>5</td>
                                    <td>
                                        <img src="roomImg/rooms-1.jpg" alt="">
                                    </td>
                                    <td>Room 5</td>
                                    <td>Standard</td>
                                    <td>Description of Room 1</td>
                                    <td>$100</td>
                                    <td>
                            <asp:LinkButton ID="LinkButton9" runat="server" CssClass="table-link" OnClick="ViewRoomButton_Click">
                                <span class="fa-stack">
                                    <i class="fa fa-square fa-stack-2x"></i>
                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <!-- Add more rows here -->
                </tbody>
            </table>
        </div>
    </div>
 
</div>
</div>
</div>
</div>
</div>

</asp:Content>