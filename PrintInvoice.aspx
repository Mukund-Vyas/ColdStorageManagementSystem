<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintInvoice.aspx.cs" Inherits="ColdStorageManagementSystem.PrintInvoice" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Cold Storage Managemnt System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>

<body>
    <form method="post" runat="server">
        <div class="container-fluid pt-4 px-4">
            <div class="row bg-light rounded mx-0" style="min-height: 100vh;">
                <div class="col-12 my-3 text-center">
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
                                                <div class="col" align="right">
                                                    <p class="lead mb-0" style="color: #009cff;"><span class="fw-small">Total Payable Amount</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: 900;">&#8377;
                                                        <asp:Label ID="total" runat="server" Text="Label"></asp:Label></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </form>
    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

    <%-- Form Validation Bootstrap --%>

    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        window.print();
        location.href = "Outword.aspx";
    </script>
</body>

</html>
