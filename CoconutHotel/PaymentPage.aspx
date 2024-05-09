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
                <h3>Payment Summary</h3>

                <asp:GridView ID="GridViewPayment" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-bordered table-striped" DataSourceID="SqlDataSource2"
                    ShowFooter="True" OnRowDataBound="GridViewPayment_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="roomName" HeaderText="Room Name" />
                        <asp:BoundField DataField="roomType" HeaderText="Room Type" />
                        <asp:ImageField DataImageUrlField="RoomImage" HeaderText="Room Image"
                            ControlStyle-Width="100px" ControlStyle-Height="75px" />
                        <asp:BoundField DataField="Days" HeaderText="Days" />
                        <asp:BoundField DataField="PricePerDay" HeaderText="Price per Day" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total Room Price" DataFormatString="{0:C}" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="
                    SELECT 
                        B.bookingID,
                        B.userID,
                        RT.roomName,
                        R.roomType,
                        R.roomImg AS [RoomImage],
                        DATEDIFF(DAY, B.checkInDate, B.checkOutDate) AS Days,
                        CAST(R.roomPrice AS DECIMAL(10, 2)) AS PricePerDay,
                        (CAST(R.roomPrice AS DECIMAL(10, 2)) * DATEDIFF(DAY, B.checkInDate, B.checkOutDate)) AS TotalPrice
                    FROM 
                        BookingRoom BR
                        JOIN Booking B ON BR.bookingID = B.bookingID
                        JOIN Room R ON BR.roomID = R.roomID
                        JOIN RoomType RT ON BR.roomType = RT.roomType
                    WHERE 
                        B.bookingID = @BookingID">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="BookingID" QueryStringField="bookingID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            
            <div class="payment-container">
                <h3 class=" payment-method ">Payment Information </h3>

                <table>
                    <tbody>
                        <tr>
                            <td>
                                <p>Account Name:</p>
                            </td>
                            <td>
                                <asp:Label ID="lblAccount" runat="server" CssClass="inline"></asp:Label></td>
                        </tr>

                        <tr>
                            <td>
                                <p>Account Id:</p>
                            </td>
                            <td>
                                <asp:Label ID="lblAccountID" runat="server" CssClass="inline" OnDisposed="Page_Load"></asp:Label></td>
                        </tr>

                        <tr>
                            <td>
                                <p>Payment Id :</p>
                            </td>
                            <td>
                                <asp:Label ID="lblPaymentID" runat="server">123456789</asp:Label></td>
                        </tr>

                        <tr>
                            <td>
                                <p>Booking Id :</p>
                            </td>
                            <td>
                                <asp:Label ID="lblBookingID" runat="server">123456789</asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <p>Date:</p>
                            </td>
                            <td>
                                <asp:Label ID="lblDate" runat="server">12/12/2024</asp:Label></td>
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
                                <asp:Button ID="btnProceed" runat="server" Text="Proceed" OnClick="btnProceed_Click" OnClientClick="return confirmProceed();" Visible="false"/> 
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <br />

                <asp:Table ID="CreditDebitCardTable" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">Credit Card Type:</asp:TableCell>
                        <asp:TableCell class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Choose a card type" ControlToValidate="RadioButtonList1" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="16px" Width="156px" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                                <asp:ListItem Value="VISA">VISA</asp:ListItem>
                                <asp:ListItem Value="Master">Master</asp:ListItem>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">Name on Card:</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name on card is required" ControlToValidate="txtCCName" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCCName" CssClass="error" Display="Dynamic" ErrorMessage="Name should be alphabet only" ValidationExpression="^[A-Za-z ]+$">*</asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtCCName" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">Card Number:</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Card number is required" ControlToValidate="txtCCNumber" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtCCNumber" CssClass="error" ErrorMessage="Invalid card number format VISA(10), Master(12)" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
                            <asp:TextBox ID="txtCCNumber" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">Valid Through:</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Valid through is required" ControlToValidate="txtCCVT" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCCVT" CssClass="error" Display="Dynamic" ErrorMessage="Invalid format (MM/YY)" ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$">*</asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtCCVT" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">CVV:</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="CVV is required" ControlToValidate="txtCVV" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCVV" CssClass="error" Display="Dynamic" ErrorMessage="CVV must be 3 digits" ValidationExpression="^\d{3}$">*</asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtCVV" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">&nbsp;</asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnCCSubmit" runat="server" Text="Pay Now" OnClick="btnPayNow_Click" />
                            &nbsp;&nbsp;
            <asp:Button ID="btnCCClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell class="auto-style3">&nbsp;</asp:TableCell>
                        <asp:TableCell>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" HeaderText="Below are the errors:" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table ID="QRTable" runat="server" visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                             <asp:Image ID="imgQRCode" runat="server"/>
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
