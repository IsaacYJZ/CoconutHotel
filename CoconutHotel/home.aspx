﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="CoconutHotel.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="home.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <section class="header">
            <nav>
                <a href="home.html">
                    <img src="Images/coconut.png" alt="Home" style="width: 50px; height: auto; margin-right: 10px;" /></a>
                <div class="nav-links">
                    <ul>
                        <li>
                            <asp:HyperLink ID="homeLoginLink" runat="server" NavigateUrl="~/homeLogin.aspx">HOME</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="aboutLink" runat="server" NavigateUrl="~/about.aspx">ABOUT</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="facilitiesLink" runat="server" NavigateUrl="~/facilities.aspx">FACILITIES</asp:HyperLink></li>
                         <li>
                            <asp:HyperLink ID="bookingLink" runat="server" NavigateUrl="~/CheckAvailability.aspx">BOOK A ROOM</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="contactLink" runat="server" NavigateUrl="~/contact.aspx">CONTACT</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="galleryLink" runat="server" NavigateUrl="~/gallery.aspx">GALLERY</asp:HyperLink></li>
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
</body>
</html>