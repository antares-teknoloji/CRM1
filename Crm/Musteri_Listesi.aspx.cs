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
    public partial class Musteri_Listesi : System.Web.UI.Page
    {
        SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
        DataTable tblVeri;
        string navigateURL, kullaniciTp;
        protected void Page_Load(object sender, EventArgs e)
        {
            Kullanici();
            VeriGetirir(kullaniciTp,txtsatispersonel.Text,txtFirma.Text);
            
        }
        private void VeriGetirir(string yetki,string satispersonel,string Firma)

        {
            if(yetki == "admin")
            {
                SqlDataAdapter adpVeri = new SqlDataAdapter("Select CONVERT(VARCHAR(10),TARIH,104) as [TARİH], SATISPERSONEL AS [SATIŞ PERSONEL], FIRMA AS [FİRMA] , Count(FIRMA) AS [ZİYARET SAYISI] From MUSTERI_ZIYARET WHERE FIRMA LIKE '%" + Firma + "%' AND SATISPERSONEL <>'BATUHAN' AND SATISPERSONEL LIKE '%" + satispersonel  + "%' Group By FIRMA,SATISPERSONEL,TARIH Having Count(*) >= 1 order by TARIH desc   ", connBizim);
                tblVeri = new DataTable();
                adpVeri.Fill(tblVeri);
                this.grdMusteri.DataSource = tblVeri;
                this.grdMusteri.DataBind();
            }
            else
            {
                SqlDataAdapter adpVeri = new SqlDataAdapter("Select SATISPERSONEL AS [SATIŞ PERSONEL], FIRMA AS [FİRMA] , Count(FIRMA) AS [ZİYARET SAYISI] From MUSTERI_ZIYARET WHERE FIRMA LIKE '%" + Firma + "%' AND SATISPERSONEL='" + Session["Kullanici"].ToString() + "' Group By FIRMA,SATISPERSONEL Having Count(*) > 1 ", connBizim);
                tblVeri = new DataTable();
                adpVeri.Fill(tblVeri);
                this.grdMusteri.DataSource = tblVeri;
                this.grdMusteri.DataBind();
            }



        }
        private void Kullanici()
        {
            SqlDataAdapter adpKullanici = new SqlDataAdapter("SELECT YETKI FROM KULLANICI WHERE KULLANICIAD = '" + Session["Kullanici"].ToString() + "'", connBizim);
            DataTable tblKulllanici = new DataTable();
            adpKullanici.Fill(tblKulllanici);
            kullaniciTp = tblKulllanici.Rows[0][0].ToString();
        }
        protected void grdMusteri_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gvRow = grdMusteri.Rows[index];
            int rowIndex = index;

                     
            Session["Firma"] = tblVeri.Rows[rowIndex][2].ToString();
            if (e.CommandName == "FİRMA")
            {
                navigateURL = "Musteri_Detay.aspx";
            }

            string target = "_blank";
            string windowProperties = "status=0, menubar=0, toolbar=0";
            string scriptText = "window.open('" + navigateURL + "','" + target + "','" + windowProperties + "')";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "eşsizAnahtar", scriptText, true);
            Response.Redirect(navigateURL);
        }
        protected void btnSorgula_Click(object sender, EventArgs e)
        {
            VeriGetirir(kullaniciTp, txtsatispersonel.Text,txtFirma.Text);
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        protected void btnExcel_Click(object sender, ImageClickEventArgs e)
        { 
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=CRM Satış Ekip Ziyaret Raporu.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            Response.ContentEncoding = System.Text.Encoding.Unicode;
            Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
           
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdMusteri.AllowPaging = false;
            //grdMusteri.DataBind();
            //Başlık rowlarının arka planını beyaz olarak ayarlıyoruz. 
            grdMusteri.HeaderRow.Style.Add("background-color", "#FFFFFF");
            //Şimdide hücre başlıklarının arka planını yeşil yapıyoruz 
            grdMusteri.HeaderRow.Cells[0].Style.Add("background-color", "green");
            grdMusteri.HeaderRow.Cells[1].Style.Add("background-color", "green");
            grdMusteri.HeaderRow.Cells[2].Style.Add("background-color", "green");
           
            for (int i = 0; i<grdMusteri.Rows.Count; i++)
            {
                GridViewRow row = grdMusteri.Rows[i];
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
                   
                   

                }
            }

            grdMusteri.RenderControl(hw);
            //Sayısal formatların bozuk çıkmaması için format belirliyoruz 
            string style = @" ";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();

            
        }

       
    }
}