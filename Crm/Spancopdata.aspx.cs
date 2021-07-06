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
    public partial class Spancopdata : System.Web.UI.Page
    {
        SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
        SqlDataAdapter adpSpancop;
        DataTable tblSpancop;
        protected void Page_Load(object sender, EventArgs e)
        {
            VeriGetir("01.01.2019", "31.12.2030");
        }
        private void VeriGetir(string bastar, string bittar)
        {
            adpSpancop = new SqlDataAdapter("SELECT SATISPERSONEL AS [SATISTEMSILCI],FIRMA AS [MUSTERI],TAAHHUTLITRE AS [SENELIKTUKETIM],ARACSAYISI,DURUM FROM MUSTERI_ZIYARET WHERE TARIH >=CONVERT(DATETIME,'" + bastar.ToString() + "',104) AND TARIH <=CONVERT(DATETIME,'" + bittar + "',104) ORDER BY  TARIH desc", connBizim);
            tblSpancop = new DataTable();
            adpSpancop.Fill(tblSpancop);
            this.grdVeri.DataSource = tblSpancop;
            this.grdVeri.DataBind();

            grdVeri.HeaderRow.Cells[1].Attributes["data-class"] = "expand";

            //Attribute to hide column in Phone.        
            grdVeri.HeaderRow.Cells[0].Attributes["data-hide"] = "phone";
            grdVeri.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
            grdVeri.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            grdVeri.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";


            //Adds THEAD and TBODY to GridView.
            grdVeri.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        protected void btnYazdir_Click(object sender, ImageClickEventArgs e)
        {
            if (grdVeri.Rows.Count > 0)
            {
                grdVeri.PagerSettings.Visible = false;

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
                VeriGetir("2019-01-01", "2019-12-31");
            }
        }
        protected void btnExcel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Spancop Data.xls");
            Response.Charset = "";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254");
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
        protected void btnPdf_Click(object sender, ImageClickEventArgs e)
        {

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //return;
        }
        //dateString, 
        //System.Globalization.CultureInfo.InvariantCulture
        protected void imgBitTar_Click(object sender, ImageClickEventArgs e)
        {
            //DateTime dob = DateTime.Parse(Request.Form[txtBitisTarih.UniqueID]);
        }

        protected void imgDate_Click(object sender, ImageClickEventArgs e)
        {
            //  DateTime dob = DateTime.Parse(Request.Form[txtTarih.UniqueID]);
        }
        protected void btnSorgula_Click(object sender, EventArgs e)
        {
            VeriGetir(txtDtBas.Text, txtDtBit.Text);
        }
    }
}