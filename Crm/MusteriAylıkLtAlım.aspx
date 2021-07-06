<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="MusteriAylıkLtAlım.aspx.cs" Inherits="Crm.MusteriAylıkLtAlım" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <asp:Button ID="ASPxButton1" runat="server" Height="100%" Text="Müşteri Karlılık Raporu" Width="100%" AutoPostBack="False">
    </asp:Button>
    <br />
    <br />
    <br />
    <div>

        <table>
            <tr>
                <td style="width: 65px; height: 42px;">Yıl :</td>
                <td style="width: 100px; height: 42px;">
                    <asp:DropDownList ID="dpYil" runat="server">
                        <asp:ListItem>2020</asp:ListItem>
                        <asp:ListItem>2021</asp:ListItem>
                    </asp:DropDownList>
                </td>

                <td style="height: 22px">
                    <asp:Button ID="btnSorgula" runat="server" Text="Sorgula" Height="31px" Width="122px" OnClick="btnSorgula_Click">
                        
                    </asp:Button>
                </td>
                <td style="width:50px;" </td>
                                <td style="width: 70px; height: 42px;">Firma Ünvan :</td>
                <td style="width: 190px; height: 42px;">
                    <asp:TextBox ID="txtCariAd" runat="server" Height="26px" Style="margin-left: 2px" Width="170px">
                    </asp:TextBox>
           
                     </td>
                <td style="height: 42px">
                    <asp:Button ID="btnArama" runat="server" Text="Arama" Height="31px" Width="122px" OnClick="btnArama_Click">
                     
                    </asp:Button>
                    </td>
            </tr>
        </table>

    </div>
    <br />
    <asp:GridView ID="grdVeri" runat="server" CellPadding="4" ShowFooter="True" Style="text-align: right" Width="100%" AllowSorting="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CaptionAlign="Right" CellSpacing="2" Font-Size="Small" ForeColor="Black" OnSorting="grdVeri_Sorting" OnRowDataBound="grdVeri_RowDataBound" >

        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</asp:Content>

