<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="Inword.aspx.cs" Inherits="ColdStorageManagementSystem.Employee.Inword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:Label ID="check" runat="server" Text="Label"></asp:Label>--%>

    <div class="container-fluid">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-6 col-sm-8 col-md-6 col-lg-6 col-xl-6">
                <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <h3>Inword Entry</h3>
                    </div>
                    <asp:PlaceHolder ID="message" runat="server"></asp:PlaceHolder>
                    <div class="form-floating mb-3">
                        <asp:TextBox ID="Mo_no" CssClass="form-control" runat="server" TextMode="Phone" placeholder="9978605400" OnTextChanged="Mo_no_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <label for="mobile">Custemer Mobile No.</label>
                        <div class="invalid-feedback">
                            Please provide a valid Mobile No.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <asp:DropDownList ID="CustName" CssClass="form-control" runat="server" ClientIDMode="Predictable" Enabled="False"></asp:DropDownList>
                        <label for="CustName">Customer Name</label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="advance" min="0" runat="server" placeholder="122" required>
                        <label for="advance">Advace Payed Amount<sub>in Rupees</sub></label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="quantity" min="0" runat="server" placeholder="122" required>
                        <label for="quantity">Total Quantity to store <sub>in Man(20 kg)</sub></label>
                    </div>
                    <asp:Button ID="ok_btn" type="submit" OnClick="ok_btn_Click" class="btn btn-primary py-3 w-100 mb-2" Text="Ok" runat="server" />

                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("dash").classList.add("active");
    </script>
</asp:Content>
