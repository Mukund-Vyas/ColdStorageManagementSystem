<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="Outword.aspx.cs" Inherits="ColdStorageManagementSystem.Employee.Outword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        .tr {
            text-align: left;
        }

        .tright {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-10 col-sm-10 col-md-10 col-lg-10 col-xl-10">
                <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <h3>Outword Entry</h3>
                    </div>
                    <asp:PlaceHolder ID="message" runat="server"></asp:PlaceHolder>
                    <section runat="server" class="h-100 h-custom" id="bill">
                        <div class="container h-100">
                            <div class="row d-flex h-100">
                                <div class="col-lg-12 col-xl-12">
                                    <div class="card" style="border-color: #009cff !important; border: 3px solid; border-left: 0px; border-right: 0px;">
                                        <div class="card-body p-5">

                                            <p class="lead fw-bold mb-5 tr" style="color: #009cff;">Details</p>

                                            <div class="row">
                                                <div class="col mb-3 tr">
                                                    <p class="small text-muted mb-1">Date</p>
                                                    <p>
                                                        <asp:Label ID="date" runat="server" Text="Label"></asp:Label>
                                                    </p>
                                                </div>
                                                <div class="col mb-3 tr">
                                                    <p class="small text-muted mb-1">Inword Date</p>
                                                    <p>
                                                        <asp:Label ID="idate" runat="server" Text="Label"></asp:Label>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col mb-3 tr">
                                                    <p class="small text-muted mb-1">Customer Name</p>
                                                    <p>
                                                        <asp:Label ID="name" runat="server" Text="Label"></asp:Label>
                                                    </p>
                                                </div>
                                                <div class="col mb-3 tr">
                                                    <p class="small text-muted mb-1">Customer Mobile No.</p>
                                                    <p>
                                                        +91 
                                                        <asp:Label ID="mobile" runat="server" Text="Label"></asp:Label>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col mb-3 tr">
                                                    <p class="small text-muted mb-1">Rack Id</p>
                                                    <p>
                                                        <asp:Label ID="rid" runat="server" Text="Label"></asp:Label>
                                                    </p>
                                                </div>
                                                <div class="col mb-3 tr">
                                                    <p class="small text-muted mb-1">Inword Id</p>
                                                    <p>
                                                        <asp:Label ID="iid" runat="server" Text="Label"></asp:Label>
                                                    </p>
                                                </div>
                                            </div>

                                            <div style="background-color: #f2f2f2;">
                                                <table class="table table-striped table-borderless">
                                                    <thead class="text-white bg-primary w-100">
                                                        <tr>
                                                            <th scope="col">#</th>
                                                            <th scope="col">Product</th>
                                                            <th scope="col">Qty</th>
                                                            <th scope="col">Months</th>
                                                            <th scope="col">Rent</th>
                                                            <th scope="col">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">1</th>
                                                            <td class="tr">
                                                                <p>
                                                                    <asp:Label ID="product" runat="server" Text="Label"></asp:Label>
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <p>
                                                                    <asp:Label ID="qty" runat="server" Text="Label"></asp:Label>
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <p>
                                                                    <asp:Label ID="month" runat="server" Text="Label"></asp:Label>
                                                                </p>
                                                            </td>
                                                            <td class="tright">
                                                                <p>
                                                                    &#8377; 
                                                                    <asp:Label ID="rent" runat="server" Text="Label"></asp:Label>
                                                                </p>
                                                            </td>
                                                            <td class="tright">
                                                                <p>
                                                                    &#8377; 
                                                                    <asp:Label ID="amt" runat="server" Text="Label"></asp:Label>
                                                                </p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">2</th>
                                                            <td class="tr">Advance Payed Amount</td>
                                                            <td>-</td>
                                                            <td>-</td>
                                                            <td class="tright">-</td>
                                                            <td class="tright">
                                                                <p>
                                                                    &#8377; 
                                                                    <asp:Label ID="advance" runat="server" Text="Label"></asp:Label>
                                                                </p>
                                                            </td>
                                                        </tr>
                                                    </tbody>

                                                </table>
                                            </div>

                                            <div class="row my-4">
                                                <div class="col tright">
                                                    <p class="lead mb-0" style="color: #009cff;"><span class="fw-small">Total Payable Amount</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: 900;">&#8377; <asp:Label ID="total" runat="server" Text="Label"></asp:Label></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <p class="my-2 tr">
                        <a href="EmployeeDashboard.aspx" style="color: #009cff;">Back to List</a>
                    </p>
                    <div class="row">
                        <%--<div class="col">
                            <input type="submit" name="print" class="btn btn-primary py-3 w-75 mb-2" onclick="printbill()" value="Print" />
                        </div>--%>
                        <div class="col">
                            <asp:Button ID="ok_btn" type="submit" OnClick="ok_btn_Click" class="btn btn-primary py-3 w-75 mb-2" Text="Return" runat="server" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        function printbill() {
            window.print();
        }

        document.getElementById("dash").classList.add("active");
    </script>
</asp:Content>
