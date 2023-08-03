<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="ColdStorageManagementSystem.Employee.CustomerRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-6 col-sm-8 col-md-6 col-lg-6 col-xl-6">
                <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <h3>Customer Registration</h3>
                        </div>
                        <asp:PlaceHolder ID="message" runat="server"></asp:PlaceHolder>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="cname" runat="server" placeholder="name" required>
                            <label for="ename">Name</label>
                            <div class="invalid-feedback">
                                You have to enter your Name.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="mobile" pattern="[6-9]{1}[0-9]{9}" title="Enter Valid Mobile Number" runat="server" placeholder="9978605400" required>
                            <label for="mobile">Mobile No.</label>
                            <div class="invalid-feedback">
                                Please provide a valid Mobile No.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="mail" runat="server" placeholder="name@example.com" required>
                            <label for="mail">Email address</label>
                            <div class="invalid-feedback">
                                Please provide a valid Mobile No.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <textarea class="form-control" id="address" runat="server" placeholder="211,aarya hostel" rows="3" required></textarea>
                            <label for="address">Address</label>
                            <div class="invalid-feedback">
                                Please provide a valid Address.
                            </div>
                        </div>
                        <asp:Button ID="reg_btn" type="submit" OnClick="reg_btn_Click" class="btn btn-primary py-3 w-100 mb-2" Text="Register" runat="server" />
                    
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById("cust").classList.add("active");
        document.getElementById("cust").href = "javascript:void(0)";
    </script>
</asp:Content>
