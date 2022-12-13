<%@ Page Title="Register" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ToolStoreProject.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="Stock/ToolStore.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
            color: #CCFF66;
            background-color: #5f98f3;
        }
        .auto-style2 {
            width: 1808px;
            text-align: center;
        }
        .auto-style9 {
            width: 338px;
            height: 240px;
        }
        .img {
            left: 0px;
            top: -1px;
            z-index: -1;
        } 
    </style>
</head>
<body style="background-image: url('Stock/background2.jpg'); background-size:cover; no-repeat; background-attachment: fixed; background-position: center">
    <form id="form1" runat="server">
        <section class="auto-style1">
             <strong style="font-family: 'Malgun Gothic'">三義百貨</strong>
        </section>
        <table style="border-style: hidden;margin-top:20px; background-color:rgba(2,20,25,0.3);" align="center" class="auto-style9">
             
             <tr style="margin-top:10px">

                 <td class="auto-style2">
                     <asp:Label ID="Label1" runat="server" Text="帳號" Font-Bold="True" Font-Names="ency fb" Height="27px"></asp:Label>
                     <asp:TextBox ID="AccountTB" runat="server" Height="27px" BorderStyle="Solid" Style="margin-left: 10px;"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style2">
                     <asp:Label ID="Label2" runat="server" Text="密碼" Font-Bold="True" Height="27px"></asp:Label>
                     <asp:TextBox ID="PasswordTB" CssClass="img" runat="server" TextMode="Password" Height="27px" BorderStyle="Solid" Style="margin-left: 10px" Width="145px"></asp:TextBox>
                     <asp:ImageButton ID="ImageButton1" CssClass="img" runat="server" Height="20px" ImageAlign="AbsMiddle" Width="20px" ImageUrl="~/Stock/PasswordShow.png" OnClick="ImageButton1_Click" />
                 </td>
             </tr>
            <tr>
                 <td class="auto-style2">
                     <asp:Label ID="Label3" runat="server" Text="電話" Font-Bold="True" Height="27px"></asp:Label>
                     <asp:TextBox ID="PhoneTB" runat="server" Height="27px" BorderStyle="Solid" Style="margin-left: 10px;"></asp:TextBox>
                 </td>
             </tr>
            <tr>
                 <td class="auto-style2">
                     <asp:Label ID="Label4" runat="server" Text="名字" Font-Bold="True" Height="27px"></asp:Label>
                     <asp:TextBox ID="NameTB" runat="server" Height="27px" BorderStyle="Solid" Style="margin-left: 10px;"></asp:TextBox>
                 </td>
             </tr>
            <tr>
                 <td class="auto-style2">
                     <asp:Label ID="Label5" runat="server" Text="生日" Font-Bold="True" Height="27px"></asp:Label>
                     <asp:TextBox ID="BirthTB" runat="server" TextMode="Date" Height="27px" BorderStyle="Solid" Style="margin-left: 10px;" Width="170px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style2">
                     <asp:Button ID="LoginBT" runat="server" Text="新增帳戶" OnClick="LoginBT_Click" Style="margin-left: 10px;" BackColor="#669999" BorderColor="Black" Height="30px" Width="79px" Font-Bold="True" Font-Italic="False" Font-Size="Medium" />
                     <asp:Button ID="CancelBT" runat="server" Text="返回" OnClick="CancelBT_Click" Style="margin-left: 10px;" BackColor="#669999" BorderColor="Black" Height="30px" Width="79px" Font-Bold="True" Font-Italic="False" Font-Size="Medium"/> 
                 </td>
             </tr>
         </table>
    </form>
</body>
</html>
