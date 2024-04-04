<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="ChangePayment.aspx.cs" Inherits="CoconutHotel.ChangePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<form id="form2" runat="server">
    <link href="ThankYouPage.css" rel="stylesheet" type="text/css" />

    <link href="Payment.css" rel="stylesheet" type="text/css" />
    <asp:Image ID="Image1" runat="server" ImageUrl="Images/mark_done_icon.png" Height="257px" Width="309px" />
    <div class=" title">
        <h1 class="payment-header">Thank You For Purchasing!!</h1>
    </div>

    <div>
        <table class="container">
            <tr>
                <td>Date :</td>
                <td>
 
                </td>

            </tr>

            <tr>
                <td>Time :</td>
                <td>
 
                    &nbsp;</td>

            </tr>

            <tr>
                <td>
                    Method :</td>
                <td>
 
                </td>
            </tr>

            <tr>
                <td>Total :</td>
                <td>
 
                </td>
            </tr>
                        <tr>

                <td>
                    <asp:Button ID="btnComfirm" runat="server" Text="Back To HomePage" Width="76px" />
                </td>
            </tr>
        </table>

    </div>
</form>

</asp:Content>
