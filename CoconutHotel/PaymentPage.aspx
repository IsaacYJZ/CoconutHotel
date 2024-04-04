<%@ Page Title="" Language="C#" MasterPageFile="~/Payment.Master" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="CoconutHotel.PaymentPage" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContent" runat="server">
    Payment
</asp:Content>
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



    <form id="form1" runat="server">

        <link href="Payment.css" rel="stylesheet" type="text/css" />

        <h1 class="payment-header">Payment Page</h1>
        <div class="parent-container">
            <div class="payment-detail-container">
                <h3>Payment Summary </h3>
                <table>
                    <thead>
                        <tr>
                            <th>Room-Image</th>
                            <th>Theme</th>
                            <th>Booked-days</th>
                            <th>Price</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                <asp:Image ID="HotelImage" runat="server" CssClass="inline" ImageUrl="Images/hotel room.jpg" AlternateText="Example image" /></td>
                            <td>
                                <asp:Label ID="lblProductName" runat="server" CssClass="product-name">sea theme twin room</asp:Label></td>
                            <td>
                                <asp:Label ID="lblDays" runat="server" CssClass="">3</asp:Label></td>
                            <td>
                                <asp:Label ID="lblPrice" runat="server" CssClass="product-price">RM123</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="HotelImage2" runat="server" CssClass="inline" ImageUrl="Images/hotel room.jpg" AlternateText="Example2 image" /></td>
                            <td>
                                <asp:Label ID="lblProductName2" runat="server" CssClass="product-name2">sea theme twin room</asp:Label></td>
                            <td>
                                <asp:Label ID="Label2" runat="server" CssClass="">3</asp:Label></td>
                            <td>
                                <asp:Label ID="lblPricel2" runat="server" CssClass="product-price2">RM123</asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" CssClass="inline" ImageUrl="Images/hotel room.jpg" AlternateText="Example2 image" /></td>
                            <td>
                                <asp:Label ID="Label1" runat="server" CssClass="product-name2">sea theme twin room</asp:Label></td>
                            <td>
                                <asp:Label ID="Label3" runat="server" CssClass="">3</asp:Label></td>
                            <td>
                                <asp:Label ID="Label4" runat="server" CssClass="product-price2">RM123</asp:Label>
                            </td>
                        </tr>
                    </tbody>

                    <tfoot>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <p class="total-text">Total :</p>
                            </td>
                            <td>
                                <asp:Label ID="lblTotal" runat="server" CssClass="total-price">RM123</asp:Label></td>
                        </tr>
                    </tfoot>
                </table>
                <br />
            </div>

            <div class="payment-container">
                <h3 class=" payment-method ">Payment Method </h3>

                <table>
                    <tbody>
                        <tr>
                            <td>
                                <p>Account Name:</p>
                            </td>
                            <td>
                                <asp:Label ID="lblAccount" runat="server" CssClass="inline">ALI</asp:Label></td>
                        </tr>

                        <tr>
                            <td>
                                <p>Account Id:</p>
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" CssClass="inline" OnDisposed="Page_Load">123456676</asp:Label></td>
                        </tr>

                        <tr>
                            <td>
                                <p>Payment Id :</p>
                            </td>
                            <td>
                                <asp:Label ID="Label11" runat="server">123456789</asp:Label></td>
                        </tr>

                        <tr>
                            <td>
                                <p>Booking Id :</p>
                            </td>
                            <td>
                                <asp:Label ID="Label7" runat="server">123456789</asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <p>Date:</p>
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server">12/12/2024</asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <p>Method :</p>
                            </td>

                            <td>
                                <asp:DropDownList ID="ddlMethod" runat="server" OnSelectedIndexChanged="ddlMethod_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Text="Select A Method" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem>Cash</asp:ListItem>
                                    <asp:ListItem>Credit/Debit Card</asp:ListItem>
                                    <asp:ListItem>E wallet</asp:ListItem>
                                </asp:DropDownList>
                            </td>

                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnProceed" runat="server" Text="Proceed" OnClick="btnProceed_Click" Visible="false" OnClientClick = "return confirmProceed();"/>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <br />

                <asp:Table ID="CreditDebitCardTable" runat="server" visible="false">
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">Credit Card Type :</asp:TableCell>
                        <asp:TableCell class="auto-style1">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Visa</asp:ListItem>
                                <asp:ListItem>Master</asp:ListItem>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">Name on Card :</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtCCName" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">Card Number :</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtCCNumber" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">Valid Through :</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtCCVT" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">CVV :</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtCCCVV" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">&nbsp;</asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCCSubmit" runat="server" Text="Pay Now" OnClick="btnPayNow_Click"/>
                            &nbsp;&nbsp;
                            <asp:Button ID="btnCCClear" runat="server" Text="Clear" OnClick="btnClear_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table ID="QRTable" runat="server" visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                             <asp:Image ID="qrImage" runat="server" ImageUrl="Images/qrcode.png" AlternateText="QR image"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <p>Scan the above QRCode for payment </p>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
               

            </div>
        </div>
    </form>

    <script type="text/javascript">
        function confirmProceed() {
            return confirm('Please visit the front desk for comfirmation');
        }
    </script>

</asp:Content>
