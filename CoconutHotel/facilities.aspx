<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="facilities.aspx.cs" Inherits="CoconutHotel.facilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="facilities.css">
    <form id="form1" runat="server">
        <section class="sub-header">

            <h1>Facilities & Services</h1>
        </section>

        <section class="facilities">
            <h1>Hotel Facilities</h1>
            <p>The facilities we provide for our customers</p>

            <div class="row">
                <div class="facilities-col">
                    <img src="image/swimming.jpg">
                    <h3>Giant Swimming Pool</h3>
                    <p>This is one of the biggest swimming pool in all of TARUC. The swimming pool is very clean and safe so customers can have a wonderful experience.</p>
                </div>
                <div class="facilities-col">
                    <img src="image/gym.jpg">
                    <h3>Fully Equipped Gym</h3>
                    <p>This is one of the best gym in all of TARUC. The gym is equipped with all of the most high tech gym equipments money can buy and we clean our equipments everyday.</p>
                </div>
                <div class="facilities-col">
                    <img src="image/meet.jpg">
                    <h3>Modern Conference Room</h3>
                    <p>This is the best conference room in all of TARUC. The conference rooms are very clean and full of nice equipments such as the ergonomic chairs we provide and the top of the line TVs.</p>
                </div>
                <br>
            </div>

            <div class="row">
                <div class="facilities-col">
                    <img src="image/spa.jpeg">
                    <h3>Peaceful Spa</h3>
                    <p>This is the biggest spa in all of TARUC. The spa have a relaxing massage to soothe muscles and help customer relieve your stress. It also include body treatement, relaxing full body massage, facial and reflexology.</p>
                </div>
                <div class="facilities-col">
                    <img src="image/sauna.jpg">
                    <h3>Aroma Saunas</h3>
                    <p>This is one of the best sauna in all of TARUC. The sauna is sweat bathing that have an effective way to get clean, yields deep mental and physical rejuvenation.</p>
                </div>
                <div class="facilities-col">
                    <img src="image/poolbar.jpg">
                    <h3>Splash Pool Side Bar</h3>
                    <p>This is one of the best pool side bar in all of TARUC. The bar have a lot of special drinks. Customer can order the drinks when they are tired and thirsty after swim.</p>
                </div>
                <br>
            </div>

            <div class="row">
                <div class="facilities-col">
                    <img src="image/cafe.jpg">
                    <h3>Alto's Cafe</h3>
                    <p>This is the biggest coffee shop in all of TARUC. The cafe has a smell that as sweet as when you open up a fresh bag of coffee beans. It also serve western food so customers can enjoy their coffee and meals.</p>
                </div>
                <div class="facilities-col">
                    <img src="image/restauran.jpg">
                    <h3>Italian Restaurant</h3>
                    <p>This is the most high class restaurant in all of TARUC. The restaurant serve Italian food so customers can try the food if they don't know how Italian food tasted like.</p>
                </div>
                <div class="facilities-col">
                    <img src="image/skybar.jpg">
                    <h3>Tenor Sky Bar</h3>
                    <p>
                        This is one of the best sky bar in all of TARUC. Tenor Sky Lounge offers customer with spectacular view of Kuala Lumpur.
            Relaxing music will be played to let customers feel more relaxing while sipping a variety of fine wines and a mix of deftly crafted cocktails.
                    </p>
                </div>
                <br>
            </div>

            <div class="row">
                <div class="facilities-col">
                    <img src="image/public computer.JPG">
                    <h3>Public Computer</h3>
                    <p>These public computers are prepared for the custemor to surfing the internet to find some information, play gamesand etc. The time for customer use the computer is unlimited.</p>
                </div>
                <div class="facilities-col">
                    <img src="image/cinema.jpeg">
                    <h3>Claro Screen Cinema</h3>
                    <p>This is the biggest cinema in all of TARUC. The couch is very comfortable. Pillow and blanket are available. </p>
                </div>
                <div class="facilities-col">
                    <img src="image/giftshop.JPG">
                    <h3>Malone Gift Shop</h3>
                    <p>This is one of the best gift shop in all of TARUC. The shop sell lot of things, so customers can buy some souvenirs for their family and friends.</p>
                </div>
                <br>
            </div>
            <h2>For more picture，head to our gallery.<br>
                <br>
                <asp:Button ID="btnGallery" runat="server" CssClass="book-btn" Text="Gallery" OnClick="btnGallery_Click" />
            </h2>

        </section>
        <section class="facilities">
            <h1>Hotel Services</h1>
            <div class="row">
                <div class="facilities-col">
                    <img src="image/roomservice.JPG">
                    <h3>24-Hour Room Services</h3>
                    <p>If you have any needs, you can contact the phone number bolow.<br>
                        We are happy to serve you!</p>
                    <br>
                    <p>Lobby : 03-1800 8255</p>
                    <p>Order Services : 03-1234 6000</p>
                    <p>Cleaning Services : 03-4321 5000</p>
                </div>
                <div class="facilities-col">
                    <img src="image/doctor.JPG">
                    <h3>24-Hour Doctor On Call</h3>
                    <p>If you have any health problems, please don't worry about it because the doctor is 24-Hour on call. You can contact either one of the phone number below.</p>
                    <br>
                    <p>Phone : 03-8989 6666</p>
                    <p>Phone : 03-3568 5354</p>

                </div>
                <div class="facilities-col">
                    <img src="image/laundry.JPG">
                    <h3>Laundry Services</h3>
                    <p>If you need a laundry services, you can contact the phone number below. If your fabric cannot be wash by washing machine,dry cleaned or any other issues, please notify us.</p>
                    <br>
                    <p>Phone : 03-9080 7766</p>
                </div>
        </section>

        <div class="amenities">
            <section class="aminities">
                <h1>Amenities</h1>
                <br>
                <h2>Internet</h2>
                <p>
                    &#10004;  Free Wi-Fi<p>
                        <h2>Policies & Payments</h2>
                        <p>&#10004;  Master card
                            <br>
                            &#10004;  Visa card
                            <br>
                            &#10004;  Touch 'n Go
                            <br>
                            &#10004;  Cash</p>
                <h2>Services</h2>
                <p>&#10004;  Front desk (24-Hour)</p>
                <h2>Pools</h2>
                <p>&#10004;  Outdoor pool</p>
                <h2>Pets</h2>
                <p>&#10004;  Pets are allowed</p>
                <h2>Food and Drinks</h2>
                <p>&#10004;  Restaurant
                    <br>
                    &#10004;  Bar
                    <br>
                    &#10004;  Table Services
                    <br>
                    &#10004;  Buffet Dinner
                    <br>
                    &#10004;  Breakfast Buffet (extra charge) </p>
                <h2>Languages Spoken</h2>
                <p>&#10004;  English
                    <br>
                    &#10004;  Malay
                    <br>
                    &#10004;     Mandarin</p>
            </section>
        </div>

    </form>
</asp:Content>
