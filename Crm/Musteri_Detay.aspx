<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Musteri_Detay.aspx.cs" Inherits="Crm.Musteri_Detay" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=device-dpi" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div id="mainContainer" class="container">               
                <div class="page-container">  
                    <div class="container">

    <div style="font-weight: 700; font-size: large; color: #0055C4">
        <br/>
     
       Müşteri Detay<br />
        <div style="border: thin outset #CCCCCC"></div>
    </div>
   <br />
                        <br />
                        <br />
   
   <div>
       <br/>

        <div class="table-responsive">
        <asp:GridView ID="grdDetay" runat="server"   CellPadding="2" ForeColor="#333333" ShowFooter="True" Width="100%" BorderStyle="None">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="Black" />
            <HeaderStyle HorizontalAlign="Center" BackColor="Gainsboro" Font-Bold="True" ForeColor="ActiveCaptionText" />
            <PagerStyle BackColor="WhiteSmoke" ForeColor="#333333" />
            <RowStyle HorizontalAlign="Right" BackColor="WhiteSmoke" ForeColor="#333333" />
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
      <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=grdDetay]').footable();
        });
    </script>
</asp:Content>
