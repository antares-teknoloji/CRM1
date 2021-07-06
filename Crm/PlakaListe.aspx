<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="PlakaListe.aspx.cs" Inherits="Crm.PlakaListe" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <br />
    <br />
    <br />
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td style="width: 65px">Plaka :</td>
                <td style="width: 190px">
                    <asp:TextBox ID="txtPlaka" runat="server" Height="26px" Style="margin-left: 2px" Width="170px"></asp:TextBox>
                   
                </td>
                <td style="width: 70px">
                    <asp:Button ID="btnArama" runat="server" Text="Arama" Height="31px" Width="122px" OnClick="btnArama_Click" />
                    
                   
                </td>
                <td style="width: 190px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        </div>
        <br />
        <table>
            <tr>
                <td>Plaka&nbsp; :

                    <asp:TextBox ID="txtPlakaKaydet" runat="server" Height="34px" Width="221px"></asp:TextBox>
                     
                    <br />
                    <br />
                    <asp:Button ID="btnKaydet" runat="server" Height="36px" Text="Kaydet" Width="221px" AllowFocus="False" AutoPostBack="False" OnClick="btnKaydet_Click" />

                     

                    &nbsp;</td>
                <td>
                    <asp:GridView ID="grdPlaka" runat="server" CellPadding="3" OnRowCommand="grdPlaka_RowCommand" OnRowCreated="grdPlaka_RowCreated" ShowFooter="True" Style="text-align: center" Width="213%" AllowSorting="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CaptionAlign="Right" CellSpacing="1" Font-Size="Small" GridLines="None" OnPageIndexChanging="grdPlaka_PageIndexChanging" OnRowDataBound="grdPlaka_RowDataBound" OnRowDeleting="grdPlaka_RowDeleting" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="60" HeaderText="Sil">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblSil" runat="server" OnClientClick="return confirm('Kaydı Silmek Istediginize Emin Misiniz?');" CommandName="Delete">Sil</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                </td>
            </tr>
        </table>

        <br />
    </div>
</asp:Content>
