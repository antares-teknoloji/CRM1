<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Musteri_Basvuru.aspx.cs" Inherits="Crm.Musteri_Basvuru" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=device-dpi" />
    <style type="text/css">
        .auto-style2 {
            font-size: x-large;
        }

        .auto-style3 {
            color: #FF6600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div style="text-align: center">
        <strong><span style="font-size: x-large; color: #FF6600">MÜŞTERİ BAŞVURU LİSTESİ<br />
        </span></strong>
        <br />
    </div>
  
    <br />
    <br />

    <div style="width: 100%; text-align: left;">
        <div style="float: left;">
        </div>
        <div style="float: left; height: 38px;">
        </div>
        <div style="float: left; width: 20%; height: 37px;">
        </div>
        <asp:GridView ID="grdCari" runat="server" AutoGenerateColumns="False" CssClass="footable" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="Black" />
            <Columns>
                <asp:CheckBoxField ControlStyle-CssClass="" />               
                <asp:BoundField DataField="FİRMA" HeaderText="FİRMA" FooterStyle-VerticalAlign="Bottom" />
                <asp:BoundField DataField="AD SOYAD" HeaderText="AD SOYAD" />
                <asp:BoundField DataField="İL" HeaderText="İL" />
                <asp:BoundField DataField="ADRES" HeaderText="ADRES" />
                <asp:BoundField DataField="TELEFON" HeaderText="TELEFON" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" />
                <asp:BoundField DataField="ARAÇ SAYISI" HeaderText="ARAÇ SAYISI" />
                <asp:BoundField DataField="AYLIK TÜKETİM TL" HeaderText="AYLIK TÜKETİM TL" />
                <asp:BoundField DataField="VERGİ NO" HeaderText="VERGİ NO" />
                <asp:BoundField DataField="MESAJ" HeaderText="MESAJ" />
            

            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"  />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Large" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            
        </asp:GridView>

        <br />
        <br />

    </div>
    <br />

    <br />
    <br />
    <br />
    <br />
    <br />

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>



    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=grdYaklasanRandevu]').footable();
            $('[id*=grdSozlesmeBitis]').footable();
            ('[id*=grdCari]').footable();
        });
    </script>
</asp:Content>
