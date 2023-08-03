<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="ColdStorageManagementSystem.Items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contuiner-fluid txt">
        <div class="row">
            <div class="col-3 m-2">
                <asp:PlaceHolder ID="message" runat="server"></asp:PlaceHolder>
                <h2 class="pb-2">Manage Items</h2>
                <form>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" runat="server" id="iname" placeholder="name" required>
                        <label for="iname">Item Name</label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" runat="server" id="rent" placeholder="name" required>
                        <label for="iname">Rent per Month</label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <br />
                    <asp:Button type="submit" ID="EditBtn" OnClick="EditBtn_Click" class="btn btn-primary" Text="Edit" runat="server" />
                    <asp:Button type="submit" ID="SaveBtn" OnClick="SaveBtn_Click" class="btn btn-primary" Text="Save" runat="server" />
                    <asp:Button type="submit" ID="DeleteBtn" OnClick="DeleteBtn_Click" class="btn btn-primary" Text="Delete" runat="server" />
                </form>
            </div>
            <div class="col-8">
                <h3 class="py-2" style="text-align: left;">Item List</h3>
                <asp:GridView ID="ItemsList" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" OnSelectedIndexChanged="ItemsList_SelectedIndexChanged" DataKeyNames="I_Id">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="I_Id" HeaderText="Id" SortExpression="I_Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="I_name" HeaderText="Item Name" SortExpression="I_name" />
                        <asp:BoundField DataField="Rent" HeaderText="Rent/Month" SortExpression="Rent" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="Items_gv" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CSMS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Items]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
