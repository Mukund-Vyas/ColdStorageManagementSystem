<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InwordReport.aspx.cs" Inherits="ColdStorageManagementSystem.InwordReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row m-4">
                <div class="col-1"></div>
                <div class="col-4">
                    <label for="from">From Date</label>
                    <input type="date" class="form-control" name="from"  runat="server" id ="from" onchange="chng()"/>
                </div>
                <div class="col-4">
                    <label for="to">To Date</label>
                    <input type="date" class="form-control" name="to" runat="server" id ="to"/>
                </div>
                <div class="col-2">
                    <label for="to">&nbsp;</label>
                    <asp:Button ID="search_btn" runat="server" Text="Search" OnClick="search_btn_Click"  CssClass="btn btn-primary w-100"/>
                </div>
            </div>
        </div>
        <div class="container-fluid">

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="1400px">
                <LocalReport ReportPath="Inwords.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CSMS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="ColdStorageManagementSystem.CSMSDataSetTableAdapters.Inword_custTableAdapter"></asp:ObjectDataSource>

        </div>
    </form>
    <script>
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();

        if (dd < 10) {
            dd = '0' + dd;
        }

        if (mm < 10) {
            mm = '0' + mm;
        }

        today = yyyy + '-' + mm + '-' + dd;
        document.getElementById("from").setAttribute("max", today);
        document.getElementById("to").setAttribute("max", today);

        function chng() {
            document.getElementById("to").value = "";
            var date = document.getElementById("from").value;
            document.getElementById("to").setAttribute("min", date);
        }
    </script>
</body>
</html>
