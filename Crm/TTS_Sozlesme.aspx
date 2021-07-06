<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="TTS_Sozlesme.aspx.cs" Inherits="Crm.TTS_Sozlesme" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=device-dpi" />
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=txtFromDate.ClientID %>").datepicker({ dateFormat: "dd-mm-yy",
monthNames: [ "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık" ],
dayNamesMin: [ "Pa", "Pt", "Sl", "Ça", "Pe", "Cu", "Ct" ],
firstDay:1 });
             $("#<%=txtToDate.ClientID %>").datepicker({ dateFormat: "dd-mm-yy",
monthNames: [ "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık" ],
dayNamesMin: [ "Pa", "Pt", "Sl", "Ça", "Pe", "Cu", "Ct" ],
firstDay:1 });                     
         });
    </script>
     <style type="text/css">
         .auto-style1 {
             width: 110px;
         }
         .auto-style2 {
             width: 83px;
         }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <div id="mainContainer" class="container">               
                <div class="page-container">  
                    <div class="container"> 
    <table>
        <tr>
            <td style="text-align: left;  " class="auto-style1">Başlangıç Tarihi :</td>
            <td style="width: 169px">
                <asp:TextBox  ID="txtFromDate" runat="server" ></asp:TextBox>
            </td>
            <td style="text-align: left; " class="auto-style2">Bitiş Tarihi :</td>
            <td style="width: 178px">
                <asp:TextBox ID="txtToDate" runat="server" ></asp:TextBox>
            </td>
            <td style="width: 172px">
                <div style="text-align: left">
                    <asp:Button ID="ASPxButton1" runat="server" Height="27px" OnClick="ASPxButton1_Click" Text="Sorgula" Width="168px" >
                    </asp:Button>
                </div>
            </td>
            <td>
                <asp:ImageButton ID="btnYazdir" runat="server" Height="27px" ImageUrl="~/image/printer.ico" OnClick="BtnYazdir_Click" Width="42px" Style="text-align: right" />
                <asp:ImageButton ID="btnExcel" runat="server" Height="30px" ImageUrl="~/image/excel.png" Width="45px" ToolTip="Excel" OnClick="BtnExcel_Click" />
             
            </td>
        </tr>
    </table>

    <div>
       <br/>

        <div class="table-responsive">
        <asp:GridView ID="grdVeri" runat="server" CssClass="table table-striped table-bordered table-hover"  CellPadding="2" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="100%" BorderStyle="None">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="Black" />
            <HeaderStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="ActiveCaptionText" />
            <PagerStyle BackColor="WhiteSmoke" ForeColor="#333333" />
            <RowStyle BackColor="WhiteSmoke" ForeColor="#333333" />
            <SelectedRowStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="WhiteSmoke" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
            </div>
       <br/> 
        </div>
    </div>
   </div>
  </div>
</asp:Content>
