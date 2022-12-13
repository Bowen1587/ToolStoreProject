<%@ Page Title="Order Status" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="ToolStoreProject.OrderStatus" %>
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
            <asp:Label class="auto-style1" ID="Label1" runat="server" Text="訂單ID:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox1" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label2" runat="server" Text="商品ID:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox2" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label3" runat="server" Text="商品名字:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox3" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label4" runat="server" Text="價錢:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox4" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label5" runat="server" Text="數量:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox5" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label6" runat="server" Text="下單日期:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox6" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px" placeholder="yyyy/mm/dd"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label7" runat="server" Text="會員ID:" Font-Bold="True" Height="15px" Style="margin-left: 15px;vertical-align:middle"></asp:Label>
            <asp:TextBox ID="SearchTextBox7" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle" Width="80px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageUrl="~/Stock/SearchButtonWhite.png" OnClick="ImageButton2_Click" Width="20px" Style="margin-left: 15px;" ImageAlign="Middle"/>
        </asp:Panel>
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="No members to display" ForeColor="#333333" GridLines="None" DataKeyNames="Order_ID" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="100">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" InsertVisible="False" ReadOnly="True" SortExpression="Order_ID" />
            <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" />
            <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" />
            <asp:BoundField DataField="Order_Price" HeaderText="Order_Price" SortExpression="Order_Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Order_Date" HeaderText="Order_Date" ReadOnly="True" SortExpression="Order_Date" />
            <asp:BoundField DataField="Member_ID" HeaderText="Member_ID" SortExpression="Member_ID" />
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toolConnectionString %>" SelectCommand="SELECT [Order_ID], [Product_ID], [Product_Name], [Order_Price], [Quantity], CONVERT(varchar, Order_Date, 111) AS Order_Date, [Member_ID] FROM [Orders]"></asp:SqlDataSource>

</div>
</asp:Content>
