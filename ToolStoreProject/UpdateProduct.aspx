<%@ Page Title="Update product" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="ToolStoreProject.UpdateProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" class="navbar" style="height:auto">
    <hr />
        <asp:Panel ID="p" runat="server" DefaultButton="ImageButton2" style="text-align:center">
            <asp:Label class="auto-style1" ID="Label1" runat="server" Text="Product Name:" Font-Bold="True" Height="15px" Style="margin-left: 15px;"></asp:Label>
            <asp:TextBox ID="SearchTextBox" runat="server" Height="15px" DefaultButton="ImageButton2" Style="vertical-align:middle"></asp:TextBox>
            <asp:Label class="auto-style1" ID="Label6" runat="server" Text="Category:" Font-Bold="True" Height="15px" Style="margin-left: 15px;"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category" AppendDataBoundItems="true" Height="25px" Style="vertical-align:middle;">
                <asp:ListItem Text="All" Value="" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toolConnectionString %>" SelectCommand="SELECT DISTINCT [category] FROM [Product]"></asp:SqlDataSource>
            <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageUrl="~/Stock/SearchButton.png" OnClick="ImageButton2_Click" Width="20px" Style="margin-left: 15px;" ImageAlign="AbsMiddle"/>
        </asp:Panel>
        <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="No Product to display" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" PageSize="20">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Product ID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_ID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Product_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="category" DataValueField="category" SelectedValue='<%# Eval("category") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:toolConnectionString %>" SelectCommand="SELECT DISTINCT [category] FROM [Product]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PImage") %>' Height="100px" Width="92px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remaining">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("remaining") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("remaining") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:CommandField HeaderText="Operation" ShowEditButton="True">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

</div>
</asp:Content>
