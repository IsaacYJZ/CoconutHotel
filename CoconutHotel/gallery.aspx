<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="CoconutHotel.gallery" %>

<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Website</title>
    <link rel="stylesheet" href="gallery.css">
    <link rel="stylesheet" href="gallery/lightbox.min.css">
    <script src="gallery/lightbox-plus-jquery.min.js"></script>
</head>

<!--Lokesh Dhakar. 2021. Lightbox2 [Online]
Available at : https://lokeshdhakar.com/projects/lightbox2/ [Accessed 15 September 2021]-->

<body>
    <form id="form1" runat="server">
        <section class="sub-header">
            <%--<nav>
                <a href="home.html">
                    <img src="image/logo.png" alt="Home"></a>
                <div class="nav-links">
                    <ul>
                        <li><a href="home.html">HOME</a></li>
                        <li><a href="about.html">ABOUT</a></li>
                        <li><a href="facilities.html">FACILITIES</a></li>
                        <li><a href="booking.html">BOOKING</a></li>
                        <li><a href="contact.html">CONTACT</a></li>
                        <li><a href="gallery.html">GALLERY</a></li>
                    </ul>
                </div>
            </nav>--%>
            <h1>Gallery</h1>
        </section>

        <div class="gallery">
            <a href="gallery/lobbyb.jpg" data-lightbox="mygallery" data-title="Lobby">
                <img src="gallery/lobbys.jpg"></a>
            <a href="gallery/campb.jpg" data-lightbox="mygallery" data-title="Sea View Camping">
                <img src="gallery/camps.jpg"></a>
            <a href="gallery/gymb.jpg" data-lightbox="mygallery" data-title="Full Equipped Gym">
                <img src="gallery/gyms.jpg"></a>
            <a href="gallery/meetb.jpg" data-lightbox="mygallery" data-title="Modern Conference Room">
                <img src="gallery/meets.jpg"></a>
            <a href="gallery/computerb.JPG" data-lightbox="mygallery" data-title="Pubic Computer">
                <img src="gallery/computers.JPG"></a>
            <a href="gallery/libraryb.JPG" data-lightbox="mygallery" data-title="Prodigy Library">
                <img src="gallery/librarys.JPG"></a>
            <a href="gallery/cinemab.jpeg" data-lightbox="mygallery" data-title="Claro Screen Cinema">
                <img src="gallery/cinemas.jpeg"></a>
            <a href="gallery/swimb.jpg" data-lightbox="mygallery" data-title="Giant Swimming Pool">
                <img src="gallery/swims.jpg"></a>
            <a href="gallery/poolbarb.jpg" data-lightbox="mygallery" data-title="Splash Pool Side Bar">
                <img src="gallery/poolbars.jpg"></a>
            <a href="gallery/spab.png" data-lightbox="mygallery" data-title="Peaceful Spa">
                <img src="gallery/spas.jpeg"></a>
            <a href="gallery/saunab.jpg" data-lightbox="mygallery" data-title="Aroma Saunas">
                <img src="gallery/saunas.jpg"></a>
            <a href="gallery/restaurantb.jpg" data-lightbox="mygallery" data-title="Italian Restaurant">
                <img src="gallery/restaurants.jpg"></a>
            <a href="gallery/underwaterb.JPG" data-lightbox="mygallery" data-title="Underwater Restaurant">
                <img src="gallery/underwaters.JPG"></a>
            <a href="gallery/chocolateb.JPG" data-lightbox="mygallery" data-title="Bittersweet Chocolate Shop">
                <img src="gallery/chocolates.JPG"></a>
            <a href="gallery/dessertb.JPG" data-lightbox="mygallery" data-title="Cakey Dessert Shop">
                <img src="gallery/desserts.JPG"></a>
            <a href="gallery/skybarb.jpg" data-lightbox="mygallery" data-title="Tenor Sky Bar">
                <img src="gallery/skybars.jpg"></a>
            <a href="gallery/cafeb.jpg" data-lightbox="mygallery" data-title="Alto's Cafe">
                <img src="gallery/cafes.jpg"></a>
            <a href="gallery/wineb.jpeg" data-lightbox="mygallery" data-title="Luscious Wine Shop">
                <img src="gallery/wines.jpeg"></a>
            <a href="gallery/giftshopb.JPG" data-lightbox="mygallery" data-title="Malone Gift Shop">
                <img src="gallery/giftshops.JPG"></a>
            <a href="gallery/basketball1b.jpeg" data-lightbox="mygallery" data-title="Indoor Basketball Court">
                <img src="gallery/basketball1s.jpeg"></a>
            <a href="gallery/basketball2b.jpg" data-lightbox="mygallery" data-title="Outdoor Basketball Court">
                <img src="gallery/basketball2s.jpg"></a>
            <a href="gallery/yogab.jpg" data-lightbox="mygallery" data-title="Le Flux Yoga Studio">
                <img src="gallery/yogas.jpg"></a>
            <a href="gallery/basicb.jpg" data-lightbox="mygallery" data-title="Basic Family Rooms (Please visit to our basic room page via home page if you are interested to the basic room)">
                <img src="gallery/basics.jpg"></a>
            <a href="gallery/classicb.jpg" data-lightbox="mygallery" data-title="Classic Family Rooms (Please visit to our classic room page via home page if you are interested to the classic room)">
                <img src="gallery/classics.jpg"></a>
            <a href="gallery/luxuryb.jpg" data-lightbox="mygallery" data-title="Luxury Family Rooms (Please visit to our luxury room page via home page if you are interested to the luxury room)">
                <img src="gallery/luxurys.jpg"></a>
            <a href="gallery/toilet1b.jpg" data-lightbox="mygallery" data-title="Classic Family Rooms Toilet">
                <img src="gallery/toilet1s.jpg"></a>
            <a href="gallery/toilet2b.jpg" data-lightbox="mygallery" data-title="Luxury Family Rooms Toilet">
                <img src="gallery/toilet2s.jpg"></a>
            <a href="gallery/snookerb.jpg" data-lightbox="mygallery" data-title="Snooker Room">
                <img src="gallery/snooker.jpg"></a>
            <a href="gallery/teagardenb.jpeg" data-lightbox="mygallery" data-title="Outdoor Tea Garden">
                <img src="gallery/teagarden.jpeg"></a>
            <a href="gallery/ktvb.jpg" data-lightbox="mygallery" data-title="KTV Room">
                <img src="gallery/ktv.jpg"></a>

        </div>

    </form>

</body>
</html>
