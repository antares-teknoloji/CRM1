using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crm
{
    public partial class Musteri_Basvuru : System.Web.UI.Page
    {
      
     
            SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
            SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        SqlConnection connAktarim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiAktarim"].ConnectionString);
        SqlConnection connWeb = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiWeb"].ConnectionString);
        SqlDataAdapter adpRandevu, adpSozlesmeBitis, adpCariListe;
            DataTable tblRandevu, tblSozlesmeBitis, tblCariListe;


            
            protected void Page_Load(object sender, EventArgs e)
            {
                Basvuru();
            }
            private void Basvuru()
            {
                adpCariListe = new SqlDataAdapter("select FIRMA AS [FİRMA],AD_SOYAD AS [AD SOYAD],IL AS [İL],ADRES,TELEFON,EMAIL,ARAC_SAYISI AS [ARAÇ SAYISI],AYLIK_TUKETIM_TL AS [AYLIK TÜKETİM TL],VERGI_NO AS [VERGİ NO],MESAJ from TTS_KAYIT_MUSTERİ", connWeb);
                tblCariListe = new DataTable();
                adpCariListe.Fill(tblCariListe);
                this.grdCari.DataSource = tblCariListe;
                this.grdCari.DataBind();
            }   

        }
    }
