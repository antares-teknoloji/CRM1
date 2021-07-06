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
    public partial class CariKart : System.Web.UI.Page
    {

        SqlConnection conn, connBizim, connAktarim;

        SqlDataAdapter adpArama;
        SqlDataAdapter adpCari;
        DataTable tblCari;
        DataTable tblArama;
        int sayi;
        string navigateURL, kullaniciTp;
        int indexOfColumn1 = 1;
        int indexOfColumn = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Kullanici();
            if (!IsPostBack)
            { VeriCek(); }
            chkOlustur();
        }
        private void VeriCek()
        {
            conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
            connAktarim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiAktarim"].ConnectionString);

            adpCari = new SqlDataAdapter("SELECT TOP 20 CODE AS [FİRMA KOD],DEFINITION_ AS [FİRMA ÜNVAN],Cast(REPLACE(ONLINELIMIT,',','.') " +
                "As decimal(15,2)) + Cast(REPLACE(OFFLINELIMIT,',','.') As decimal(15,2)) AS [MÜŞTERİ LİMİT] ,ODEMETUR AS [ÖDEME TÜR],BANKADBSKOD" +
                " AS [BANKA KODU],SHELLVADE1,TELEFON='',SHELLMUSTERIKOD AS [FİLO KODU] FROM LG_316_CLCARD CL " +
                "LEFT OUTER JOIN AKTARIM.DBO.TTSPORTAL_CARIBILGI TC  ON CL.CODE=TC.CARIKOD WHERE ACTIVE=0 AND TC.SATISPERSONEL='" + Session["İsim"].ToString() + "'" +
                "AND CODE LIKE '120%' OR ACTIVE=0 AND CODE LIKE '320%'  " +
                "GROUP BY CARIKOD,CARIAD,ODEMETUR,BANKADBSKOD,SHELLVADE1,SHELLMUSTERIKOD,ONLINELIMIT,OFFLINELIMIT,CODE,DEFINITION_,TC.SOZLESMEBASLANGIC ORDER BY TC.SOZLESMEBASLANGIC DESC", conn);
            tblCari = new DataTable();
            adpCari.Fill(tblCari);
            this.grdCari.DataSource = tblCari;
            this.grdCari.DataBind();
        }
        public void chkOlustur()
        {

        }
        protected void btnArama_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);

            adpCari = new SqlDataAdapter("SELECT TOP 20 CODE AS [FİRMA KOD],DEFINITION_ AS [FİRMA ÜNVAN],Cast(REPLACE(ONLINELIMIT,',','.') " +
                "As decimal(15,2)) + Cast(REPLACE(OFFLINELIMIT,',','.') As decimal(15,2)) AS [MÜŞTERİ LİMİT] ,ODEMETUR AS [ÖDEME TÜR],BANKADBSKOD" +
                " AS [BANKA KODU],SHELLVADE1,TELEFON='',SHELLMUSTERIKOD AS [FİLO KODU] FROM LG_316_CLCARD CL " +
                "LEFT OUTER JOIN AKTARIM.DBO.TTSPORTAL_CARIBILGI TC  ON CL.CODE=TC.CARIKOD WHERE ACTIVE=0 AND TC.SATISPERSONEL='" + Session["İsim"].ToString() + "'" +
                "AND CODE LIKE '120%' OR ACTIVE=0 AND CODE LIKE '320%'  " +
                "GROUP BY CARIKOD,CARIAD,ODEMETUR,BANKADBSKOD,SHELLVADE1,SHELLMUSTERIKOD,ONLINELIMIT,OFFLINELIMIT,CODE,DEFINITION_,TC.SOZLESMEBASLANGIC ORDER BY TC.SOZLESMEBASLANGIC DESC", conn);
            tblCari = new DataTable();
            adpCari.Fill(tblCari);
            this.grdCari.DataSource = tblCari;
            this.grdCari.DataBind();

            conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
            if (txtPlaka.Text != "")
            {
                adpArama = new SqlDataAdapter("SELECT CODE AS [FİRMA KOD],DEFINITION_ AS [FİRMA ÜNVAN],Cast(REPLACE(ONLINELIMIT,',','.') " +
                    "As decimal(15,2)) + Cast(REPLACE(OFFLINELIMIT,',','.') As decimal(15,2)) AS [MÜŞTERİ LİMİT] ,ODEMETUR " +
                    "AS [ÖDEME TÜR],BANKADBSKOD AS [BANKA KODU],SHELLVADE1,TELEFON='',SHELLMUSTERIKOD AS [FİLO KODU] " +
                    "FROM LG_316_CLCARD CL LEFT OUTER JOIN AKTARIM.DBO.TTSPORTAL_CARIBILGI TC  ON CL.CODE=TC.CARIKOD " +
                    "LEFT OUTER JOIN AKTARIM.DBO.BS_PLAKA BS ON BS.CARIKOD= CL.CODE WHERE ACTIVE=0 AND CODE LIKE '120%' " +
                    "AND BS.PLAKA LIKE '%" + txtPlaka.Text + "%' OR ACTIVE=0 AND CODE LIKE '320%' AND BS.PLAKA LIKE '%" + txtPlaka.Text + "%' AND TC.SATISPERSONEL='" + Session["İsim"].ToString() + "'GROUP BY TC.CARIKOD,CARIAD,ODEMETUR,BANKADBSKOD,SHELLVADE1,SHELLMUSTERIKOD,ONLINELIMIT,OFFLINELIMIT,CODE,DEFINITION_, ,TC.SOZLESMEBASLANGIC ORDER BY TC.SOZLESMEBASLANGIC DESC", conn);
                tblArama = new DataTable();
                adpArama.Fill(tblArama);
                this.grdCari.DataSource = tblArama;
                this.grdCari.DataBind();
                //this.grdCari.Columns[0].Visible = false;
            }
            else if (txtCariAd.Text != "")
            {
                adpArama = new SqlDataAdapter("SELECT CODE AS [FİRMA KOD],DEFINITION_ AS [FİRMA ÜNVAN],Cast(REPLACE(ONLINELIMIT,',','.')" +
                    " As decimal(15,2)) + Cast(REPLACE(OFFLINELIMIT,',','.') As decimal(15,2)) " +
                    "AS [MÜŞTERİ LİMİT] ,ODEMETUR AS [ÖDEME TÜR],BANKADBSKOD AS [BANKA KODU],SHELLVADE1,TELEFON='',SHELLMUSTERIKOD " +
                    "AS [FİLO KODU] FROM LG_316_CLCARD CL LEFT OUTER JOIN AKTARIM.DBO.TTSPORTAL_CARIBILGI TC  ON CL.CODE=TC.CARIKOD " +
                    "WHERE ACTIVE=0 AND DEFINITION_ LIKE '" + txtCariAd.Text + "%'  AND TC.SATISPERSONEL='" + Session["İsim"].ToString() + "' GROUP BY CARIKOD,CARIAD,ODEMETUR,BANKADBSKOD,SHELLVADE1,SHELLMUSTERIKOD,ONLINELIMIT,OFFLINELIMIT,CODE,DEFINITION_,TC.SOZLESMEBASLANGIC ORDER BY TC.SOZLESMEBASLANGIC DESC", conn);
                tblArama = new DataTable();
                adpArama.Fill(tblArama);
                this.grdCari.DataSource = tblArama;
                this.grdCari.DataBind();
                //this.grdCari.Columns[0].Visible = false;
            }
            else
            {
                conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
                adpCari = new SqlDataAdapter("SELECT CODE AS [FİRMA KOD],DEFINITION_ " +
                    "AS [FİRMA ÜNVAN],Cast(REPLACE(ONLINELIMIT,',','.') As decimal(15,2)) + Cast(REPLACE(OFFLINELIMIT,',','.') " +
                    "As decimal(15,2)) AS [MÜŞTERİ LİMİT] ,ODEMETUR AS [ÖDEME TÜR],BANKADBSKOD " +
                    "AS [BANKA KODU],SHELLVADE1,TELEFON='',SHELLMUSTERIKOD AS [FİLO KODU] FROM LG_316_CLCARD CL" +
                    "LEFT OUTER JOIN AKTARIM.DBO.TTSPORTAL_CARIBILGI TC  ON CL.CODE=TC.CARIKOD WHERE ACTIVE=0 AND " +
                    "CODE LIKE '120%' OR ACTIVE=0 AND CODE LIKE '320%' AND TC.SATISPERSONEL='" + Session["İsim"].ToString() + "'AND CODE LIKE '1%' OR ACTIVE=0 AND CODE LIKE '320%' GROUP BY CARIKOD,CARIAD,ODEMETUR,BANKADBSKOD,SHELLVADE1,SHELLMUSTERIKOD,ONLINELIMIT,OFFLINELIMIT,CODE,DEFINITION_,TC.SOZLESMEBASLANGIC ORDER BY TC.SOZLESMEBASLANGIC DESC", conn);
                tblCari = new DataTable();
                adpCari.Fill(tblCari);
                this.grdCari.DataSource = tblCari;
                this.grdCari.DataBind();
                //this.grdCari.Columns[0].Visible = false;
            }
        }
        private void Kullanici()
        {
            SqlConnection connBizim= new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
            

            SqlDataAdapter adpKullanici = new SqlDataAdapter("SELECT YETKI FROM KULLANICI WHERE ISIM = '" + Session["İsim"].ToString() + "'", connBizim);
            DataTable tblKulllanici = new DataTable();
            adpKullanici.Fill(tblKulllanici);
            kullaniciTp = tblKulllanici.Rows[0][0].ToString();
        }

        protected void grdCari_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            int yeniSayfaIndex = e.NewPageIndex;
            grdCari.PageIndex = yeniSayfaIndex;
            VeriCek();
        }
        protected void grdCari_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gvRow = grdCari.Rows[index];
            int rowIndex = index;
            string cariAd = HttpUtility.HtmlDecode(grdCari.Rows[rowIndex].Cells[3].Text.ToString());
            string cariRef = grdCari.Rows[rowIndex].Cells[2].Text;
            Session["CariRef"] = cariRef.ToString();
            Session["CariAd"] = cariAd;


            if (e.CommandName == "PLAKA GÖRÜNTÜLE")
            {
                navigateURL = "PlakaListe.aspx";
            }
            else
            {
                //Response.Redirect("CariGenelBilgiler.aspx");           
                navigateURL = "CariGenelBilgiler.aspx";
            }
            string target = "_blank";
            string windowProperties = "status=0, menubar=0, toolbar=0";
            string scriptText = "window.open('" + navigateURL + "','" + target + "')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "eşsizAnahtar", scriptText, true);
        }
        protected void grdCari_RowCreated(object sender, GridViewRowEventArgs e)
        {
            try
            {
                //e.Row.Cells[3].Visible = false;
            }
            catch (Exception)
            {

            }
        }
        protected void grdCari_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > indexOfColumn)
            {
                e.Row.Cells[indexOfColumn].Width = 80;
                e.Row.Cells[indexOfColumn].Height = 40;
                e.Row.Cells[indexOfColumn1].Width = 80;
                e.Row.Cells[indexOfColumn1].Height = 40;
            }
        }

    }
}