<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="CoconutHotel.AdminHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="Css/UserProfileAdmin.css" rel="stylesheet" />
<link href="Css/AdminHomePage.css" rel="stylesheet" />

<div class="container">
	<h2>Dashboard</h2>
    <div class="row">
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Orders Received</h6>
                    <h2 class="text-right"><i class="fa fa-cart-plus f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Orders Received</h6>
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-yellow order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Orders Received</h6>
                    <h2 class="text-right"><i class="fa fa-refresh f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-pink order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Orders Received</h6>
                    <h2 class="text-right"><i class="fa fa-credit-card f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
	</div>
</div>

	
<div class="container">
<div class="row">
	<div class="col-md-8">
				<h2>User Profile</h2>
		<div class="main-box clearfix">
			<div class="table-responsive">
				<table class="table user-list">
					<thead>
						<tr>
							<th><span>User</span></th>
							<th><span>Created</span></th>
							<th class="text-center"><span>Status</span></th>
							<th><span>Email</span></th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody> 
						<tr>
                            <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
                                    <asp:LinkButton ID="ViewUserProfileButton" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    </td>
                                </tr>
                        			<tr>
                            <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    </td>
                                </tr>
                        		<tr>
                            <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    </td>
                                </tr>
                        		<tr>
                            <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
                                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    </td>
                                </tr>
                        		<tr>
                            <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    </td>
                                </tr>
                        		<tr>
                            <td>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                        <a href="#" class="user-link">Mila Kunis</a>
                                        <span class="user-subhead">Admin</span>
                                    </td>
                                    <td>
                                        2013/08/08
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">Inactive</span>
                                    </td>
                                    <td>
                                        <a href="#">mila@kunis.com</a>
                                    </td>
                                    <td style="width: 20%;">
                                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="table-link" OnClick="ViewUserProfileButton_Click">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                    </td>
                                </tr>
					</tbody>
				</table>
			</div>
		</div>
		</div>
			<div class="col-md-4">
            <div class="top-sales box">
                <div class="title">Top Selling Product</div>
                <ul class="top-sales-details">
                    <li>
                        <a href="#">
                            <img weight="50" height="100" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" >
                            <span class="product">Vuitton Sunglasses</span>
                        </a>
                        <span class="price">$1107</span>
                    </li>
					                    <li>
                        <a href="#">
                            <img weight="50" height="100" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
                            <span class="product">Vuitton Sunglasses</span>
                        </a>
                        <span class="price">$1107</span>
                    </li>
					                    <li>
                        <a href="#">
                            <img weight="50" height="100" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
                            <span class="product">Vuitton Sunglasses</span>
                        </a>
                        <span class="price">$1107</span>
                    </li>
					                    <li>
                        <a href="#">
                            <img weight="50" height="100" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
                            <span class="product">Vuitton Sunglasses</span>
                        </a>
                        <span class="price">$1107</span>
                    </li>
					                    <li>
                        <a href="#">
                            <img weight="50" height="100" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
                            <span class="product">Vuitton Sunglasses</span>
                        </a>
                        <span class="price">$1107</span>
                    </li>
                    <!-- Add more list items for other products -->
                </ul>
            </div>
        </div>
</div>
    </div>
        

</asp:Content>


