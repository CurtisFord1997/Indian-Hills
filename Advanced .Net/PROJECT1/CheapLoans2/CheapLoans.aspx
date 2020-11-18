<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheapLoans.aspx.cs" Inherits="CheapLoans2.CheapLoans" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

table {
  background-color: transparent;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
  *,
  *:before,
  *:after {
    color: #000 !important;
    text-shadow: none !important;
    background: transparent !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
  }
  th {
  text-align: left;
}
td,
th {
  padding: 0;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        Grid of loan data<br />
        <asp:Button ID="btnHome" runat="server" OnClick="btnHome_Click" Text="Home" />
        <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CheapLoansConnectionString %>" SelectCommand="SELECT * FROM [Loan]"></asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="LoanNum" DataSourceID="SelectSource" Width="1052px">
            <Columns>
                <asp:BoundField DataField="LoanNum" HeaderText="LoanNum" InsertVisible="False" ReadOnly="True" SortExpression="LoanNum" />
                <asp:BoundField DataField="CustName" HeaderText="CustName" SortExpression="CustName" />
                <asp:BoundField DataField="LoanAmount" HeaderText="LoanAmount" SortExpression="LoanAmount" />
                <asp:BoundField DataField="AnnualIntRate" HeaderText="AnnualIntRate" SortExpression="AnnualIntRate" />
                <asp:BoundField DataField="NumPayments" HeaderText="NumPayments" SortExpression="NumPayments" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SelectSource" runat="server" ConnectionString="<%$ ConnectionStrings:CheapLoansConnectionString %>" SelectCommand="StoredSelect" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>
</html>
