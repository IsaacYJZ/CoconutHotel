<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="CheckAvailability.aspx.cs" Inherits="CoconutHotel.CheckAvailabililty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <link href="CheckAvailability.css" rel="stylesheet" type="text/css" />
    <div class="background-container"></div>
    <!-- Background blur container -->

    <form id="form1" runat="server">
        <div class="book-container">
            <div class="form-container">
                <h2>Hotel Booking</h2>
                <label for="checkInDate">
                    Check-In Date:

                </label>
                <asp:Calendar ID="checkInCal" CssClass="calendarStyle" runat="server" OnSelectionChanged="checkInCal_SelectionChanged"></asp:Calendar>

                &nbsp;<asp:TextBox ID="checkInDate" runat="server" CssClass="textbox" Width="267px"></asp:TextBox>

                <br />
                <br />
                <br />

                <label for="checkOutDate">
                    Check-Out Date:
                </label>
                <asp:Calendar ID="checkOutCal" CssClass="calendarStyle" runat="server" OnSelectionChanged="checkOutCal_SelectionChanged"></asp:Calendar>
                &nbsp;<asp:TextBox ID="checkOutDate" runat="server" CssClass="textbox" Width="265px"></asp:TextBox>
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



                <asp:Button ID="submitBtn" runat="server" Text="Check Availability" CssClass="available-button" OnClick="submitBtn_Click"/>
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

</asp:Content>
