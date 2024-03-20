<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="ChangePayment.aspx.cs" Inherits="CoconutHotel.ChangePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 81px;
        }
        .auto-style4 {
            height: 37px;
        }
        .auto-style5 {
            width: 81px;
            height: 37px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Payment.css" rel="stylesheet" type="text/css" />

    <div class=" title">
        <h1 class="payment-header">PAYMENT METHOD</h1>
    </div>

    <div>
        <table class="container">
            <tr>
                <td class="auto-style9">Payment Method :</td>
                <td class="auto-style3">
 
                </td>

            </tr>

            <tr>
                <td class="auto-style4">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="65px" Width="173px"></asp:DropDownList></td>
                <td class="auto-style5">
 
                </td>
            </tr>

            <tr>
                <td class="auto-style9">You'll have a chance to review your order before it's placed.</td>
                <td class="auto-style3">
 
                </td>
            </tr>
                        <tr>
                <td class="auto-style9">

                </td>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" Text="Button" Width="76px" />
                </td>
            </tr>
        </table>

    </div>

</asp:Content>
