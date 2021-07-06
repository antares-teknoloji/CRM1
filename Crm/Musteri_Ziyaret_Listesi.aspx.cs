using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crm
{
    public partial class Musteri_Ziyaret_Listesi : System.Web.UI.Page
    {
        SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
        SqlDataAdapter adpZiyaretListe;
        DataTable tblZiyaretListe;
        string navigateURL, kullaniciTp;
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
                Kullanici();
                VeriGetir( kullaniciTp, txtFirma.Text, txtBolge.Text,"01.01.2020", "31.12.2030");
            
        }
        private void VeriGetir( string yetki, string Firma, string Bolge,string bastar, string bittar)
        {
            if (yetki == "admin")
            {
                adpZiyaretListe = new SqlDataAdapter("SELECT ID,CONVERT(VARCHAR,TARIH,104) AS [TARİH],FIRMA AS [FİRMA],YETKILI AS [YETKİLİ],TAAHHUTLITRE AS [TAAHHÜT M3],DURUM,ARACSAYISI AS [ARAÇ SAYISI],DAGITICI AS [BAYİ],CALISTIGIFIRMA AS [RAKİP FİRMA],SATISPERSONEL AS [SATIŞ PERSONEL],BOLGE AS [BÖLGE] FROM MUSTERI_ZIYARET WHERE TARIH >=CONVERT(DATETIME,'" + bastar + "',104) AND TARIH <=CONVERT(DATETIME,'" + bittar + "',104) AND FIRMA LIKE '%" + Firma + "%' AND BOLGE LIKE '%" + Bolge + "%' AND SATISPERSONEL <>'BATUHAN' AND DAGITICI='SHELL' ORDER BY  TARIH desc", connBizim);

            }
            else
            {
                adpZiyaretListe = new SqlDataAdapter("SELECT ID,CONVERT(VARCHAR,TARIH,104) AS [TARİH],FIRMA AS [FİRMA],YETKILI AS [YETKİLİ],TAAHHUTLITRE AS [TAAHHÜT M3],DURUM,ARACSAYISI AS [ARAÇ SAYISI],DAGITICI AS [BAYİ],CALISTIGIFIRMA AS [RAKİP FİRMA],SATISPERSONEL AS [SATIŞ PERSONEL],BOLGE AS [BÖLGE] FROM MUSTERI_ZIYARET WHERE TARIH >=CONVERT(DATETIME,'" + bastar + "',104) AND TARIH <=CONVERT(DATETIME,'" + bittar + "',104)  AND SATISPERSONEL='" + Session["Kullanici"].ToString() + "' AND FIRMA LIKE '%" + Firma + "%'  AND BOLGE LIKE '%" + Bolge + "%' AND DAGITICI='SHELL' ORDER BY  TARIH desc", connBizim);

            }

            tblZiyaretListe = new DataTable();
            adpZiyaretListe.Fill(tblZiyaretListe);
            this.grdZiyaretListe.DataSource = tblZiyaretListe;
            this.grdZiyaretListe.DataBind();
            ViewState["dirState"] = tblZiyaretListe;
            ViewState["sortdr"] = "Asc";
            this.grdZiyaretListe.Columns[0].Visible = false;
            Session["KONTROL"] = "Kontrol";

            grdZiyaretListe.HeaderRow.Cells[2].Attributes["data-class"] = "expand";

            //Attribute to hide column in Phone.        
            grdZiyaretListe.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
            grdZiyaretListe.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            grdZiyaretListe.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
            grdZiyaretListe.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
            grdZiyaretListe.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
            grdZiyaretListe.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";
            grdZiyaretListe.HeaderRow.Cells[8].Attributes["data-hide"] = "phone";
            grdZiyaretListe.HeaderRow.Cells[9].Attributes["data-hide"] = "phone";
            grdZiyaretListe.HeaderRow.Cells[10].Attributes["data-hide"] = "phone";

            //grdZiyaretListe.HeaderRow.Cells[8].Attributes["data-hide"] = "phone";

            grdZiyaretListe.HeaderRow.TableSection = TableRowSection.TableHeader;
         
        }
        private void Kullanici()
        {
            SqlDataAdapter adpKullanici = new SqlDataAdapter("SELECT YETKI FROM KULLANICI WHERE KULLANICIAD = '" + Session["Kullanici"].ToString() + "'", connBizim);
            DataTable tblKulllanici = new DataTable();
            adpKullanici.Fill(tblKulllanici);
            kullaniciTp = tblKulllanici.Rows[0][0].ToString();
        }
       
        protected void grdZiyaretListe_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }


        protected void BtnSorgula_Click(object sender, EventArgs e)
        {

            VeriGetir( kullaniciTp, txtFirma.Text, txtBolge.Text,txtDtBas.Text, txtDtBit.Text);

        }
        protected void grdZiyaretListe_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Desc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                grdZiyaretListe.DataSource = dtrslt;
                grdZiyaretListe.DataBind();
                
            }

        }
        protected void grdZiyaretListe_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gvRow = grdZiyaretListe.Rows[index];
            int rowIndex = index;

            Session["ID"] = tblZiyaretListe.Rows[rowIndex][0].ToString();
            if (e.CommandName == "FİRMA")
            {
                navigateURL = "Musteri_Ziyaret.aspx";
            }
            string target = "_blank";
            string windowProperties = "status=0, menubar=0, toolbar=0";
            string scriptText = "window.open('" + navigateURL + "','" + target + "','" + windowProperties + "')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "eşsizAnahtar", scriptText, true);
            Response.Redirect(navigateURL);
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

       

        protected void BtnExcel_Click(object sender, ImageClickEventArgs e)
        {
            
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=CRM Müşteri Ziyaret Listesi.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            Response.ContentEncoding = System.Text.Encoding.Unicode;
            Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
           
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdZiyaretListe.AllowPaging = false;
            //grdZiyaretListe.DataBind();
            //Başlık rowlarının arka planını beyaz olarak ayarlıyoruz. 
            grdZiyaretListe.HeaderRow.Style.Add("background-color", "#FFFFFF");
            //Şimdide hücre başlıklarının arka planını yeşil yapıyoruz 
            grdZiyaretListe.HeaderRow.Cells[0].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[1].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[2].Style.Add("background-color", "green");
            //grdZiyaretListe.HeaderRow.Cells[3].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[3].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[4].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[5].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[6].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[7].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[8].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[9].Style.Add("background-color", "green");
            grdZiyaretListe.HeaderRow.Cells[10].Style.Add("background-color", "green");




            for (int i = 0; i < grdZiyaretListe.Rows.Count; i++)
            {
                GridViewRow row = grdZiyaretListe.Rows[i];
                //Arka plan rengini beyaz olarak ayarlıyoruz 
                row.BackColor = System.Drawing.Color.White;
                //Her row’un text özelliğine bir class atıyoruz 
                row.Attributes.Add("class", "textmode");
                //Biraz daha güzellik katmak için 2. Row’ların arka planlarına farklı bir renk veriyoruz 
                if (i % 2 != 0)
                {
                    row.Cells[0].Style.Add("background-color", "#C2D69B");
                    row.Cells[1].Style.Add("background-color", "#C2D69B");
                    row.Cells[2].Style.Add("background-color", "#C2D69B");
                    row.Cells[3].Style.Add("background-color", "#C2D69B");
                    row.Cells[4].Style.Add("background-color", "#C2D69B");
                    row.Cells[5].Style.Add("background-color", "#C2D69B");
                    row.Cells[6].Style.Add("background-color", "#C2D69B");
                    row.Cells[7].Style.Add("background-color", "#C2D69B");
                    row.Cells[8].Style.Add("background-color", "#C2D69B");
                    row.Cells[9].Style.Add("background-color", "#C2D69B");
                    row.Cells[10].Style.Add("background-color", "#C2D69B");

                }
            }

            grdZiyaretListe.RenderControl(hw);
            //Sayısal formatların bozuk çıkmaması için format belirliyoruz 
            string style = @" ";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
            


        }
       


      
    }
}