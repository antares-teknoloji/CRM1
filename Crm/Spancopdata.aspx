<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Spancopdata.aspx.cs" Inherits="Crm.Spancopdata" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <div class="col-lg-12">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" Text="Başlangıç Tarihi :"></asp:Label>
        &nbsp;<asp:TextBox ID="txtDtBas" runat="server" Width="175px"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="txtDtBas_CalendarExtender" runat="server" TargetControlID="txtDtBas" Format="dd.MM.yyyy" />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text="Bitiş Tarihi :"></asp:Label>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
    <asp:TextBox ID="txtDtBit" runat="server" Width="175px"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="txtDtBit_CalendarExtender" runat="server" TargetControlID="txtDtBit" Format="dd.MM.yyyy" />
        &nbsp;&nbsp;
        <asp:Button ID="btnSorgula" runat="server" Height="36px" OnClick="btnSorgula_Click" Text="Sorgula" Width="112px" />
    </div>
    <br />
     <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <br />
    <br />
    <br />
    <div>
        <asp:ImageButton ID="btnYazdir" runat="server" Height="27px" ImageUrl="~/image/printer.ico" OnClick="btnYazdir_Click" Style="text-align: right" Width="42px" />
        <asp:ImageButton ID="btnExcel" runat="server" Height="30px" ImageUrl="~/image/excel.png" OnClick="btnExcel_Click" ToolTip="Excel" Width="45px" />
        <asp:ImageButton ID="btnPdf" runat="server" Height="29px" ImageUrl="~/image/pdf.jpg" OnClick="btnPdf_Click" Style="text-align: right" ToolTip="Pdf" Width="40px" />
        <asp:GridView ID="grdVeri" runat="server" AutoGenerateColumns="False" CssClass="footable" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="SATISTEMSILCI" HeaderText="Satış Temsilcisi" />
                <asp:BoundField DataField="MUSTERI" HeaderText="Müşteri" />
                <asp:BoundField DataField="SENELIKTUKETIM" HeaderText="Senelik Tüketim" />
                <asp:BoundField DataField="ARACSAYISI" HeaderText="Araç Sayısı" />
                <asp:BoundField DataField="DURUM" HeaderText="Durum" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=grdVeri]').footable();
        });
    </script>
</asp:Content>
