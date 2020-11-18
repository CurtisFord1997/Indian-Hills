<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CheapLoans2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 id="Prompt" aria-atomic="True">Cheap Loans</h1>
        <p class="lead" id="promptt">Enter data in the respective boxes to add it to the database, all data is required.</p>
        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        <div style="width: 514px; height: 303px; float: left;">
            <asp:Label ID="Label1" runat="server" Text="Customer Name"></asp:Label>
            <br />
            <asp:TextBox ID="txtCustName" runat="server" ValidateRequestMode="Enabled"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="txtCustName" errormessage="Enter Name!" ForeColor="#CC0000" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Loan Amount"></asp:Label>
            <br />
            <asp:TextBox ID="txtAmt" runat="server" ValidateRequestMode="Enabled"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtAmt" errormessage="Enter Amount!" ForeColor="#CC3300" />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Annual Interest Rate"></asp:Label>
            <br />
            <asp:TextBox ID="txtIntRate" runat="server" ValidateRequestMode="Enabled"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtIntRate" errormessage="Enter Rate!" ForeColor="#CC0000" />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Number of Payments"></asp:Label>
            <br />
            <asp:TextBox ID="txtNumPmts" runat="server" ValidateRequestMode="Enabled"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="txtNumPmts" errormessage="Enter Number of Payments!" ForeColor="#CC0000" />
        
            <br />
            <br />
            <asp:Button ID="btnCalcMonPmt" runat="server" OnClick="btnCalcMonPmt_Click" Text="Calculate Monthly Payment" />
        </div>
        <div style="width: 534px; float: left; height: 302px;" id="prompt">

            Monthly Payment:<br />
            <asp:TextBox ID="txtMonthly" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Enabled="False" Text="Submit to Database" OnClick="btnSubmit_Click" ValidateRequestMode="Enabled" />
            <br />
            <br />
            <asp:Button ID="btnView" runat="server" Text="View Data" OnClick="btnView_Click" CausesValidation="False" ValidateRequestMode="Disabled" />

            
        <p style="clear: both;"></p>
        
        </div>
        
    </div>

    <div class="row" >
        <div class="col-md-4">
            
        </div>
    </div>

</asp:Content>
