<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Musteri_Randevu.aspx.cs" Inherits="Crm.Musteri_Randevu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/textbox.css" rel="stylesheet" />
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
    <div class="container">
        <div class="row">
            <div class="col-md-1">
                <asp:Label ID="Label1" runat="server" Text="Tarih" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtTarih" runat="server" CssClass="textbox" placeholder="Tarih"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtTarih_CalendarExtender" runat="server" TargetControlID="txtTarih" Format="dd.MM.yyyy" />
            </div>
            <div class="col-md-1">

                <asp:Label ID="Label2" runat="server" Text="Firma" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtMusteriAd" runat="server" CssClass="textbox" placeholder="Firma Ad"></asp:TextBox>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-1">
                <asp:Label ID="Label3" runat="server" Text="Yetkili" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtYetkili" runat="server" CssClass="textbox" placeholder="Yetkili"></asp:TextBox>
            </div>
            <div class="col-md-1">
                <asp:Label ID="Label7" runat="server" Text="Telefon" Font-Bold="True" Font-Size="Large"></asp:Label>

            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtTelefon" runat="server" CssClass="textbox" placeholder="Telefon"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-1">
                <asp:Label ID="Label8" runat="server" Text="Email" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" placeholder="E-Mail"></asp:TextBox>
            </div>
            <div class="col-md-1">
                <asp:Label ID="Label11" runat="server" Text="Dağıtıcı" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:DropDownList ID="dpDagitici" runat="server" CssClass="textbox">
                </asp:DropDownList>
            </div>

        </div>
        <br />
        <div class="row">
            <div class="col-md-1">
                <asp:Label ID="Label12" runat="server" Text="Açıklama" Font-Bold="True" Font-Size="Large"></asp:Label>

            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtAciklama" runat="server" CssClass="textbox" TextMode="MultiLine" placeholder="Açıklama"></asp:TextBox>

            </div>           
            <div class="col-md-1">
             
            </div>
              <div class="col-md-2">
                 <asp:Button ID="btnKaydet" runat="server" CssClass="textbox" Text="Kaydet" ToolTip="Kaydet" OnClick="btnKaydet_Click" Font-Bold="True" Font-Size="Large"  OnClientclick="return confirm(' Randevu oluşturuldu ')" />
            
              </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <br />
        </div>
    </div>
</asp:Content>
