<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReport.aspx.cs" Inherits="CoconutHotel.AdminReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Admin Report
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="userName">User Name:</label>
                                <asp:TextBox ID="userName" CssClass="form-control" runat="server" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="roomType">Room Type:</label>
                                <asp:DropDownList ID="roomType" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="All" Value="" />
                                    <asp:ListItem Text="Standard" Value="Standard" />
                                    <asp:ListItem Text="Luxury" Value="Luxury" />
                                    <asp:ListItem Text="Junior" Value="Junior" />
                                    <asp:ListItem Text="Executive" Value="Executive" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="paymentType">Payment Type:</label>
                                <asp:DropDownList ID="paymentType" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="All" Value="" />
                                    <asp:ListItem Text="Credit/Debit Card" Value="Credit/Debit Card" />
                                    <asp:ListItem Text="Cash" Value="Cash" />
                                    <asp:ListItem Text="E wallet" Value="E wallet" />   
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-12">
                                <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" CssClass="btn btn-primary btn-block" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

        <asp:Label ID="lblMessage" runat="server" Visible="false" Text="No Reports found." CssClass="text-danger"></asp:Label>

        <div class="table-responsive">
            <asp:GridView ID="gridViewReport" runat="server" CssClass="table table-hover table-bordered small-font" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="userName" HeaderText="Name" />
                    <asp:BoundField DataField="paymentDate" HeaderText="Date" />
                    <asp:BoundField DataField="day" HeaderText="Day" />
                    <asp:BoundField DataField="roomName" HeaderText="Room Name" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="roomImg" runat="server" ImageUrl='<%# Eval("roomImg") %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="paymentMethod" HeaderText="Payment Method" />
                    <asp:BoundField DataField="totalPayment" HeaderText="Total Payment" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
