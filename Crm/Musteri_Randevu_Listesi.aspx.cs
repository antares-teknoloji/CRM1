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
    public partial class Musteri_Randevu_Listesi : System.Web.UI.Page
    {
        SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
        SqlDataAdapter adpRandevuListe;
        DataTable tblRandevuListe;
        string navigateURL, kullaniciTp;
        protected void Page_Load(object sender, EventArgs e)
        {
            Kullanici();
            VeriGetir("01.01.2019", "31.12.2030", kullaniciTp, txtFirma.Text);
        }
        private void Kullanici()
        {
            SqlDataAdapter adpKullanici = new SqlDataAdapter("SELECT YETKI FROM KULLANICI WHERE KULLANICIAD = '" + Session["Kullanici"].ToString() + "'", connBizim);
            DataTable tblKulllanici = new DataTable();
            adpKullanici.Fill(tblKulllanici);
            kullaniciTp = tblKulllanici.Rows[0][0].ToString();
        }

        private void VeriGetir(string bastar, string bittar, string yetki, string Firma)
        {
            if (yetki == "admin")
            {
                adpRandevuListe = new SqlDataAdapter("SELECT ID,CONVERT(VARCHAR,TARIH,104) AS [TARİH],FIRMA AS [FİRMA],YETKILI AS [YETKİLİ],EMAIL AS [E MAİL],DAGITICI AS [BAYİ],SATISPERSONEL AS [SATIŞ PERSONEL] FROM MUSTERI_RANDEVU  WHERE TARIH >=CONVERT(DATETIME,'" + bastar.ToString() + "',104) AND TARIH <=CONVERT(DATETIME,'" + bittar + "',104) AND FIRMA LIKE '%" + Firma + "%' AND SATISPERSONEL <> 'BATUHAN' AND DAGITICI='SHELL' ORDER BY  TARIH desc", connBizim);
            }
            else
            {
             
                adpRandevuListe = new SqlDataAdapter("SELECT ID,CONVERT(VARCHAR,TARIH,104) AS [TARİH],FIRMA AS [FİRMA],YETKILI AS [YETKİLİ],EMAIL AS [E MAİL],DAGITICI AS [BAYİ],SATISPERSONEL AS [SATIŞ PERSONEL] FROM MUSTERI_RANDEVU   WHERE TARIH >=CONVERT(DATETIME,'" + bastar.ToString() + "',104) AND TARIH <=CONVERT(DATETIME,'" + bittar + "',104) AND SATISPERSONEL='" + Session["Kullanici"].ToString() + "' AND FIRMA LIKE '%" + Firma + "%' AND DAGITICI='SHELL' ORDER BY  TARIH desc", connBizim);
            }
            tblRandevuListe = new DataTable();
            adpRandevuListe.Fill(tblRandevuListe);
            this.grdRandevuListe.DataSource = tblRandevuListe;
            this.grdRandevuListe.DataBind();
            this.grdRandevuListe.Columns[0].Visible = false;

            grdRandevuListe.HeaderRow.Cells[2].Attributes["data-class"] = "expand";

            //Attribute to hide column in Phone.        
            grdRandevuListe.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
            //grdRandevuListe.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
            grdRandevuListe.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            grdRandevuListe.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
            grdRandevuListe.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
            grdRandevuListe.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
            grdRandevuListe.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";

            grdRandevuListe.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        protected void grdRandevuListe_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gvRow = grdRandevuListe.Rows[index];
            int rowIndex = index;
            Session["IDRANDEVU"] = tblRandevuListe.Rows[rowIndex][0].ToString();
            Session["KONTROLRANDEVU"] = "Kontrol";
            if (e.CommandName == "FİRMA")
            {
                navigateURL = "Musteri_Randevu.aspx";
            }
            string target = "_blank";
            string windowProperties = "status=0, menubar=0, toolbar=0";
            string scriptText = "window.open('" + navigateURL + "','" + target + "')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "eşsizAnahtar", scriptText, true);
            Response.Redirect(navigateURL);
        }
        protected void grdRandevuListe_RowCreated(object sender, GridViewRowEventArgs e)
        {
           
        }

       

        protected void btnSorgula_Click(object sender, EventArgs e)
        {
            if (txtDtBas.Text == "" || txtDtBit.Text == "")
            {
                VeriGetir("01.01.2019", "01.01.2030", kullaniciTp, txtFirma.Text);
            }
            else
            {
                VeriGetir(txtDtBas.Text, txtDtBit.Text, kullaniciTp, txtFirma.Text);
            }
        }
    }
}