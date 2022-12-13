<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ToolStoreProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="Stock/ToolStore.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ToolStore login</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
            color: #CCFF66;
            background-color: #5f98f3;
        }
        .auto-style5 {
            width: 1808px;
            text-align: center;
        }
        .auto-style6 {
            width: 1808px;
            text-align: center;
            height: 43px;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            height: 100px;
        }
        .auto-style9 {
            width: 338px;
            height: 200px;
        }
        .auto-style10 {
            width: 1808px;
            text-align: center;
            height: 80px;
        }
    </style>
</head>
<body style="background-image: url('Stock/background2.jpg'); background-size:cover; no-repeat; background-attachment: fixed; background-position: center">
    <form id="form1" runat="server">
         <section class="auto-style1">

             <strong style="font-family: 'Malgun Gothic'">三義百貨</strong></section>
        <table>
            <tr>
                 <td class="auto-style8"></td>
             </tr>
        </table>
             
         <table style="border-style: hidden; background-color:rgba(2,20,25,0.3);" align="center" class="auto-style9">
             
             <tr>

                 <td class="auto-style10">
                     <asp:Label ID="Label1" runat="server" Text="帳號" Font-Bold="True" Font-Names="ency fb" Height="27px"></asp:Label>
                     <asp:TextBox ID="AccountTB" runat="server" Height="27px" BorderStyle="Solid"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style5">
                     <asp:Label ID="Label2" runat="server" Text="密碼" Font-Bold="True" Height="27px"></asp:Label>
                     <asp:TextBox ID="PasswordTB" runat="server" TextMode="Password" Height="27px" BorderStyle="Solid"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style6">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Button ID="LoginBT" runat="server" Text="登入" OnClick="LoginBT_Click" Style="margin-left: 10px;" BackColor="#669999" BorderColor="Black" Height="30px" Width="55px" Font-Bold="True" Font-Italic="False" Font-Size="Medium"/> 
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="RegisterBT" runat="server" Text="註冊" OnClick="RegisterBT_Click" Style="margin-left: 10px;" BackColor="SeaShell" BorderColor="Black" Height="30px" Width="55px" Font-Bold="True" Font-Size="Medium"/>
                 </td>
             </tr>
         </table>
         <div class="auto-style7">
         <asp:DetailsView ID="clientDetailsView" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="50px" Width="183px" EmptyDataText="帳號密碼錯誤" Visible="False" BackColor="Red" Font-Bold="True" align="center" DataKeyNames="Member_ID">
             <Fields>
                 <asp:BoundField DataField="Account" HeaderText="Account" SortExpression="Account" />
                 <asp:BoundField DataField="Mem_Name" HeaderText="Mem_Name" SortExpression="Mem_Name" />
                 <asp:BoundField DataField="Member_ID" HeaderText="Member_ID" SortExpression="Member_ID" />
             </Fields>
         </asp:DetailsView>
         </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toolConnectionString %>" SelectCommand="SELECT [Account], [Mem_Name], [Member_ID] FROM [Member] WHERE (([Account] = @Account) AND ([Mem_Password] = @Mem_Password))">
             <SelectParameters>
                 <asp:ControlParameter ControlID="AccountTB" Name="Account" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="PasswordTB" Name="Mem_Password" PropertyName="Text" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>
    </form>
</body>
</html>
