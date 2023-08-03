<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="Racks.aspx.cs" Inherits="ColdStorageManagementSystem.Employee.Racks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contuiner-fluid txt">
        <div class="row">
            <div class="col-3 m-2">
                <asp:PlaceHolder ID="message" runat="server"></asp:PlaceHolder>
                <h2 class="pb-2">Manage Items</h2>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" runat="server" id="rid" placeholder="name" required>
                        <label for="iname">Rack Id</label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" runat="server" id="floor" placeholder="name" required>
                        <label for="iname">Floor No</label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" runat="server" id="capacity" placeholder="name" required>
                        <label for="iname">Capacity <sub>in man(20 kg)</sub></label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" min="10" runat="server" id="rent" placeholder="name" required>
                        <label for="iname">Rent <sub>in &#8377;/Month</sub></label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" runat="server" id="dimension" placeholder="name" required>
                        <label for="iname">Dimension <sub>in feet</sub></label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" runat="server" id="product" placeholder="name" required>
                        <label for="iname">For Product</label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <br />
                    <asp:Button type="submit" ID="EditBtn" OnClick="EditBtn_Click" class="btn btn-primary" Text="Edit" runat="server" />
                    <asp:Button type="submit" ID="SaveBtn" OnClick="SaveBtn_Click" class="btn btn-primary" Text="Save" runat="server" />
                    <asp:Button type="submit" ID="DeleteBtn" class="btn btn-primary" Text="Delete" runat="server" />
            </div>
            <div class="col-8">
                <h3 class="py-2" style="text-align: left;">Racks List</h3>
                <asp:GridView ID="rack_list" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" OnSelectedIndexChanged="rack_list_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-outline-primary"/>
                        <asp:BoundField DataField="R_Id" HeaderText="Rack Id" SortExpression="R_Id" />
                        <asp:BoundField DataField="Floor_no" HeaderText="Floor No" SortExpression="Floor_no" />
                        <asp:BoundField DataField="Capacity" HeaderText="Capacity" SortExpression="Capacity" />
                        <asp:BoundField DataField="Rent" HeaderText="Rent" SortExpression="Rent" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="Dimention" HeaderText="Dimension" SortExpression="Dimention" />
                        <asp:BoundField DataField="Product" HeaderText="Product" SortExpression="Product" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CSMS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [R_Id], [Floor_no], [Capacity], [Rent], [Status], [Dimention], [Product] FROM [Racks]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
    <script>
        document.getElementById("rack").classList.add("active");
        document.getElementById("rack").href = "javascript:void(0)";

        var th = document.getElementsByTagName("th");
        for (i = 0, len = th.length; i < len ; i++) {
            th[i].style.color = "#000";
        }
    </script>
</asp:Content>
