<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="GetEmployee.aspx.cs" Inherits="ColdStorageManagementSystem.GetEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        table {
            width: 50%;
        }
        /*td, th{
            border: 1px solid #000000;
            border-collapse: collapse;
            padding-left: 5px;
            padding-right: 5px;
            padding-top: 1px;
            padding-bottom: 1px;
            color: #000;
        }
        th{
            background-color: #808080;
            color: #000;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contuiner-fluid txt">
        <div class="row">
            <div class="col-3 m-2">
                <asp:PlaceHolder ID="message" runat="server"></asp:PlaceHolder>
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <h3>Employee Registration</h3>
                </div>
                <form>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" runat="server" id="ename" placeholder="name" required>
                        <label for="ename">Name</label>
                        <div class="invalid-feedback">
                            You have to enter your Name.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" runat="server" id="mobile" maxlength="10" placeholder="9978605400" required>
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
                        <input type="text" class="form-control" pattern=".{4,}" title="Please Enter More then 1000" runat="server" id="salary" placeholder="9000" required>
                        <label for="salary">Salary</label>
                        <div class="invalid-feedback">
                            Please provide a valid Salary.
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" runat="server" id="uname" maxlength="20" pattern="[A-Za-z0-9_]{1,15}" title="Only letters (either case), numbers, and the underscore; no more than 15 characters." placeholder="MVyas" required>
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
                    <br />
                    <asp:Button type="button" ID="EditBtn" OnClick="EditBtn_Click" class="btn btn-primary" Text="Edit" runat="server" />
                    <asp:Button type="submit" ID="SaveBtn" OnClick="SaveBtn_Click" class="btn btn-primary" Text="Save" runat="server" />
                    <asp:Button type="button" ID="DeleteBtn" OnClick="DeleteBtn_Click" class="btn btn-primary" Text="Delete" runat="server" />
                </form>
            </div>
            <div class="col-8">
                <h3 class="py-2" style="text-align: left;">Item List</h3>
                <asp:GridView ID="EmployeeList" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="E_Id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="EmployeeList_RowDataBound">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="E_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="E_Id" />
                        <asp:BoundField DataField="E_name" HeaderText="Name" SortExpression="E_name" />
                        <asp:BoundField DataField="E_mo" HeaderText="Mobile No." SortExpression="E_mo" />
                        <asp:BoundField DataField="E_mail" HeaderText="E-mail" SortExpression="E_mail" />
                        <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                        <asp:BoundField DataField="U_name" HeaderText="User Name" SortExpression="U_name" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="Emp_gv" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CSMS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <script>
        function rem() {
            var inputs = document.getElementsByTagName('input');
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type.toLowerCase() === 'password') {
                    inputs[i].removeAttribute("required");
                }
            }
        }

        document.getElementById("emp").classList.add("active");
        document.getElementById("emp").href = "javascript:void(0)";
    </script>
</asp:Content>
