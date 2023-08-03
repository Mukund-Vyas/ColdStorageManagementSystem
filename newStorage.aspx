<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="newStorage.aspx.cs" Inherits="ColdStorageManagementSystem.newStorage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-6 col-sm-8 col-md-6 col-lg-6 col-xl-6">
                <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                    <asp:PlaceHolder ID="message" runat="server"></asp:PlaceHolder>
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <h3>New Storage</h3>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" runat="server" class="form-control" id="sname" placeholder="name" required>
                        <label for="sname">Name</label>
                        <div class="invalid-feedback">
                            You have to enter your Storage Name.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" runat="server" class="form-control" id="floor" placeholder="5" required>
                        <label for="floor">Foolrs in Storage</label>
                        <div class="invalid-feedback">
                            Please provide a valid floor No.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" runat="server" class="form-control" id="racks" placeholder="name@example.com" required>
                        <label for="racks">Racks in Storage</label>
                        <div class="invalid-feedback">
                            Please provide a valid racks No.
                        </div>
                    </div>
                    <asp:Button ID="add_btn" type="submit" OnClick="add_btn_Click" class="btn btn-primary py-3 w-100 mb-2" Text="Add" runat="server" />

                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById("storage").classList.add("active");
        document.getElementById("storage").href = "javascript:void(0)";
    </script>
</asp:Content>
