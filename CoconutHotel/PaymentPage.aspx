<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="CoconutHotel.PaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
/*
        .table-standard td, .table-standard th{
            border: 2px solid black;
        }
*/

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <h1 class="payment-header">Payment Page</h1>

    <form id="form1" runat="server">

        <link href="Payment.css" rel="stylesheet" type="text/css" />

        <div class="parent-container clearfix">
            <div class="Payment-detail-container">
                <table class="price-table-standard">

                    <tr>
                        <td colspan="2">Summary :</td>
                    </tr>

                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="HotelImage" runat="server" />
                            <asp:Label ID="lblProductName" runat="server">sea theme twin room</asp:Label></td>
                        <td>
                            <asp:Label ID="lblPrice" runat="server">price</asp:Label></td>
                    </tr>
                   <tr>
                        <td class="auto-style3">Subtotal :</td>
                        <td>
                            <asp:Label ID="lblSubtotal" runat="server">subtotal price</asp:Label></td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Total :</td>
                        <td>
                            <asp:Label ID="lblTotal" runat="server">total</asp:Label></td>
                    </tr>
                </table>
            </div>



            <div class="payment-container">
                <table class="table-standard">
                    <tr>
                        <td class="auto-style4">Payment Method :</td>
                        <td>
                            <asp:Label ID="lblPaymentMethod" runat="server">cash</asp:Label>

                            <asp:LinkButton ID="lbChangeMethod" runat="server" OnClick="lbChangeMethod_Click">(Change)</asp:LinkButton>

                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style4">Account :</td>
                        <td>
                            <asp:Label ID="lblAccount" runat="server">ali</asp:Label>

                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                        <td>
                            <div>
                                <asp:Button ID="btnPurchase" runat="server" Text="Purchase" />
                            </div>
                        </td>
                    </tr>
                </table>


            </div>
        </div>
    </form>

</asp:Content>
