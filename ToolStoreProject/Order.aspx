<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ToolStoreProject.Stock.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="Stock/ToolStore.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Order</title>
</head>
<body style="background-image: url(https://assets.architecturaldigest.in/photos/60084dd6cce5700439e12bf7/16:9/w_2560%2Cc_limit/modern-living-room-decor-1366x768.jpg)">
    <form id="form1" runat="server">
        <div align="center">
            <h2 style="font-family: 'Comic Sans MS'; background-color: burlywood">Your Order</h2>
            <br /><br />
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Comic Sans MS" Font-Size="XX-Large" BackColor="#996633" BorderColor="#CC9900" ForeColor="#FFFFCC" NavigateUrl="Store.aspx">Continue Shopping</asp:HyperLink>
            <br /><br /><br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#FFFFCC" BorderColor="#996600" BorderWidth="5px" Height="200px" Width="839px" EmptyDataText="No order" align="center" DataKeyNames="Order_ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" InsertVisible="False" ReadOnly="True" SortExpression="Order_ID" >
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Product_ID" HeaderText="Product_ID" SortExpression="Product_ID" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Order_Price" HeaderText="Order_Price" SortExpression="Order_Price" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Order_Date" HeaderText="Order_Date" SortExpression="Order_Date" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#FFCC66" ForeColor="#333300" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
            <br />
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toolConnectionString %>" SelectCommand="SELECT [Order_ID], [Product_ID], [Product_Name], [Quantity], [Order_Price],CONVERT(varchar, Order_Date, 111) AS Order_Date FROM [Orders] WHERE ([Member_ID] = @Member_ID)">
                 <SelectParameters>
                     <asp:SessionParameter Name="Member_ID" SessionField="Member_ID" Type="Int32" />
                 </SelectParameters>
            </asp:SqlDataSource>
        </div>

    </form>
</body>
</html>
