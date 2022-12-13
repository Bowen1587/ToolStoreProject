<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddtoCart.aspx.cs" Inherits="ToolStoreProject.AddtoCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="Stock/ToolStore.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Shopping cart</title>
</head>
<body style="background-image: url(https://assets.architecturaldigest.in/photos/60084dd6cce5700439e12bf7/16:9/w_2560%2Cc_limit/modern-living-room-decor-1366x768.jpg)">
    <form id="form1" runat="server">
        <div align="center">
            <h2 style="font-family: 'Comic Sans MS'; background-color: burlywood">This is your cart. Come check your items!</h2>
            <br /><br />
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Comic Sans MS" Font-Size="XX-Large" BackColor="#996633" BorderColor="#CC9900" ForeColor="#FFFFCC" NavigateUrl="Store.aspx">Continue Shopping</asp:HyperLink>
            <br /><br />
            <asp:Label ID="Remaining" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#FF471A" BackColor="Black" Font-Names="Segoe UI"></asp:Label>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#FFFFCC" BorderColor="#996600" BorderWidth="5px" Height="200px" Width="839px" EmptyDataText="No products for now" OnRowDeleting="GridView1_RowDeleting" text-align="middle">
                <Columns>
                    <asp:BoundField DataField="sno" HeaderText="商品排序">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="商品名稱">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="image" HeaderText="商品圖片">
                        <ControlStyle Height="100px" Width="100px" />
                        <ItemStyle HorizontalAlign="Center" Height="50px" Width="50px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="price" HeaderText="價錢">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="quantity" HeaderText="數量">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="total" HeaderText="總和">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField DeleteText="刪除此物品" ShowDeleteButton="True" />
                </Columns>
                <HeaderStyle BackColor="#FFCC66" ForeColor="#333300" />
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Checkout" BackColor="#FFDA6A" BorderColor="#996633" BorderWidth="3px" ForeColor="Black" Height="28px" Width="123px" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
