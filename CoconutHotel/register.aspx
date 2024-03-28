<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CoconutHotel.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="register.css" rel="stylesheet" />
    <title></title>
    <style>
        .error-message {
            color: red;
        }
    </style>
    <script type="text/javascript">
        function validateForm() {
            const nameInput = document.getElementById('txtName');
            const icNumberInput = document.getElementById('txtIc');
            const contactNumberInput = document.getElementById('txtPhoneNumber');
            const emailInput = document.getElementById('txtEmail');
            const passwordInput = document.getElementById('txtPassword');
            const confirmPasswordInput = document.getElementById('txtConfirmPassword');

            const namePattern = /^[A-Za-z]+$/;
            const icNumberPattern = /^\d{6}-\d{2}-\d{4}$/;
            const contactNumberPattern = /^\d{3}-\d{7,8}$/;
            const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            const passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/; // At least one digit, one lowercase, one uppercase, 8 characters
            const confirmPasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/; // Same pattern as password

            let isValid = true;

            if (!namePattern.test(nameInput.value)) {
                setErrorFor(nameInput, 'Name must contain only alphabets');
                isValid = false;
            } else {
                setSuccessFor(nameInput);
            }

            if (!icNumberPattern.test(icNumberInput.value)) {
                setErrorFor(icNumberInput, ' IC Number must be in the format: 030306-10-0120');
                isValid = false;
            } else {
                setSuccessFor(icNumberInput);
            }

            if (!contactNumberPattern.test(contactNumberInput.value)) {
                setErrorFor(contactNumberInput, 'Contact Number must be in the format: 014-3166444');
                isValid = false;
            } else {
                setSuccessFor(contactNumberInput);
            }

            if (!emailPattern.test(emailInput.value)) {
                setErrorFor(emailInput, 'Email must be in a valid format:abc123@gmail.com');
                isValid = false;
            } else {
                setSuccessFor(emailInput);
            }

            if (!passwordPattern.test(passwordInput.value)) {
                setErrorFor(passwordInput, 'Password must contain at least one digit, one lowercase letter, one uppercase letter, and be at least 8 characters long');
                isValid = false;
            } else {
                setSuccessFor(passwordInput);
            }

            if (passwordInput.value !== confirmPasswordInput.value) {
                setErrorFor(confirmPasswordInput, 'Passwords do not match');
                isValid = false;
            } else {
                setSuccessFor(confirmPasswordInput);
            }

            return isValid;
        }

        function setErrorFor(input, message) {
            const errorSpan = input.parentElement.querySelector('.error-message');
            errorSpan.innerText = message;
            input.classList.add('error');
        }

        function setSuccessFor(input) {
            const errorSpan = input.parentElement.querySelector('.error-message');
            errorSpan.innerText = '';
            input.classList.remove('error');
        }
    </script>
</head>
<body>

    <form id="form1" runat="server">
       <div class="register-container">
       <h2>Register</h2>
            <div class="form-group">
                <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName">Name:</asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required ClientIDMode="Static" ClientValidationFunction="validateForm"></asp:TextBox>
                <span class="error-message"></span>
            </div>
            <div class="form-group">
                <asp:Label ID="lblIc" runat="server" AssociatedControlID="txtIc">IC Number:</asp:Label>
                <asp:TextBox ID="txtIc" runat="server" CssClass="form-control" required ClientIDMode="Static" ClientValidationFunction="validateForm"></asp:TextBox>
                <span class="error-message"></span>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email:</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required ClientIDMode="Static" ClientValidationFunction="validateForm"></asp:TextBox>
                <span class="error-message"></span>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPhoneNumber" runat="server" AssociatedControlID="txtPhoneNumber">Phone Number:</asp:Label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" required ClientIDMode="Static" ClientValidationFunction="validateForm"></asp:TextBox>
                <span class="error-message"></span>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required ClientIDMode="Static" ClientValidationFunction="validateForm"></asp:TextBox>
                <span class="error-message"></span>
            </div>
            <div class="form-group">
                <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword">Confirm Password:</asp:Label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" required ClientIDMode="Static" ClientValidationFunction="validateForm"></asp:TextBox>
                <span class="error-message"></span>
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" OnClientClick="return validateForm();" />
    </form>
</body>
</html>
