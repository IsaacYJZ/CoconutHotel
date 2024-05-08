<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReport.aspx.cs" Inherits="CoconutHotel.AdminReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContent" runat="server">
    Admin Report
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

    <div class="container mt-6">
        <div class="mb-4 d-flex justify-content-between align-items-center">
            <div class="position-relative">            
                <span>Filters <i class="fa fa-angle-down"></i></span>
                <i class="fa fa-ellipsis-h ms-3"></i>
                <span class="position-absolute search-icon"><i class="fa fa-search"></i></span>
                <input class="form-control" placeholder="Search..." id="searchInput">
                <select class="form-select mt-2" id="searchCriteria">
                    <option value="Name">Name</option>
                    <option value="Year">Year</option>
                    <option value="Month">Month</option>
                    <option value="Day">Day</option>
                    <option value="PaymentMethod">Payment Method</option>
                </select>
            </div>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="gridViewReport" runat="server" CssClass="table table-hover table-bordered small-font" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="userName" HeaderText="Name" />
                    <asp:BoundField DataField="paymentDate" HeaderText="Date" />
                    <asp:BoundField DataField="roomName" HeaderText="Room" />
                    <asp:BoundField DataField="paymentMethod" HeaderText="Payment" />
                    <asp:BoundField DataField="roomPrice" HeaderText="Price" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

<script>
    // JavaScript function to handle search
    function search() {
        var searchInput = document.getElementById('searchInput').value;
        var searchCriteria = document.getElementById('searchCriteria').value;

        // Call server-side method to bind filtered data
        PageMethods.SearchData(searchCriteria, searchInput, OnSuccess, OnFailure);
    }

    // Callback function for successful search
    function OnSuccess(result) {
        // Clear the GridView before updating with the filtered data
        document.getElementById('<%= gridViewReport.ClientID %>').innerHTML = "";

    // Update the GridView with the filtered data
        document.getElementById('<%= gridViewReport.ClientID %>').innerHTML = result;
    }


    // Callback function for failed search
    function OnFailure(error) {
        console.log(error);
    }

    // Add event listeners for search input and criteria
    document.getElementById('searchInput').addEventListener('input', search);
    document.getElementById('searchCriteria').addEventListener('change', search);
</script>

</asp:Content>
