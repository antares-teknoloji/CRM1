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
    public partial class Yonetim : System.Web.UI.Page
    {
        SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
        SqlConnection conn= new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        SqlDataAdapter adpRandevu, adpSozlesmeBitis, adpCariListe;
        DataTable tblRandevu, tblSozlesmeBitis, tblCariListe;

       

        protected void Page_Load(object sender, EventArgs e)
        {
            AlimiOlmayanCari();
            SozlesmeBitis();
            YaklasanRandevu();
        }
        private void AlimiOlmayanCari()
        {
            adpCariListe = new SqlDataAdapter("SELECT CODE AS [CARİ KOD],DEFINITION_ AS [CARİ AD],[SON FATURA TARİHİ]= (SELECT MAX(DATE_) FROM LG_316_01_INVOICE INV WHERE INV.CLIENTREF=CL.LOGICALREF AND TRCODE IN  (7,8) AND INV.BRANCH='120') FROM LG_316_CLCARD CL WHERE LOGICALREF NOT IN (SELECT CLIENTREF FROM LG_316_01_INVOICE WHERE TRCODE IN  (7,8) AND DATE_>=CONVERT(DATETIME,'" + DateTime.Now.AddDays(-30) + "',104) AND BRANCH ='120') AND LOGICALREF IN (SELECT CLIENTREF FROM LG_316_01_INVOICE WHERE TRCODE IN  (7,8) AND DATE_>=CONVERT(DATETIME,'" + DateTime.Now.AddDays(-395) + "',104) AND  DATE_<=CONVERT(DATETIME,'" + DateTime.Now.AddDays(-30) + "',104) AND BRANCH ='120') AND CODE LIKE '120%'  AND ACTIVE=0 ORDER BY [SON FATURA TARİHİ] DESC", conn);
            tblCariListe = new DataTable();
            adpCariListe.Fill(tblCariListe);
            this.grdCari.DataSource = tblCariListe;
            this.grdCari.DataBind();
        }

        private void SozlesmeBitis()
        {
            adpSozlesmeBitis = new SqlDataAdapter("SELECT CONVERT(VARCHAR,SOZLESMEBITIS,104) AS [TARİH],FIRMA AS [FİRMA],YETKILI AS [YETKİLİ],EMAIL AS [E MAİL],DAGITICI AS [BAYİ],SATISPERSONEL AS [SATIŞ PERSONEL] FROM MUSTERI_ZIYARET  WHERE SOZLESMEBITIS>=GETDATE() AND  SOZLESMEBITIS<=DATEADD(DAY,30,GETDATE()) AND DAGITICI='SHELL' ", connBizim);
            tblSozlesmeBitis = new DataTable();
            adpSozlesmeBitis.Fill(tblSozlesmeBitis);
            this.grdSozlesmeBitis.DataSource = tblSozlesmeBitis;
            this.grdSozlesmeBitis.DataBind();


            if (tblSozlesmeBitis.Rows.Count > 0)
            {
                grdSozlesmeBitis.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

                //Attribute to hide column in Phone.        
                grdSozlesmeBitis.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
                grdSozlesmeBitis.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
                grdSozlesmeBitis.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
                grdSozlesmeBitis.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
                grdSozlesmeBitis.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";

                //Adds THEAD and TBODY to GridView.
                grdSozlesmeBitis.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }
        private void YaklasanRandevu()
        {
            adpRandevu = new SqlDataAdapter("SELECT CONVERT(VARCHAR,TARIH,104) AS [TARİH],FIRMA AS [FİRMA],YETKILI AS [YETKİLİ],EMAIL AS [E MAİL],DAGITICI AS [BAYİ],SATISPERSONEL AS [SATIŞ PERSONEL] FROM MUSTERI_RANDEVU  WHERE TARIH>=GETDATE() AND  TARIH<=DATEADD(DAY,7,GETDATE()) AND DAGITICI='SHELL' ", connBizim);
            tblRandevu = new DataTable();
            adpRandevu.Fill(tblRandevu);
            this.grdYaklasanRandevu.DataSource = tblRandevu;
            this.grdYaklasanRandevu.DataBind();



            if (tblRandevu.Rows.Count > 0)
            {

                grdYaklasanRandevu.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

                //Attribute to hide column in Phone.        
                grdYaklasanRandevu.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
                grdYaklasanRandevu.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
                grdYaklasanRandevu.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
                grdYaklasanRandevu.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
                grdYaklasanRandevu.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";

                //Adds THEAD and TBODY to GridView.
                grdYaklasanRandevu.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }
    }
}