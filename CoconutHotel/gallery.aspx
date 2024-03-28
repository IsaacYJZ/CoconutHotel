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
<section class="sub-header">
    <nav>
        <a href="home.html"><img src="image/logo.png" alt="Home"></a>
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
    </nav>
    <h1> Gallery</h1>
</section>

<div class="gallery">
    <a href="gallery/lobbyb.jpg" data-lightbox="mygallery" data-title="Lobby"><img src="gallery/lobbys.jpg"></a>
    <a href="gallery/campb.jpg"data-lightbox="mygallery" data-title="Sea View Camping"><img src="gallery/camps.jpg"></a>
    <a href="gallery/gymb.jpg" data-lightbox="mygallery" data-title="Full Equipped Gym"><img src="gallery/gyms.jpg"></a>
    <a href="gallery/meetb.jpg" data-lightbox="mygallery" data-title="Modern Conference Room"><img src="gallery/meets.jpg"></a>
    <a href="gallery/computerb.JPG" data-lightbox="mygallery" data-title="Pubic Computer"><img src="gallery/computers.JPG"></a>
    <a href="gallery/libraryb.JPG" data-lightbox="mygallery" data-title="Prodigy Library"><img src="gallery/librarys.JPG"></a>
    <a href="gallery/cinemab.jpeg" data-lightbox="mygallery" data-title="Claro Screen Cinema"><img src="gallery/cinemas.jpeg"></a>
    <a href="gallery/swimb.jpg" data-lightbox="mygallery" data-title="Giant Swimming Pool"><img src="gallery/swims.jpg"></a>
    <a href="gallery/poolbarb.jpg" data-lightbox="mygallery" data-title="Splash Pool Side Bar"><img src="gallery/poolbars.jpg"></a>
    <a href="gallery/spab.png" data-lightbox="mygallery" data-title="Peaceful Spa"><img src="gallery/spas.jpeg"></a>
    <a href="gallery/saunab.jpg" data-lightbox="mygallery" data-title="Aroma Saunas"><img src="gallery/saunas.jpg"></a>
    <a href="gallery/restaurantb.jpg" data-lightbox="mygallery" data-title="Italian Restaurant"><img src="gallery/restaurants.jpg"></a>
    <a href="gallery/underwaterb.JPG" data-lightbox="mygallery" data-title="Underwater Restaurant"><img src="gallery/underwaters.JPG"></a>
    <a href="gallery/chocolateb.JPG" data-lightbox="mygallery" data-title="Bittersweet Chocolate Shop"><img src="gallery/chocolates.JPG"></a>
    <a href="gallery/dessertb.JPG" data-lightbox="mygallery" data-title="Cakey Dessert Shop"><img src="gallery/desserts.JPG"></a>
    <a href="gallery/skybarb.jpg" data-lightbox="mygallery" data-title="Tenor Sky Bar"><img src="gallery/skybars.jpg"></a>
    <a href="gallery/cafeb.jpg" data-lightbox="mygallery" data-title="Alto's Cafe"><img src="gallery/cafes.jpg"></a>
    <a href="gallery/wineb.jpeg" data-lightbox="mygallery" data-title="Luscious Wine Shop"><img src="gallery/wines.jpeg"></a>
    <a href="gallery/giftshopb.JPG" data-lightbox="mygallery" data-title="Malone Gift Shop"><img src="gallery/giftshops.JPG"></a>
    <a href="gallery/basketball1b.jpeg" data-lightbox="mygallery" data-title="Indoor Basketball Court"><img src="gallery/basketball1s.jpeg"></a>
    <a href="gallery/basketball2b.jpg" data-lightbox="mygallery" data-title="Outdoor Basketball Court"><img src="gallery/basketball2s.jpg"></a>
    <a href="gallery/yogab.jpg" data-lightbox="mygallery" data-title="Le Flux Yoga Studio"><img src="gallery/yogas.jpg"></a>
    <a href="gallery/basicb.jpg" data-lightbox="mygallery" data-title="Basic Family Rooms (Please visit to our basic room page via home page if you are interested to the basic room)"><img src="gallery/basics.jpg"></a>
    <a href="gallery/classicb.jpg" data-lightbox="mygallery" data-title="Classic Family Rooms (Please visit to our classic room page via home page if you are interested to the classic room)"><img src="gallery/classics.jpg"></a>
    <a href="gallery/luxuryb.jpg" data-lightbox="mygallery" data-title="Luxury Family Rooms (Please visit to our luxury room page via home page if you are interested to the luxury room)"><img src="gallery/luxurys.jpg"></a>
    <a href="gallery/toilet1b.jpg" data-lightbox="mygallery" data-title="Classic Family Rooms Toilet"><img src="gallery/toilet1s.jpg"></a>
    <a href="gallery/toilet2b.jpg" data-lightbox="mygallery" data-title="Luxury Family Rooms Toilet"><img src="gallery/toilet2s.jpg"></a>
    <a href="gallery/snookerb.jpg" data-lightbox="mygallery" data-title="Snooker Room"><img src="gallery/snooker.jpg"></a>
    <a href="gallery/teagardenb.jpeg" data-lightbox="mygallery" data-title="Outdoor Tea Garden"><img src="gallery/teagarden.jpeg"></a>
    <a href="gallery/ktvb.jpg" data-lightbox="mygallery" data-title="KTV Room"><img src="gallery/ktv.jpg"></a>

</div>


<section class="footer">
    <h4>About Us</h4>
    <p>Our hotel is a luxurious hotel founded by a group of students. Our hotel first was bulit 20 years ago and we have been improving since then. <br>Our main objective is to ensure our customers will enjoy their stay in our hotel.</p> 
    <div class="icons">
        <svg 
            width="0.8em" 
            height="0.8em"
            viewBox="0 0 320 512">
            <path d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z" fill="currentColor"/>
        </svg>
            <svg 
            width="0.8em" 
            height="0.8em"
            viewBox="0 0 512 512">
            <path d="M459.37 151.716c.325 4.548.325 9.097.325 13.645c0 138.72-105.583 298.558-298.558 298.558c-59.452 0-114.68-17.219-161.137-47.106c8.447.974 16.568 1.299 25.34 1.299c49.055 0 94.213-16.568 130.274-44.832c-46.132-.975-84.792-31.188-98.112-72.772c6.498.974 12.995 1.624 19.818 1.624c9.421 0 18.843-1.3 27.614-3.573c-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319c-28.264-18.843-46.781-51.005-46.781-87.391c0-19.492 5.197-37.36 14.294-52.954c51.655 63.675 129.3 105.258 216.365 109.807c-1.624-7.797-2.599-15.918-2.599-24.04c0-57.828 46.782-104.934 104.934-104.934c30.213 0 57.502 12.67 76.67 33.137c23.715-4.548 46.456-13.32 66.599-25.34c-7.798 24.366-24.366 44.833-46.132 57.827c21.117-2.273 41.584-8.122 60.426-16.243c-14.292 20.791-32.161 39.308-52.628 54.253z" fill="currentColor"/>
        </svg>
        <svg 
            width="1em" 
            height="0.9em" 
            viewBox="0 0 448 512">
            <path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9S287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7s74.7 33.5 74.7 74.7s-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8c-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8s26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9c-26.2-26.2-58-34.4-93.9-36.2c-37-2.1-147.9-2.1-184.9 0c-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9c1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0c35.9-1.7 67.7-9.9 93.9-36.2c26.2-26.2 34.4-58 36.2-93.9c2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6c-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6c-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6c29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6c11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z" fill="currentColor"/>
        </svg>
        <svg 
            width="0.9em" 
            height="0.9em" 
            viewBox="0 0 448 512">
            <path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222c0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222c0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4l-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2c0-101.7 82.8-184.5 184.6-184.5c49.3 0 95.6 19.2 130.4 54.1c34.8 34.9 56.2 81.2 56.1 130.5c0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18c-5.1-1.9-8.8-2.8-12.5 2.8c-3.7 5.6-14.3 18-17.6 21.8c-3.2 3.7-6.5 4.2-12 1.4c-32.6-16.3-54-29.1-75.5-66c-5.7-9.8 5.7-9.1 16.3-30.3c1.8-3.7.9-6.9-.5-9.7c-1.4-2.8-12.5-30.1-17.1-41.2c-4.5-10.8-9.1-9.3-12.5-9.5c-3.2-.2-6.9-.2-10.6-.2c-3.7 0-9.7 1.4-14.8 6.9c-5.1 5.6-19.4 19-19.4 46.3c0 27.3 19.9 53.7 22.6 57.4c2.8 3.7 39.1 59.7 94.8 83.8c35.2 15.2 49 16.5 66.6 13.9c10.7-1.6 32.8-13.4 37.4-26.4c4.6-13 4.6-24.1 3.2-26.4c-1.3-2.5-5-3.9-10.5-6.6z" fill="currentColor"/>
        </svg>
    </div>
    <p>Made by group 4 for web design assignment</p>
</section>
</body>
</html>
