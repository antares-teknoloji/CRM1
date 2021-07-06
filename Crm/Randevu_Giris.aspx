<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Randevu_Giris.aspx.cs" Inherits="Crm.Randevu_Giris" %>
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
    <div class="container">
        <div class="row">
            <div class="col-md-1">
                <asp:Label ID="Label1" runat="server" Text="Tarih" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtTarih" runat="server" CssClass="textbox" placeholder="Tarih"></asp:TextBox>
              
            </div>
         
        <div class="row">
            <div class="col-md-1">
                <asp:Label ID="Label12" runat="server" Text="Açıklama" Font-Bold="True" Font-Size="Large"></asp:Label>

            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtAciklama" runat="server" CssClass="textbox" TextMode="MultiLine" placeholder="Açıklama"></asp:TextBox>

            </div>           
            <div class="col-md-1">
             <asp:Label ID="lbl" runat="server" Text="lbl" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
              <div class="col-md-2">
                 <asp:Button ID="btnKaydet" runat="server" CssClass="textbox" Text="Kaydet" ToolTip="Kaydet"   OnClick="btnKaydet_Click" Font-Bold="True" Font-Size="Large"   />
            
              </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <br />
        </div>
    </div>
</div>

</asp:Content>
