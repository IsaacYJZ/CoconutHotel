<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="CoconutHotel.contact" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContent" runat="server">
    Contact Us
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="contact.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <section class="contact">
            <div class="content">
                <h1>Contact Us</h1>
                <p>Email us with any question or inquiries call +061111303353. We would be happy to answer your question~</p>
            </div>
            <div class="container">
                <div class="contactInfo">
                    <div class="box">
                        <div class="icon">
                            <p>&#128205;</p>
                        </div>
                        <div class="text">
                            <h3>Address</h3>
                            <p>
                                99, Jalan CM Hashim,<br>
                                Tanjung Tokong,<br>
                                11200 Tanjung Bungah, Pulau Pinang
                            </p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="icon">
                            <p>&#128222;</p>
                        </div>
                        <div class="text">
                            <h3>Phone</h3>
                            <p>03-1800 8255</p>
                            <p>+0611-1130 3353 (24 hours)</p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="icon">
                            <p>&#128231;</p>
                        </div>
                        <div class="text">
                            <h3>Email</h3>
                            <p>coconuthotel@example.com</p>
                        </div>
                    </div>
                </div>
                <div class="contactForm">

                    <h2>Send Message</h2>
                    <div class="inputBox">
                        <asp:TextBox ID="contactName" runat="server" placeholder="First Name" required="required"></asp:TextBox>
                        <%--                        <asp:RequiredFieldValidator ID="nameValidator" runat="server" ErrorMessage="Name is required" ControlToValidate="contactName" SetFocusOnError="True">*</asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="inputBox">
                        <asp:TextBox ID="contactEmail" runat="server" placeholder="Email" required="required"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="rfvContactEmail" runat="server" ControlToValidate="contactEmail" ErrorMessage="Email is required" Text="*"></asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="inputBox">
                        <asp:TextBox ID="contactMessage" runat="server" TextMode="MultiLine" required="required"></asp:TextBox>
                        <%--                        <asp:RequiredFieldValidator ID="rfvContactMessage" runat="server" ControlToValidate="contactMessage" ErrorMessage="Message is required" Text="*"></asp:RequiredFieldValidator>--%>


                        <span>Type your Message...</span>
                    </div>
                    <div class="col-xs-12">
                        <asp:Button ID="contactSubmit" runat="server" Text="Send" CssClass="btn-lrg submit-btn" OnClick="btnSubmit_Click" />
                    </div>
                </div>


            </div>
        </section>
    </form>
</asp:Content>
