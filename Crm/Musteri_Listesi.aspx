<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Musteri_Listesi.aspx.cs" Inherits="Crm.Musteri_Listesi" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=device-dpi" />
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
      <div>

            <div class="form-group">
          <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" CssClass="col-md-2 control-label" Text="Satış Personel :"></asp:Label>
                 <div class="col-md-3">
         <asp:TextBox ID="txtsatispersonel" runat="server" Width="175px"></asp:TextBox>
              </div>
                      </div>
       <div class="form-group">
      <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" CssClass="col-md-2 control-label" Text="Firma :"></asp:Label>
                 <div class="col-md-3">
    <asp:TextBox ID="txtFirma" runat="server" Width="175px"></asp:TextBox>
        </div>
               </div>

                
                        <div>
        <asp:Button ID="btnSorgula" runat="server" Height="36px" OnClick="btnSorgula_Click" Text="Sorgula" Width="112px" />        
        <asp:ImageButton ID="btnExcel" runat="server" Height="30px" ImageUrl="~/image/excel.png" OnClick="btnExcel_Click" ToolTip="Excel" Width="45px" />
        </div>
             

 </div>
    <div>
        <br />
     
        <asp:GridView ID="grdMusteri" runat="server" AutoGenerateColumns="False" CssClass="footable" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="grdMusteri_RowCommand" >
            <AlternatingRowStyle BackColor="White" ForeColor="Black" />
            <Columns>            
                 <asp:BoundField DataField="TARİH" HeaderText="TARİH" />
                <asp:BoundField DataField="SATIŞ PERSONEL" HeaderText="SATIŞ PERSONEL" />
                <asp:ButtonField HeaderText="FİRMA" DataTextField="FİRMA" CommandName="FİRMA"  />
                <asp:BoundField DataField="ZİYARET SAYISI" HeaderText="ZİYARET SAYISI" />
                        
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>

         <br />

        </div>
        </div>
   </div>
 </div>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=grdZiyaretListe]').footable();
        });
    </script>

</asp:Content>
