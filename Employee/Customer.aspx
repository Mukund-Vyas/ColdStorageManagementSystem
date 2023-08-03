<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="ColdStorageManagementSystem.Employee.Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contuiner-fluid txt">
        <div class="row">
            <div class="col">
                <h3 class="py-2" style="text-align: left;">Customer List</h3>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="Cust_Id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Cust_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Cust_Id" />
                        <asp:BoundField DataField="Cust_name" HeaderText="Customer Name" SortExpression="Cust_name" />
                        <asp:BoundField DataField="Cust_mo" HeaderText="Customer Mobile No." SortExpression="Cust_mo" />
                        <asp:BoundField DataField="Cust_mail" HeaderText="Customer E-Mail" SortExpression="Cust_mail" />
                        <asp:BoundField DataField="Cust_address" HeaderText="Customer Address" SortExpression="Cust_address" />
                        <asp:CommandField ControlStyle-CssClass="btn btn-outline-primary" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CSMS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Customer]" DeleteCommand="DELETE FROM [Customer] WHERE Cust_Id= @Cust_Id" UpdateCommand="UPDATE [Customer] SET Cust_name = @Cust_name, Cust_mo = @Cust_mo, Cust_mail = @Cust_mail, Cust_address = @Cust_address WHERE Cust_Id = @Cust_Id"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("cust").classList.add("active");
        document.getElementById("cust").href = "javascript:void(0)";
    </script>
</asp:Content>
