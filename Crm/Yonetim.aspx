<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Yonetim.aspx.cs" Inherits="Crm.Yonetim" %>

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
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <span class="auto-style3"><strong class="auto-style2">Yaklaşan Randevu Uyarı Tablosu</strong></span><br />
    <br />
    <br />
    <asp:GridView ID="grdYaklasanRandevu" runat="server" AutoGenerateColumns="False" CssClass="footable" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="TARİH" HeaderText="TARİH" />
            <asp:BoundField DataField="FİRMA" HeaderText="FİRMA" />
            <asp:BoundField DataField="YETKİLİ" HeaderText="YETKİLİ" />
            <asp:BoundField DataField="E MAİL" HeaderText="E MAİL" />
            <asp:BoundField DataField="BAYİ" HeaderText="BAYİ" />
            <asp:BoundField DataField="SATIŞ PERSONEL" HeaderText="SATIŞ PERSONEL" />
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
    <br />

    <br />
    <span class="auto-style3"><strong class="auto-style2">Sözleşme Bitiş Uyarı Tablosu</strong></span><br />
    <br />
    <br />
    <asp:GridView ID="grdSozlesmeBitis" runat="server" AutoGenerateColumns="False" CssClass="footable" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="TARİH" HeaderText="TARİH" />
            <asp:BoundField DataField="FİRMA" HeaderText="FİRMA" />
            <asp:BoundField DataField="YETKİLİ" HeaderText="YETKİLİ" />
            <asp:BoundField DataField="E MAİL" HeaderText="E MAİL" />
            <asp:BoundField DataField="BAYİ" HeaderText="BAYİ" />
            <asp:BoundField DataField="SATIŞ PERSONEL" HeaderText="SATIŞ PERSONEL" />
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
    <br />

    <br />
    <div style="text-align: center">
        <strong><span style="font-size: x-large; color: #FF6600">Alımı Olmayan Cari Listesi<br />
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
                <asp:BoundField DataField="CARİ KOD" HeaderText="CARİ KOD" />
                <asp:BoundField DataField="CARİ AD" HeaderText="CARİ AD" />
                <asp:BoundField DataField="SON FATURA TARİHİ" HeaderText="SON FATURA TARİHİ" />
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
