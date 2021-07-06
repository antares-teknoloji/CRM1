<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="CariEkstre.aspx.cs" Inherits="Crm.CariEkstre" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Button ID="ASPxButton1" runat="server" Height="100%" Text="Müşteri Yakıt Takip Raporu" Width="100%" AutoPostBack="False">
    </asp:Button>
    <br />
    <br />
    <br />
    <br />
    <br />
                <td style="width: 158px">FİRMA ÜNVAN : </td>             
                <td style="width: 231px">
                    <asp:Label ID="lblCariAd" runat="server" Font-Bold="True" Font-Size="Large" Text="-">
                    </asp:Label>
                </td>
            </tr>
    <div id="sorgulama" style="width: 100%" class="cont" runat="server">
        <br />
        <br />
        
           <div class="form-group">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" CssClass="col-md-2 control-label" Text="Başlangıç Tarihi :"></asp:Label>
                <div class="col-md-3 col-sm-3" id="0" >
      <asp:TextBox ID="txtDtBas" runat="server" Width="175px"></asp:TextBox>

              </div>
        <ajaxToolkit:CalendarExtender ID="txtDtBas_CalendarExtender" runat="server" TargetControlID="txtDtBas" Format="dd.MM.yyyy" />
       
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" CssClass="col-md-2 control-label" Text="Bitiş Tarihi :"></asp:Label>
     </div>

         <div class="form-group">
               <div class="col-md-3">
       
       
    <asp:TextBox ID="txtDtBit" runat="server" Width="175px"></asp:TextBox>
                   </div>
        <ajaxToolkit:CalendarExtender ID="txtDtBit_CalendarExtender" runat="server" TargetControlID="txtDtBit" Format="dd.MM.yyyy" />
             
       &nbsp;&nbsp;
     </div>

            <tr>
              
                <td style="width: 172px">
                    <div style="text-align: left">
                        <asp:Button ID="btnSorgula" runat="server" Height="18px" OnClick="btnSorgula_Click" Text="Sorgula" Width="168px">
                        </asp:Button>
                    </div>
                </td>
                <td>
                    <asp:ImageButton ID="btnYazdir" runat="server" Height="27px" ImageUrl="~/image/printer.ico" OnClick="btnYazdir_Click" Width="42px" Style="text-align: right" />
                    <asp:ImageButton ID="btnExcel" runat="server" Height="30px" ImageUrl="~/image/excel.png" Width="45px" ToolTip="Excel" OnClick="btnExcel_Click" />
                    <asp:ImageButton ID="btnPdf" runat="server" Height="29px" ImageUrl="~/image/pdf.jpg" Width="40px" ToolTip="Pdf" Style="text-align: right" OnClick="btnPdf_Click" /></td>
            </tr>
      
        <div id="Div1" style="height: 87px" runat="server">
            <table id="Table2" style="width: 1000px" runat="server">
                <tr>
                    <td class="auto-style15">&nbsp;</td>
                    <td id="Td1" runat="server">&nbsp;</td>
                    <td></td>
                </tr>
            </table>
        </div>

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ScriptManager>

        <asp:GridView ID="grdEkstre1" runat="server"></asp:GridView>
   
        <asp:GridView ID="grdEkstre" runat="server" CellPadding="2" ForeColor="#333333" ShowFooter="True" Width="100%" Style="text-align: right">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="Black" />
            <HeaderStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="ActiveCaptionText" />
            <PagerStyle BackColor="WhiteSmoke" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="WhiteSmoke" ForeColor="#333333" />
            <SelectedRowStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="WhiteSmoke" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
</asp:Content>

