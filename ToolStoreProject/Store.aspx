<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="ToolStoreProject.Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="Stock/ToolStore.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Store page</title>
    <style type="text/css">
        .auto-style1 {
            text-align:center;
        }
        .auto-style2 {
            width: 282px;
        }
        .auto-style3 {
            width: 1150px;
            height: 38px;
        }
        </style>
</head>
<body style="background-image: url('Stock/background2.jpg'); background-size:cover; no-repeat; background-attachment: fixed; background-position: center; text-align:center">
    
    <center>
        <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButton3" style="text-align:center" BackColor="#5F98F3" Height="34px" Width="1146px">
            <asp:Label ID="三義百貨" runat="server" Text="三義百貨" Font-Bold="True" Font-Names="Malgun Gothic" Font-Size="X-Large" ForeColor="#CCFF66" Height="36px" Width="116px"></asp:Label>
        </asp:Panel>
    <form id="form1" runat="server">
        <table class="auto-style3">
            <tr style ="background-color:#666699">
                <td  class="auto-style2">
                    <asp:Button ID="LogOut_Button" runat="server" Text="Log out" BackColor="#CC0000" BorderColor="Black" Font-Bold="True" PostBackUrl="~/Default.aspx" Height="27px" Style="margin-left:5px;vertical-align:middle;text-align:left"/>
                    <asp:Label ID="Name_Label" runat="server" style="text-align:left;margin-left:5px" Font-Bold="True" Font-Italic="True" Font-Names="Bahnschrift SemiBold" ForeColor="White"></asp:Label>
                </td>
                <td style="text-align:center">
                    <asp:Label ID="Label9" runat="server" style="text-align:right;margin-right:2px" Font-Bold="True" Text="Shopping cart" ForeColor="White" Font-Names="Bahnschrift SemiBold"></asp:Label>
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Stock/ShoppingCart.png" OnClick="ImageButton3_Click" Height="25px" Width="25px" Style="vertical-align:middle;margin-right:5px"/>
                    <asp:Label ID="Label8" runat="server" style="text-align:right;margin-right:5px;margin-left:2px" Font-Bold="True" Text="Orders" ForeColor="White" Font-Names="Bahnschrift SemiBold"></asp:Label>
                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Stock/Order.png" OnClick="ImageButton4_Click" Height="20px" Width="17.5px" Style="vertical-align:middle;margin-right:5px"/>
                </td>
                <td>
                <asp:Panel ID="p" runat="server" DefaultButton="ImageButton2" style="text-align:center">
                    <asp:Label class="auto-style1" ID="Label1" runat="server" Text="Product Name :" Font-Bold="True" Height="15px" Style="margin-left: 15px;" ForeColor="White" Font-Names="Bahnschrift SemiBold"></asp:Label>
                    <asp:TextBox ID="SearchTextBox" runat="server" Height="15px" DefaultButton="ImageButton2"></asp:TextBox>
                    <asp:Label class="auto-style1" ID="Label6" runat="server" Text="Category :" Font-Bold="True" Height="15px" Style="margin-left: 15px;" ForeColor="White" Font-Names="Bahnschrift SemiBold"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="category" DataValueField="category" AppendDataBoundItems="true" Height="25px" Style="vertical-align:middle;">
                        <asp:ListItem Text="All" Value="" />
                    </asp:DropDownList>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageAlign="AbsMiddle" ImageUrl="~/Stock/SearchButtonWhite.png" OnClick="ImageButton2_Click" Style="margin-left:15px;margin-right:15px" Width="20px" />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:toolConnectionString %>" SelectCommand="SELECT DISTINCT [category] FROM [Product]"></asp:SqlDataSource>
                </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Product_ID" DataSourceID="SqlDataSource1" Height="293px" Width="310px" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand1">
        <ItemTemplate>
            <table>
                <tr>
                    <td class="auto-style1" style ="background-color:#5f98f3">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_Name")%>' Font-Bold="True" Font-Names="Segoe UI" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Image ID="Image1" runat="server" BorderColor="#5f98f3" BorderWidth="1px" Height="279px" Width="278px" ImageUrl='<%# Eval("PImage") %>' BackColor="White"/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style ="background-color:#5f98f3">
                        <asp:Label ID="Label2" runat="server" Text="Price : " Font-Bold="True" Font-Names="Segoe UI" ForeColor="Black" style="text-align:center"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Price") %>' Font-Bold="True" Font-Names="Segoe UI" ForeColor="Black" style="text-align:center"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="NTD" Font-Bold="True" Font-Names="Segoe UI" ForeColor="Black" style="text-align:center"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label5" runat="server" Text="Remaining : " Font-Names="Segoe UI" ForeColor="Black" style="text-align:center" Font-Bold="True"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("remaining") %>' Font-Names="Segoe UI" ForeColor="Black" style="text-align:center" Font-Bold="True"></asp:Label>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label7" runat="server" Text="Quantity" Font-Names="Segoe UI" ForeColor="Black" Style="text-align: center" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" Height="15" Width="40">1</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageUrl="~/Stock/AddToCart.png" Width="135px" CommandArgument='<%# Eval("Product_ID") %>' CommandName="AddToCart"/>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toolConnectionString %>" SelectCommand="SELECT [Product_ID], [Product_Name], [PImage], [Price], [remaining] FROM [Product]"></asp:SqlDataSource>
    </form>
    </center>
</body>
</html>
