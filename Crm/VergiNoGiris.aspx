<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="VergiNoGiris.aspx.cs" Inherits="Crm.VergiNoGiris" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="css/textbox.css" rel="stylesheet" />
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=txtTarih.ClientID %>").datepicker({ dateFormat: "dd-mm-yy",
monthNames: [ "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık" ],
dayNamesMin: [ "Pa", "Pt", "Sl", "Ça", "Pe", "Cu", "Ct" ],
firstDay:1 });
                            
         });
    </script>
      <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=txtSozlesmeBitisTarih.ClientID %>").datepicker({ dateFormat: "dd-mm-yy",
monthNames: [ "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık" ],
dayNamesMin: [ "Pa", "Pt", "Sl", "Ça", "Pe", "Cu", "Ct" ],
firstDay:1 });
                            
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
   <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;
    <br />


    <div class="container">
      
        <br />
          <div class="col-md-6 col-sm-6">
                        <div class="row">
                             <div class="form-group col-md-12">
                                      <asp:Label ID="Label1" runat="server" Text="Vergi No:" Font-Bold="True" Font-Size="Large" Visible="True">Tarih:</asp:Label> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtTarih" runat="server" CssClass="textbox" placeholder="Tarih"></asp:TextBox>
             
                                </div>
                             
                                <div class="form-group col-md-12">
                                    <asp:Label ID="Label13" runat="server" Text="Vergi No:" Font-Bold="True" Font-Size="Large" Visible="True">Vergi/TC No:</asp:Label>
                                    <asp:TextBox ID="txtVergiNo" runat="server" CssClass="textbox" placeholder="Vergi/TC No"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVergiNo" ErrorMessage="*" ForeColor="Red">Zorunlu Alan</asp:RequiredFieldValidator>
                                </div>
                           
                              <div class="form-group col-md-12">
                                    <asp:Label ID="Label4" runat="server" Text="Yetkili" Font-Bold="True" Font-Size="Large" Visible="True">Taahhut Litre:</asp:Label>
                                    <asp:TextBox ID="txtTaahhutLitre" runat="server" CssClass="textbox" placeholder="Taahhüt Litre"></asp:TextBox>
              
                                </div>
                        
                                 <div class="form-group col-md-12">
                                    <asp:Label ID="Label6" runat="server" Text="Durum" Font-Bold="True" Font-Size="Large" Visible="True">DURUM:</asp:Label> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                      <asp:DropDownList ID="DpDurum" runat="server" CssClass="textbox">
                </asp:DropDownList>
              
                                </div>
                            
                            
                            
                              <div class="form-group col-md-12">
                                    <asp:Label ID="Label0" runat="server" Text="Odeme" Font-Bold="True" Font-Size="Large" Visible="True">Ödeme Tür:</asp:Label>
                                      <asp:DropDownList ID="dpOdemeTur" runat="server" CssClass="textbox">
                </asp:DropDownList>
              
                                </div>
                                  
                               <div class="form-group col-md-12">
                                    <asp:Label ID="Label122" runat="server" Text="Arac" Font-Bold="True" Font-Size="Large" Visible="True">Ziyaret Sayısı:</asp:Label>
                               <asp:TextBox ID="txtZiyaretSayi" runat="server" CssClass="textbox"  placeholder="Müşteri Ziyaret Sayısı">1</asp:TextBox>
              
                                </div>
                             
                             <div class="form-group col-md-12">
                                    <asp:Label ID="Label21" runat="server" Text="Bölge" Font-Bold="True" Font-Size="Large" Visible="True">Bölge:</asp:Label> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtBolge" runat="server" CssClass="textbox" placeholder="Bölge"></asp:TextBox>
              
                                </div>
                             <div class="form-group col-md-12">
                                    <asp:Label ID="Label10" runat="server" Text="Açıklama" Font-Bold="True" Font-Size="Large" Visible="True">Açıklama:</asp:Label>
                                    <asp:TextBox ID="txtAciklama" runat="server" CssClass="textbox" TextMode="MultiLine" placeholder="Açıklama"></asp:TextBox>
              
                                </div>

                    </div>
                  </div>
         <div class="col-md-6 col-sm-6">
              <div class="row">
              <div class="form-group col-md-12">
                                    <asp:Label ID="Label2" runat="server" Text="Firma Adı" Font-Bold="True" Font-Size="Large" Visible="True">Firma Adı:</asp:Label>
                                    <asp:TextBox ID="txtMusteriAd" runat="server" CssClass="textbox" placeholder="Firma Adı"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFValidator1" runat="server" ControlToValidate="txtVergiNo" ErrorMessage="*" ForeColor="Red">Zorunlu Alan</asp:RequiredFieldValidator>
              </div>
              <div class="form-group col-md-12">
                                    <asp:Label ID="Label3" runat="server" Text="Yetkili" Font-Bold="True" Font-Size="Large" Visible="True">Yetkili:</asp:Label> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtYetkili" runat="server" CssClass="textbox" placeholder="Yetkili Kişi"></asp:TextBox>
              
              </div>
              <div class="form-group col-md-12">
                                    <asp:Label ID="Label5" runat="server" Text="Rakip" Font-Bold="True" Font-Size="Large" Visible="True">Rakip Firma:</asp:Label>
                                    <asp:TextBox ID="txtCalistigiFirma" runat="server" CssClass="textbox" placeholder="Rakip Firma"></asp:TextBox>
              
              </div>
              <div class="form-group col-md-12">
                                    <asp:Label ID="Label7" runat="server" Text="Telefon" Font-Bold="True" Font-Size="Large" Visible="True">Telefon:</asp:Label>
                                    <asp:TextBox ID="txtTelefon" runat="server" CssClass="textbox" placeholder="Telefon Numarası"></asp:TextBox>
              
              </div>
              <div class="form-group col-md-12">
                                    <asp:Label ID="Label8" runat="server" Text="Email" Font-Bold="True" Font-Size="Large" Visible="True">E mail:</asp:Label>&nbsp;&nbsp;
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" placeholder="E mail"></asp:TextBox>
              
              </div>
              <div class="form-group col-md-12">
                                    <asp:Label ID="Label9" runat="server" Text="Arac" Font-Bold="True" Font-Size="Large" Visible="True">Araç Sayısı:</asp:Label>
                                    <asp:TextBox ID="txtAracSayi" runat="server" CssClass="textbox" placeholder="Araç Sayısı"></asp:TextBox>
              
              </div>
              <div class="form-group col-md-12">
                                    <asp:Label ID="Label11" runat="server" Text="Dagitici" Font-Bold="True" Font-Size="Large" Visible="True">Dağıtıcı:</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <asp:DropDownList ID="dpDagitici" runat="server" CssClass="textbox">
                </asp:DropDownList>
              
              </div>
              <div class="form-group col-md-12">
                            <asp:Label ID="Label14" runat="server" Text="sozlesmebitis" Font-Bold="True" Font-Size="Large" Visible="True">Sözleşme Bitiş Tarihi:</asp:Label>
                                    <asp:TextBox ID="txtSozlesmeBitisTarih" runat="server" CssClass="textbox" placeholder="Sözleşme Bitiş"></asp:TextBox>
              </div>   

       </div>
            
          
    
    </div>
         <div class="form-group col-md-12 col-sm-12" style="align-items:center; ">
                <asp:Button ID="btnKaydet" runat="server" Text="Kaydet"  OnClick="btnKaydet_Click" Font-Bold="True" Font-Size="Large"  />

          </div>
         </div>
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </div>
 

</asp:Content>
