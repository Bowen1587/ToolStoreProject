<%@ Page Title="List members" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ListMembers.aspx.cs" Inherits="ToolStoreProject.ListMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            vertical-align:middle;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div align="center" class="navbar" style="height:auto">
    <hr />
        <asp:Panel ID="p" runat="server" DefaultButton="ImageButton2" style="text-align:center">
            <asp:Label class="auto-style1" ID="Label1" runat="server" Text="ID:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox1" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label2" runat="server" Text="Account:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox2" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="70px"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label3" runat="server" Text="Phone Number:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox3" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label4" runat="server" Text="Name:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox4" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px" TextMode="SingleLine"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label5" runat="server" Text="Birth:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox5" runat="server" ClientIdMode="static" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px" AutoCompleteType="Disabled" ValidateRequestMode="Disabled" placeholder="yyyy/mm/dd"></asp:TextBox>
            <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageUrl="~/Stock/SearchButtonWhite.png" OnClick="ImageButton2_Click" Width="20px" Style="margin-left: 15px;" ImageAlign="Middle"/>
        </asp:Panel>
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="No members to display" ForeColor="#333333" GridLines="None" DataKeyNames="Member_ID" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="1000">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Member_ID" HeaderText="Member_ID" InsertVisible="False" ReadOnly="True" SortExpression="Member_ID" />
            <asp:BoundField DataField="Account" HeaderText="Account" SortExpression="Account" />
            <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
            <asp:BoundField DataField="Mem_Name" HeaderText="Mem_Name" SortExpression="Mem_Name" />
            <asp:BoundField DataField="Birth" HeaderText="Birth" SortExpression="Birth" ReadOnly="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last"/>  
    </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toolConnectionString %>" SelectCommand="SELECT [Member_ID], [Account], [Phone_Number], [Mem_Name], CONVERT(varchar, Birth, 111) AS Birth FROM [Member]"></asp:SqlDataSource>

</div>
</asp:Content>
