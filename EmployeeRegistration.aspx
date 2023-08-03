<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeRegistration.aspx.cs" Inherits="ColdStorageManagementSystem.EmployeeRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-6 col-sm-8 col-md-6 col-lg-6 col-xl-6">
                <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                    <asp:PlaceHolder ID="message" runat="server"></asp:PlaceHolder>
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <h3>Employee Registration</h3>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" runat="server" id="ename" placeholder="name" required>
                            <label for="ename">Name</label>
                            <div class="invalid-feedback">
                                You have to enter your Name.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" runat="server" id="mobile" placeholder="9978605400" required>
                            <label for="mobile">Mobile No.</label>
                            <div class="invalid-feedback">
                                Please provide a valid Mobile No.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" runat="server" id="email" placeholder="name@example.com" required>
                            <label for="email">Email address</label>
                            <div class="invalid-feedback">
                                Please provide a valid Mobile No.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" runat="server" id="salary" placeholder="9000" required>
                            <label for="salary">Salary</label>
                            <div class="invalid-feedback">
                                Please provide a valid Salary.
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" runat="server" id="uname" placeholder="MVyas" required>
                            <label for="uname">Username</label>
                            <div class="invalid-feedback">
                                Please provide a valid User Name.
                            </div>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" runat="server" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" id="pwd" placeholder="Password" required>
                            <label for="pwd">Password</label>
                            <div class="invalid-feedback">
                                Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters.
                            </div>
                        </div>
                        <asp:Button ID="reg_btn" type="submit" class="btn btn-primary py-3 w-100 mb-2" OnClick="reg_btn_Click" Text="Register" runat="server" />
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Sign Up End -->
</asp:Content>
