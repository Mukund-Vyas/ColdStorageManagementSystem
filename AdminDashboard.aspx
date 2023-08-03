    <%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ColdStorageManagementSystem.AdminDashboard" %>

<asp:Content ID="head" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6 col-lg-6 p-2" >
            <div class="m-2 p-2" style="background-color: white; text-align:left">
                <h5 class="font-weight-bold">My Storage</h5>
                <p class="font-weight-bold">
                    <asp:Label ID="storage" runat="server"></asp:Label>
                </p>
            </div>
        </div>
        <div class="col-md-6 col-lg-6 p-2">
            <div class="m-2 p-2" style="background-color: white; text-align:left;">
                <h5 class="font-weight-bold">My Employees</h5>
                <p class="font-weight-bold">
                    <asp:Label ID="employee" runat="server"></asp:Label>
                </p>
            </div>
        </div>
        <div class="col-md-6 col-lg-6 p-2">
            <div class="m-2 p-2" style="background-color: white; text-align:left;">
                <h5 class="font-weight-bold">Available Racks</h5>
                <p class="font-weight-bold">
                    <asp:Label ID="rack" runat="server"></asp:Label>
                </p>
            </div>
        </div>
        <div class="col-md-6 col-lg-6 p-2">
            <div class="m-2 p-2" style="background-color: white; text-align:left;">
                <h5 class="font-weight-bold">Total Quantity in Storage</h5>
                <p class="font-weight-bold">
                    <asp:Label ID="Quantity" runat="server"></asp:Label> &nbsp; Man
                </p>
            </div>
        </div>
    </div>
    <script>
        document.getElementById("dash").classList.add("active");
        document.getElementById("dash").href = "javascript:void(0)";
    </script>
</asp:Content>
