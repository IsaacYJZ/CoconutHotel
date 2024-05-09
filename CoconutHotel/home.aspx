<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="CoconutHotel.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="home.css" rel="stylesheet" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>

    <title>Home</title>
</head>
<body>
    <form id="form1" runat="server">
        <section class="header">
            <nav>
                <a href="home.aspx">
                    <img src="Images/coconut.png" alt="Home" style="width: 50px; height: auto; margin-right: 10px;" /></a>
                <div class="nav-links">
                    <ul>
                        <li>
                            <asp:HyperLink ID="homeLoginLink" runat="server" NavigateUrl="~/home.aspx">HOME</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="aboutLink" runat="server" NavigateUrl="~/about.aspx">ABOUT</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="facilitiesLink" runat="server" NavigateUrl="~/facilities.aspx">FACILITIES</asp:HyperLink></li>
                         <li>
                            <asp:HyperLink ID="bookingLink" runat="server" NavigateUrl="~/login.aspx">BOOK A ROOM</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="galleryLink" runat="server" NavigateUrl="~/gallery.aspx">GALLERY</asp:HyperLink></li>
                         <li>
                            <asp:HyperLink ID="hypUserProfile" runat="server" NavigateUrl="login.aspx">
                    <i class="fas fa-user"></i>
                            </asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="text-box">
                <h1>WELCOME TO COCONUT HOTEL</h1>
                <p>
                    We warmly welcome you to our hotel, where we guarantee a delightful experience tailored to your satisfaction. 
                    <br />
                    Our prices reflect the premium services and unforgettable moments we strive to offer. 
                    <br />
                    We eagerly anticipate the opportunity to host you and create lasting memories together.
                </p>
                <br />
                <br />
                <asp:Button ID="bookBtn" runat="server" Text="Book Now" CssClass="book-btn" OnClick="bookBtn_Click"/>

            </div>
        </section>
        <section class="promo">
            <!--HTML Video[Online] https://www.w3schools.com/html/html5_video.asp [Accessed 21 August 2021]-->
            <div class="row">
                <div class="promo-col">
                    <h1>We are the best 5 stars Hotel<br/>
                        In the World</h1>
                    <p>
                        Coconut Hotel stands as a premier destination within TARUMT, offering unparalleled hospitality and services. 
                Founded by a dedicated group of students, our luxurious establishment has continuously evolved over the past two decades, 
                striving for excellence in every aspect. We take pride in providing exceptional service and a warm, welcoming atmosphere for all our guests. 
                In 2024, Coconut Hotel was honored with the prestigious title of the best hotel in TARUMT by the esteemed headmaster, 
                a testament to our commitment to excellence. Our primary goal is to ensure that each guest enjoys a truly exceptional stay with us.
                    </p>
                    <asp:Button ID="learnMoreBtn" runat="server" Text="Learn More" CssClass="learnMoreBtn" OnClick="learnMoreBtn_Click" />

                </div>
                <div class="promo-col">

                    <video src="image/New video.mp4" controls></video>
                </div>
            </div>
        </section>

    </form>


        <div class="footer">
        <div class="footer-text">
            <h1 class="fTitle">Coconut Hotel</h1>
            <p class="f1">Reservation +0611-1130 3353(24 hours)</p>
            <p class="f1">99, Jalan C M Hashim, Tanjung Tokong, 11200 Tanjung Bungah, Pulau Pinang</p>
            <p class="f1">--</p>

            <p class="f2">#Coconut Hotel</p>
            <p class="f2">© 2024 • Coconut Hotel All Rights Reserved • Coconut Hotel Management Sdn. Bhd 823281- K </p>
        </div>
    </div>
</body>
</html>
