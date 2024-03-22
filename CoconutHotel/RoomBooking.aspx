<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomBooking.aspx.cs" Inherits="CoconutHotel.RoomBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hotel Booking</title>
    <link rel="stylesheet" href="roomBooking.css" />
    <script src="roomBooking.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-container">
                <h2>Hotel Booking</h2>
                <label for="departureDate">
                    Departure Date:<br />
                </label>
                <asp:Calendar ID="departureCal" runat="server" OnSelectionChanged="departureCal_SelectionChanged"></asp:Calendar>
                &nbsp;<asp:TextBox ID="departureDate" runat="server" CssClass="textbox"></asp:TextBox><br />

                <label for="arrivalDate">
                    Arrival Date:<asp:Calendar ID="arrivalCal" runat="server" OnSelectionChanged="arrivalCal_SelectionChanged"></asp:Calendar>
                </label>
                &nbsp;<asp:TextBox ID="arrivalDate" runat="server" CssClass="textbox"></asp:TextBox><br />



                <label for="adults">Adults:</label>
                <asp:DropDownList ID="adultsDropdown" runat="server" CssClass="dropdown">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                </asp:DropDownList><br />

                <label for="children">Children:</label>
                <asp:DropDownList ID="childrenDropdown" runat="server" CssClass="dropdown">
                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                </asp:DropDownList><br />

                <asp:Button ID="submitBtn" runat="server" Text="Book Now" CssClass="submit-button" />
            </div>
            <div class="slideshow-container">
                <img class="mySlides" src="bookingImg/scene1.jpg" alt="Slide 1" />
                <img class="mySlides" src="bookingImg/scene2.jpg" alt="Slide 2" />
                <img class="mySlides" src="bookingImg/scene3.jpeg" alt="Slide 3" />
            </div>
        </div>
    </form>
    <script>
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
        }
    </script>
</body>
</html>
