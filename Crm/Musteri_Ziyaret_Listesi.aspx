<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Musteri_Ziyaret_Listesi.aspx.cs" Inherits="Crm.Musteri_Ziyaret_Listesi"EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=device-dpi" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />

    <div>

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

           <div class="form-group">
      <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" CssClass="col-md-2 control-label" Text="Firma :"></asp:Label>
                 <div class="col-md-3">
    <asp:TextBox ID="txtFirma" runat="server" Width="175px"></asp:TextBox>
        </div>
               </div>
          <div class="form-group">
      <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" CssClass="col-md-2 control-label" Text="Bölge :"></asp:Label>
                 <div class="col-md-3">
    <asp:TextBox ID="txtBolge" runat="server" Width="175px"></asp:TextBox>
        </div>
               </div>
         
    </div>
    <br />
         <div>
        <asp:Button ID="BtnSorgula" runat="server" Height="36px" OnClick="BtnSorgula_Click" Text="Sorgula" Width="112px" />        
        <asp:ImageButton ID="btnExcel" runat="server" Height="30px" ImageUrl="~/image/excel.png" OnClick="BtnExcel_Click" ToolTip="Excel" Width="45px" />
        </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ScriptManager>
    <br />
    <br />
  
    <div>
        <asp:GridView ID="grdZiyaretListe" runat="server" AutoGenerateColumns="False" CssClass="footable" CellPadding="4" ForeColor="#333333" GridLines="None" OnSorting="grdZiyaretListe_Sorting" AllowSorting="true" OnRowCommand="grdZiyaretListe_RowCommand">
            <AlternatingRowStyle BackColor="White" ForeColor="Black"  />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="TARİH" HeaderText="TARİH" SortExpression="TARİH"/>
                <asp:ButtonField HeaderText="FİRMA" DataTextField="FİRMA" CommandName="FİRMA"  />
                <asp:BoundField DataField="YETKİLİ" HeaderText="YETKİLİ" />
                <asp:BoundField DataField="TAAHHÜT M3" HeaderText="TAAHHÜT M3" SortExpression="TAAHHÜT M3" />
                <asp:BoundField DataField="DURUM" HeaderText="DURUM" SortExpression="DURUM"/>
                <asp:BoundField DataField="ARAÇ SAYISI" HeaderText="ARAÇ SAYISI" SortExpression="ARAÇ SAYISI"/>
                <asp:BoundField DataField="BAYİ" HeaderText="BAYİ" />
                <asp:BoundField DataField="RAKİP FİRMA" HeaderText="RAKİP FİRMA" />  
                <asp:BoundField DataField="BÖLGE" HeaderText="BÖLGE" SortExpression="BÖLGE"/>  
                <asp:BoundField DataField="SATIŞ PERSONEL" HeaderText="SATIŞ PERSONEL" SortExpression="SATIŞ PERSONEL" />  
             
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#1C5E55" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#1C5E55" />
        </asp:GridView>
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
