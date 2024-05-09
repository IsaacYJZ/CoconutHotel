<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage1.Master" AutoEventWireup="true" CodeBehind="review.aspx.cs" Inherits="CoconutHotel.review" %>
<asp:Content ID="Content3" ContentPlaceHolderID="titleContent" runat="server">
    Review
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="review.css" rel="stylesheet" />

    <form id="form1" runat="server">

        <section id="reviews">
            <div class="reviews-heading">
                <h2>Customers Feedback</h2>
            </div>
            <div class="reviews-box-container">
                <div class="reviews-box">
                    <div class="box-top">
                        <div class="profile">
                            <div class="profile-img">
                                <img src="image/user1.jpg" />
                            </div>
                            <div class="name-user">
                                <strong>Taylor Swiss</strong>
                                <span>@taylorswiss</span>
                            </div>
                        </div>
                        <div class="reviews">
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M5.025 20.775A.998.998 0 0 0 6 22a1 1 0 0 0 .555-.168L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082a1 1 0 0 0-.59-1.74l-5.701-.454l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.214 4.107l-1.491 6.452zM12 5.429l2.042 4.521l.588.047h.001l3.972.315l-3.271 2.944l-.001.002l-.463.416l.171.597v.003l1.253 4.385L12 15.798V5.429z" fill="currentColor" />
                            </svg>
                        </div>
                    </div>
                    <div class="client-comment">
                        <p>This is the best hotel I have ever been.</p>
                    </div>
                </div>

                <div class="reviews-box">
                    <div class="box-top">
                        <div class="profile">
                            <div class="profile-img">
                                <img src="image/user2.jpg" />
                            </div>
                            <div class="name-user">
                                <strong>Teahyung Kim</strong>
                                <span>@taehyungkim</span>
                            </div>
                        </div>
                        <div class="reviews">
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                        </div>
                    </div>
                    <div class="client-comment">
                        <p>Fantastic experience! The staff were incredibly welcoming and accommodating. The room was clean and spacious with breathtaking views. Will definitely be returning!</p>
                    </div>
                </div>

                <div class="reviews-box">
                    <div class="box-top">
                        <div class="profile">
                            <div class="profile-img">
                                <img src="image/user6.jpg" />
                            </div>
                            <div class="name-user">
                                <strong>Catherine</strong>
                                <span>@catherineworld</span>
                            </div>
                        </div>
                        <div class="reviews">
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                        </div>
                    </div>
                    <div class="client-comment">
                        <p>I came here on a tour with my friends. We all found the environment comfortable and the food delicious. It was the happiest trip we had ever had.</p>
                    </div>
                </div>

                <div class="reviews-box">
                    <div class="box-top">
                        <div class="profile">
                            <div class="profile-img">
                                <img src="image/user3.jpg" />
                            </div>
                            <div class="name-user">
                                <strong>Jokson Wong</strong>
                                <span>@jaksonwongstudio</span>
                            </div>
                        </div>
                        <div class="reviews">
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M5.025 20.775A.998.998 0 0 0 6 22a1 1 0 0 0 .555-.168L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082a1 1 0 0 0-.59-1.74l-5.701-.454l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.214 4.107l-1.491 6.452zM12 5.429l2.042 4.521l.588.047h.001l3.972.315l-3.271 2.944l-.001.002l-.463.416l.171.597v.003l1.253 4.385L12 15.798V5.429z" fill="currentColor" />
                            </svg>
                        </div>
                    </div>
                    <div class="client-comment">
                        <p>I came to this hotel on a business trip. The meeting room here allows me to get my work done.</p>
                    </div>
                </div>

                <div class="reviews-box">
                    <div class="box-top">
                        <div class="profile">
                            <div class="profile-img">
                                <img src="image/user4.jpg" />
                            </div>
                            <div class="name-user">
                                <strong>Shawn Ramsey</strong>
                                <span>@shwanramsey</span>
                            </div>
                        </div>
                        <div class="reviews">
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                        </div>
                    </div>
                    <div class="client-comment">
                        <p>I came to this hotel on a friend's wedding invitation. The hotel was very nice and the staff serviced me very well. I think anyone who gets married here will be very happy.</p>
                    </div>
                </div>

                <div class="reviews-box">
                    <div class="box-top">
                        <div class="profile">
                            <div class="profile-img">
                                <img src="image/user5.jpg" />
                            </div>
                            <div class="name-user">
                                <strong>Oliva</strong>
                                <span>@olivaweb</span>
                            </div>
                        </div>
                        <div class="reviews">
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                            <svg
                                width="1em"
                                height="1em"
                                viewBox="0 0 24 24">
                                <path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453l-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107l-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4l4.536-4.082c.297-.268.406-.686.278-1.065z" fill="currentColor" />
                            </svg>
                        </div>
                    </div>
                    <div class="client-comment">
                        <p>This is my first time in this hotel. The environment here is very fashionable and the scenery is beautiful. Every corner of this hotel is suitable for photos.</p>
                    </div>
                </div>
            </div>
        </section>

    </form>
</asp:Content>
