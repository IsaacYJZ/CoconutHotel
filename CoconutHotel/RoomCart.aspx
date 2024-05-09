<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="RoomCart.aspx.cs" Inherits="CoconutHotel.roomCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Add your CSS styles here */
        .room-cart {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .room-cart-header {
            margin-bottom: 20px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        }

        .room-cart-date {
            font-size: 16px;
            text-align: center;
            margin-bottom: 10px;
        }

        .room-item {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .room-image {
            width: 100px;
            height: 100px;
            border-radius: 5px;
            margin-right: 15px;
            object-fit: cover;
        }

        .room-details {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .room-info {
            flex-grow: 1;
        }

        .room-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .room-price {
            font-size: 14px;
            color: #007bff;
        }

        .removeBtnCss {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            transition: background-color 0.3s;
            border-radius: 5px;
        }

            .removeBtnCss:hover {
                background-color: #c82333;
            }

        .room-cart-date {
            margin-bottom: 10px;
        }

        .check-in-check-out {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

            .check-in-check-out label {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .check-in-check-out .date-label {
                font-size: 16px;
                color: #333;
            }

            .check-in-check-out .date-value {
                font-size: 14px;
                color: #555;
            }

        /* Added style for total price label */
        .total-price {
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
        /* Style for the proceed to checkout button */
        .proceedBtnCss {
            background-color: #28a745; /* Green background color */
            color: white; /* White text color */
            border: none; /* No border */
            padding: 10px 20px; /* Padding around the text */
            font-size: 16px; /* Font size */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Cursor style on hover */
            transition: background-color 0.3s; /* Smooth background color transition */
            margin-top: 20px; /* Top margin */
            display: block; /* Display as block element */
            margin-left: auto; /* Center the button horizontally */
            margin-right: auto;
            text-decoration: none; /* Remove underline */
        }

            /* Style for the proceed to checkout button on hover */
            .proceedBtnCss:hover {
                background-color: #218838; /* Darker green on hover */
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

        <div class="room-cart">
            <h2 class="room-cart-header">Your Room Cart</h2>

            <asp:Repeater ID="roomRepeater" runat="server">
                <ItemTemplate>
                    <div class="room-item">
                        <div class="room-details">
                            <img class="room-image" src="<%# Eval("RoomImage") %>" alt="<%# Eval("RoomName") %>" />
                            <div class="room-info">
                                <div class="room-title"><%# Eval("RoomName") %></div>
                                <div class="room-price">$<%# Eval("RoomPrice") %> </div>
                            </div>
                        </div>
                        <div class="room-cart-date">
                            <div class="check-in-check-out">
                                <label>Check-In Date:</label>
                                <asp:Label ID="CheckInDateLabel" runat="server" CssClass="date-label" Text='<%# Eval("CheckInDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </div>
                            <div class="check-in-check-out">
                                <label>Check-Out Date:</label>
                                <asp:Label ID="CheckOutDateLabel" runat="server" CssClass="date-label" Text='<%# Eval("CheckOutDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </div>
                        </div>
                        <asp:Button ID="removeBtn" runat="server" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("RoomID") %>' OnCommand="removeBtn_Command" CssClass="removeBtnCss" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Literal ID="noRoomsMessage" runat="server" Visible="false">No rooms selected.</asp:Literal>

            <!-- Added total price label -->
            <div class="total-price">
                Total Price: $<asp:Label ID="TotalPriceLabel" runat="server" Text="0.00"></asp:Label>
            </div>
            <asp:Button ID="proceedToCheckoutBtn" runat="server" Text="Proceed to Checkout" OnClick="ProceedToCheckoutBtn_Click" CssClass="proceedBtnCss" />

        </div>
    </form>
</asp:Content>
