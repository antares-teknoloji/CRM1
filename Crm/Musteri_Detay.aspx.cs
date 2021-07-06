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
    public partial class Musteri_Detay : System.Web.UI.Page
    {
        SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            VeriGetir();
        }
        private void VeriGetir( )
        {
            SqlDataAdapter adpVeri = new SqlDataAdapter("SELECT CONVERT(VARCHAR(10),TARIH, 104) as [TARİH],FIRMA AS [FİRMA],YETKILI AS [YETKİLİ],TAAHHUTLITRE AS [TAAHHÜT M3],DURUM,ARACSAYISI AS [ARAÇ SAYISI],DAGITICI AS [BAYİ],CALISTIGIFIRMA AS [RAKİP FİRMA],SATISPERSONEL AS [SATIŞ PERSONEL],ACIKLAMA AS [AÇIKLAMA],ZIYARETSAYISI AS [ZİYARET SAYISI],CONVERT(VARCHAR(10),SOZLESMEBITIS, 104) AS [SÖZLEŞME BİTİŞ]  FROM[CRM].[dbo].[MUSTERI_ZIYARET]  where FIRMA='" + Session["Firma"].ToString() + "'", connBizim);
            DataTable tblVeri = new DataTable();
            adpVeri.Fill(tblVeri);
            this.grdDetay.DataSource = tblVeri;
            this.grdDetay.DataBind();

        }
    }
}