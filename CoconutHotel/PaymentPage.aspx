<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="CoconutHotel.PaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Styles for the table container */
        .table-container {
        }

        /* Styles for the table itself */
        .container {
            width: 50%; /* Set the width of the table to 50% */
        }

        /* Additional styles for cell height */
        .auto-style2, .auto-style3 {
            height: 24px; /* Adjust the height as needed */
        }

        .auto-style6 {
            width: 171px;
        }

        .auto-style7 {
            height: 24px;
            width: 171px;
        }

        .auto-style8 {
            width: 439px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <link href="Payment.css" rel="stylesheet" type="text/css" />

        <div class=" title">
            <h1 class="payment-header">Payment Page</h1>
        </div>


        <div class="table-container">
            <table class="container">

                <tr>
                    <td class="auto-style7">
                        <asp:Image ID="HotelImage" runat="server" />
                        <asp:Label ID="lblProductName" runat="server"></asp:Label></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblPrice" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class="auto-style6">Subtotal :</td>
                    <td>
                        <asp:Label ID="lblSubtotal" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style6">Total :</td>
                    <td>
                        <asp:Label ID="lblTotal" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>
        <br />
        <br />

        <div>
            <table class="container">
                <tr>
                    <td class="auto-style6">Payment Method :</td>
                    <td class="auto-style8">
                        <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label>

                        <asp:LinkButton ID="lbChangeMethod" runat="server">(Change)</asp:LinkButton>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style6">Account</td>
                    <td class="auto-style8">
                        <asp:Label ID="lblAccount" runat="server"></asp:Label>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Button ID="btnPurchase" runat="server" Text="Purchase" />

                    </td>
                </tr>
            </table>

            <div class="purchase-button">
            </div>

        </div>

    </form>

</asp:Content>

