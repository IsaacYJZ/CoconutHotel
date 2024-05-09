<%@ Page Title="" Language="C#" MasterPageFile="~/Payment.Master" AutoEventWireup="true" CodeBehind="ThankYouPage.aspx.cs" Inherits="CoconutHotel.ChangePayment" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContent" runat="server">
    Thank You
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style3 {
            width: 77%;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<form id="form2" runat="server">
    <link href="ThankYouPage.css" rel="stylesheet" type="text/css" />

    <link href="Payment.css" rel="stylesheet" type="text/css" />
    <asp:Image ID="Image1" runat="server" ImageUrl="Images/mark_done_icon.png" Height="109px" Width="108px" />
    <div class=" title">
        <h1 class="TQ-header">Thank You For Purchasing!!</h1>
    </div>

    <div class="tq-container">
        <table class="auto-style3" >
            <tr>
                <td>Date :</td>
                <td>
                    <asp:Label ID="lblPurchaseDate" runat="server"></asp:Label>
                </td>

            </tr>

            <tr>
                <td>Time :</td>
                <td>
                    <asp:Label ID="lblPurchaseTime" runat="server" ></asp:Label>
                </td>

            </tr>

            <tr>
                <td>
                    Method :</td>
                <td>
                    <asp:Label ID="lblMethodSelected" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>Total :</td>
                <td>
                    <asp:Label ID="lblPurchaseTotal" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Button ID="btnComfirm" runat="server" Text="Back To HomePage" Width="393px" OnClick="btnComfirm_Click" />
                </td>
            </tr>
        </table>

        <div class="BackToHomePage">
            
        </div>
         

    </div>
</form>

</asp:Content>
