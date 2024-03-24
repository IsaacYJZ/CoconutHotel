<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomBooking.aspx.cs" Inherits="CoconutHotel.RoomBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hotel Booking</title>
    <link rel="stylesheet" href="roomBooking.css" />
    <script src="roomBooking.js"></script>

</head>
<body>
    <div class="background-container"></div>
    <!-- Background blur container -->

    <form id="form1" runat="server">
        <div class="container">
            <div class="form-container">
                <h2>Hotel Booking</h2>
                <label for="departureDate">
                    Departure Date:

                </label>
                <asp:Calendar ID="departureCal" CssClass="calendarStyle" runat="server" OnSelectionChanged="departureCal_SelectionChanged"></asp:Calendar>

                &nbsp;<asp:TextBox ID="departureDate" runat="server" CssClass="textbox" Width="267px"></asp:TextBox>

                <br />
                <br />
                <br />

                <label for="arrivalDate">
                    Arrival Date:
                </label>
                <asp:Calendar ID="arrivalCal" CssClass="calendarStyle" runat="server" OnSelectionChanged="arrivalCal_SelectionChanged"></asp:Calendar>
                &nbsp;<asp:TextBox ID="arrivalDate" runat="server" CssClass="textbox" Width="265px"></asp:TextBox>
                <br />
                <br />
                <br />



                <label for="adults">Adults:</label>
                <asp:DropDownList ID="adultsDropdown" runat="server" CssClass="dropdown" Width="68px">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />

                <label for="children">Children:</label>
                <asp:DropDownList ID="childrenDropdown" runat="server" CssClass="dropdown" Width="68px">
                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                </asp:DropDownList>
                <br />



                <asp:Button ID="submitBtn" runat="server" Text="Check Availability" CssClass="submit-button" OnClick="submitBtn_Click"/>
            </div>
            <div class="slideshow-container">
                <img class="mySlides" src="bookingImg/banner1.png" alt="Slide 1" />
                <img class="mySlides" src="bookingImg/banner2.png" alt="Slide 2" />
                <img class="mySlides" src="bookingImg/banner3.png" alt="Slide 3" />
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
