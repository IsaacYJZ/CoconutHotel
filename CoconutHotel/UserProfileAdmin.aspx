<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserProfileAdmin.aspx.cs" Inherits="CoconutHotel.UserProfileAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="Css/UserProfileAdmin.css" rel="stylesheet" />

<h1>UserProfile</h1>

<div class="container">
<div class="row">
	<div class="col-lg-12">
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
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">
								<a href="#" class="user-link">George Clooney</a>
								<span class="user-subhead">Member</span>
							</td>
							<td>
								2013/08/12
							</td>
							<td class="text-center">
								<span class="label label-success">Active</span>
							</td>
							<td>
								<a href="#">marlon@brando.com</a>
							</td>
							<td style="width: 20%;">
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
								<a href="#" class="user-link">Ryan Gossling</a>
								<span class="user-subhead">Registered</span>
							</td>
							<td>
								2013/03/03
							</td>
							<td class="text-center">
								<span class="label label-danger">Banned</span>
							</td>
							<td>
								<a href="#">jack@nicholson</a>
							</td>
							<td style="width: 20%;">
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
								<a href="#" class="user-link">Emma Watson</a>
								<span class="user-subhead">Registered</span>
							</td>
							<td>
								2004/01/24
							</td>
							<td class="text-center">
								<span class="label label-warning">Pending</span>
							</td>
							<td>
								<a href="#">humphrey@bogart.com</a>
							</td>
							<td style="width: 20%;">
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="">
								<a href="#" class="user-link">Robert Downey Jr.</a>
								<span class="user-subhead">Admin</span>
							</td>
							<td>
								2013/12/31
							</td>
							<td class="text-center">
								<span class="label label-success">Active</span>
							</td>
							<td>
								<a href="#">spencer@tracy</a>
							</td>
							<td style="width: 20%;">
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
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
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="">
								<a href="#" class="user-link">George Clooney</a>
								<span class="user-subhead">Member</span>
							</td>
							<td>
								2013/08/12
							</td>
							<td class="text-center">
								<span class="label label-success">Active</span>
							</td>
							<td>
								<a href="#">marlon@brando.com</a>
							</td>
							<td style="width: 20%;">
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
								<a href="#" class="user-link">Ryan Gossling</a>
								<span class="user-subhead">Registered</span>
							</td>
							<td>
								2013/03/03
							</td>
							<td class="text-center">
								<span class="label label-danger">Banned</span>
							</td>
							<td>
								<a href="#">jack@nicholson</a>
							</td>
							<td style="width: 20%;">
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
								<a href="#" class="user-link">Emma Watson</a>
								<span class="user-subhead">Registered</span>
							</td>
							<td>
								2004/01/24
							</td>
							<td class="text-center">
								<span class="label label-warning">Pending</span>
							</td>
							<td>
								<a href="#">humphrey@bogart.com</a>
							</td>
							<td style="width: 20%;">
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
								<a href="#" class="user-link">Robert Downey Jr.</a>
								<span class="user-subhead">Admin</span>
							</td>
							<td>
								2013/12/31
							</td>
							<td class="text-center">
								<span class="label label-success">Active</span>
							</td>
							<td>
								<a href="#">spencer@tracy</a>
							</td>
							<td style="width: 20%;">
								<a href="#" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="confirmDelete()">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				   <!-- Edit form -->
                    <div id="editForm" class="edit-form">
                        <h2>Edit User Profile</h2>
                        <form id="editProfileForm">
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" value="Mila Kunis">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" value="mila@kunis.com">
                            <button type="submit">Save Changes</button>
                        </form>
                    </div>
                    <!-- End of edit form -->
			</div>
			<ul class="pagination pull-right">
				<li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
			</ul>
		</div>
	</div>
</div>
</div>
	<script>
        // Function to show edit form
        function showEditForm() {
            document.getElementById('editForm').style.display = 'block';
        }

        // Function to hide edit form
        function hideEditForm() {
            document.getElementById('editForm').style.display = 'none';
        }

        // Attach event listener to the edit button
        document.querySelectorAll('.fa.fa-pencil').forEach(function (editIcon) {
            editIcon.addEventListener('click', function (event) {
                // Prevent the default link behavior
                event.preventDefault();
                // Show the edit form
                showEditForm();
            });
        });

        // Attach event listener to the form submit button
        document.getElementById('editProfileForm').addEventListener('submit', function (event) {
            // Prevent the form from submitting
            event.preventDefault();
            // Perform form submission handling (e.g., save changes)
            // For demonstration purposes, let's just hide the edit form
            hideEditForm();
        });

        function confirmDelete() {
            if (confirm("Are you sure you want to delete this user?")) {
                window.location.href = "#"; // Replace with your delete page URL
            }
        }
    </script>
</asp:Content>


