<%@ Page Title="Add product" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ToolStoreProject.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 34px;
        }
        .auto-style2 {
            height: 81px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
    <table>
        <tr>
            <td class="auto-style2"></td>
        </tr>
    </table>
    <table style="border-style: hidden; width:500px; height:390px; background-color:rgba(44,44,63,0.5);" align="center">
        <tr>
            <td align="center" width="50%" colspan="2">
                <h1>
                    Adding Product</h1>
                <h1 />
            </td>
        </tr>
        <tr>
            <td align="center" width="50%">
                <h3>Product Name:</h3>
            </td>
            <td width="50%">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" width="50%">
                <h3>Category:</h3>
            </td>
            <td width="50%">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" width="50%">
                <h3>Image:</h3>
            </td>
            <td width="50%">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" width="50%" class="auto-style1">
                <h3>Price:</h3>
            </td>
            <td width="50%" class="auto-style1">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" width="50%">
                <h3>Remaining:</h3>
            </td>
            <td width="50%">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" width="50%" colspan="2">
                <asp:Button ID="Button1" runat="server" Text="Add" Font-Bold="True" Font-Size="Larger" Height="30px" OnClick="Button1_Click" Width="80px" />
                <asp:Button ID="Button2" runat="server" Text="Back" Font-Bold="True" Font-Size="Larger" Height="30px" OnClick="Button2_Click" Width="80px" />
            </td>
        </tr>
        <tr>
            <td align="center" width="50%" colspan="2">
            </td>
        </tr>
    </table>
</div>

</asp:Content>
