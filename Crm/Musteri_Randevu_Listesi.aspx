<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Musteri_Randevu_Listesi.aspx.cs" Inherits="Crm.Musteri_Randevu_Listesi" %>

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
   
     
    <div class="form-group">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" CssClass="col-md-2 control-label" Text="Başlangıç Tarihi :"></asp:Label>
         <div class="col-md-3">
    <asp:TextBox ID="txtDtBas" runat="server" Width="175px"></asp:TextBox>
             </div>
    <ajaxToolkit:CalendarExtender ID="txtDtBas_CalendarExtender" runat="server" TargetControlID="txtDtBas" Format="dd.MM.yyyy" />
&nbsp;&nbsp;
        </div>

    <div class="form-group">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" CssClass="col-md-2 control-label" Text="Bitiş Tarihi :"></asp:Label>
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
    <asp:Button ID="btnSorgula" runat="server" Height="36px" OnClick="btnSorgula_Click" Text="Sorgula" Width="112px" />

    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <br />
    <br />
    <asp:GridView ID="grdRandevuListe" runat="server" AutoGenerateColumns="False" CssClass="footable" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="grdRandevuListe_RowCommand" >
        <AlternatingRowStyle BackColor="White" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="TARİH" HeaderText="TARİH" />
            <asp:ButtonField HeaderText="FİRMA" DataTextField="FİRMA" CommandName="FİRMA" />
            <asp:BoundField DataField="YETKİLİ" HeaderText="YETKİLİ" />
            <asp:BoundField DataField="E MAİL" HeaderText="E MAİL" />
            <asp:BoundField DataField="BAYİ" HeaderText="BAYİ" />
            <asp:BoundField DataField="SATIŞ PERSONEL" HeaderText="SATIŞ PERSONEL" />
            <asp:HyperLinkField Text="Düzenle" DataNavigateUrlFields="ID,TARİH,FİRMA,YETKİLİ,E MAİL,BAYİ" 
                DataNavigateUrlFormatString="Musteri_Ziyaret.aspx?ID={0}&TARIH={1}&FIRMA={2}&YETKILI={3}&EMAIL={4}&DAGITICI{5}" />
           
                
            
        
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('[id*=grdRandevuListe]').footable();
        });
    </script>

</asp:Content>
