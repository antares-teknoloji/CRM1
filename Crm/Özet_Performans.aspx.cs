using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crm
{
    public partial class Özet_Performans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }


        SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiAktarim"].ConnectionString);
  
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            VeriGetir();
        }
        private void VeriGetir()
        {
            
            SqlDataAdapter adpVeri = new SqlDataAdapter("SELECT SATISPERSONEL ,CARIAD      ,TAAHHUTLITRE ,CONVERT(VARCHAR(10),SOZLESMEBASLANGIC,104) AS SOZLESMEBASLANGIC, CONVERT(VARCHAR(10),SOZLESMEBITIS,104) AS SOZLESMEBITIS FROM TTSPORTAL_CARIBILGI WHERE TAAHHUTLITRE>='0' AND TARIH>=CONVERT(DATETIME,'" + txtFromDate.Text + "',104) AND TARIH<=CONVERT(DATETIME,'" + txtToDate.Text + "',104) ORDER BY SOZLESMEBASLANGIC desc", conn);
            DataTable tblVeri = new DataTable();
            adpVeri.Fill(tblVeri);
            this.grdVeri.DataSource = tblVeri;
            this.grdVeri.DataBind();
           
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //return;
        }
        protected void BtnYazdir_Click(object sender, ImageClickEventArgs e)
        {
            if (grdVeri.Rows.Count > 0)
            {
                grdVeri.PagerSettings.Visible = false;
                //grdVeri.DataBind();
                //  VeriGetir();
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                grdVeri.RenderControl(hw);
                string gridHTML = sw.ToString().Replace("\"", "'")
                    .Replace(System.Environment.NewLine, "");
                StringBuilder sb = new StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload = new function(){");
                sb.Append("var printWin = window.open('', '', 'left=0");
                sb.Append(",top=0,width=1000,height=600,status=0');");
                sb.Append("printWin.document.write(\"");
                sb.Append(gridHTML);
                sb.Append("\");");
                sb.Append("printWin.document.close();");
                sb.Append("printWin.focus();");
                sb.Append("printWin.print();");
                sb.Append("printWin.close();};");
                sb.Append("</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
                grdVeri.PagerSettings.Visible = true;
                grdVeri.DataBind();
                VeriGetir();
            }
        }
        protected void BtnExcel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Hilmi Beken Cari Ekstre Avantaj Kaybı.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grdVeri.AllowPaging = false;
            //grdVeri.DataBind();
            //Başlık rowlarının arka planını beyaz olarak ayarlıyoruz. 
            grdVeri.HeaderRow.Style.Add("background-color", "#FFFFFF");
            //Şimdide hücre başlıklarının arka planını yeşil yapıyoruz 
            grdVeri.HeaderRow.Cells[0].Style.Add("background-color", "green");
            grdVeri.HeaderRow.Cells[1].Style.Add("background-color", "green");
            grdVeri.HeaderRow.Cells[2].Style.Add("background-color", "green");
            grdVeri.HeaderRow.Cells[3].Style.Add("background-color", "green");
            grdVeri.HeaderRow.Cells[4].Style.Add("background-color", "green");
            
            for (int i = 0; i < grdVeri.Rows.Count; i++)
            {
                GridViewRow row = grdVeri.Rows[i];
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
                    
                }
            }
            grdVeri.RenderControl(hw);
            //Sayısal formatların bozuk çıkmaması için format belirliyoruz 
            string style = @" ";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
       
    }
}