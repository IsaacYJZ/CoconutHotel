<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homeLogin.aspx.cs" Inherits="CoconutHotel.homeLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="home.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>

    <title>Welcome</title>
</head>
<body>
    <form id="form1" runat="server">
        <section class="header">
            <nav>
                <a href="homeLogin.aspx">
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
                            <asp:HyperLink ID="bookinglink" runat="server" NavigateUrl="~/CheckAvailability.aspx">BOOK A ROOM</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="contactLink" runat="server" NavigateUrl="~/contact.aspx">CONTACT</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="galleryLink" runat="server" NavigateUrl="~/gallery.aspx">GALLERY</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="hypUserProfile" runat="server" NavigateUrl="UserProfile.aspx">
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
                <asp:Button ID="bookBtn" runat="server" Text="Book Now" CssClass="book-btn" OnClick="bookBtn_Click" />

            </div>
        </section>
        <section class="promo">
            <!--HTML Video[Online] https://www.w3schools.com/html/html5_video.asp [Accessed 21 August 2021]-->
            <div class="row">
                <div class="promo-col">
                    <h1>We are the best 5 stars Hotel<br>
                        In the World</h1>
                    <p>
                        Coconut Hotel stands as a premier destination within TARUMT, offering unparalleled hospitality and services. 
        Founded by a dedicated group of students, our luxurious establishment has continuously evolved over the past two decades, 
        striving for excellence in every aspect. We take pride in providing exceptional service and a warm, welcoming atmosphere for all our guests. 
        In 2024, Coconut Hotel was honored with the prestigious title of the best hotel in TARUMT by the esteemed headmaster, 
        a testament to our commitment to excellence. Our primary goal is to ensure that each guest enjoys a truly exceptional stay with us.
                    </p>

                </div>
                <div class="promo-col">

                    <video src="image/New video.mp4" controls></video>
                </div>
            </div>
        </section>

        <section class="rooms">
            <h1>Our Room Selection</h1>
            <p>These are our room offerings</p>

            <div class="row">
                <div class="rooms-cal">
                    <img src="image/room3.jpg" alt="BASIC" />
                    <a href="#">
                        <div class="layer">
                            <h3>BASIC</h3>
                        </div>
                    </a>
                </div>
                <div class="rooms-cal">
                    <img src="image/room2.jpg" alt="CLASSIC" />
                    <a href="#">
                        <div class="layer">
                            <h3>CLASSIC</h3>
                        </div>
                    </a>
                </div>
                <div class="rooms-cal">
                    <img src="image/room1.jpg" alt="LUXURY" />
                    <a href="#">
                        <div class="layer">
                            <h3>LUXURY</h3>
                        </div>
                    </a>
                </div>
            </div>
        </section>

        <section class="review">
            <h1>Reviews and Feedback</h1>
            <p>
                Reviews and feedback given by our 
customers
            </p>

            <div class="row">
                <div class="review-col">
                    <img src="image/user1.jpg" alt="user1">
                    <div>
                        <p>This is the best hotel I have ever been.</p>
                        <h3>Taylor Swiss</h3>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                        </svg>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                        </svg>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                        </svg>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                        </svg>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M5.025 20.775A.998.998 0 0 0 6 22a1 1 0 0 0 .555-.168L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082a1 1 0 0 0-.59-1.74l-5.701-.454l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.214 4.107l-1.491 6.452zM12 5.429l2.042 4.521l.588.047h.001l3.972.315l-3.271 2.944l-.001.002l-.463.416l.171.597v.003l1.253 4.385L12 15.798V5.429z" fill="currentColor" />
                        </svg>
                    </div>
                </div>
                <div class="review-col">
                    <img src="image/user2.jpg"
                        alt="user1">
                    <div>
                        <p>Fantastic experience! The staff were incredibly welcoming and accommodating. The room was clean and spacious with breathtaking views. Will definitely be returning!"</p>
                        <h3>Taehyung Kim</h3>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                        </svg>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                        </svg>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                        </svg>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                        </svg>
                        <svg
                            width="1em"
                            height="1em"
                            viewBox="0 0 24 24">
                            <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                        </svg>
                    </div>
                </div>
            </div>
            <asp:Button ID="moreReviewBtn" runat="server" Text="More Review" CssClass="review-btn" OnClick="moreReviewBtn_Click" />
            <br />
            <br />
        </section>
    </form>

    <div class="footer">
        <!-- footer content here -->
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
