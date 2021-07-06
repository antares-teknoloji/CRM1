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
    public partial class VergiNoGiris : System.Web.UI.Page
    {
        SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
        SqlDataAdapter adpDurum, adpDagitici, adpOdemeTur;
        DataTable tblDurum, tblDagitici, tblOdemeTUr;


        protected void imgDate_Click(object sender, ImageClickEventArgs e)
        {

        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {


                if (!string.IsNullOrEmpty(Session["ID"].ToString()))
                {

                    SqlCommand cmdGuncelle = new SqlCommand("UPDATE MUSTERI_ZIYARET SET VERGINO=@VERGINO FROM MUSTERI_ZIYARET WHERE ID='" + Session["ID"].ToString() + "'", connBizim);
                 
                    cmdGuncelle.Parameters.AddWithValue("@VERGINO", txtVergiNo.Text);
                
                    connBizim.Open();
                    cmdGuncelle.ExecuteNonQuery();
                    connBizim.Close();
                    Session["ID"] = "";
                    {
                        //Insert record here.

                        //Display success message.
                        string message = "Kayıt başarılı.";
                        string script = "window.onload = function(){ alert('";
                        script += message;
                        script += "')};";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                       
                    }
                
                }

               

            }
            catch (Exception ex)
            {

            }



        }



        void fillLists()
        {

            #region teklif durum geliyor
            adpDurum = new SqlDataAdapter("SELECT DURUM FROM TEKLIF_DURUM", connBizim);
            tblDurum = new DataTable();
            adpDurum.Fill(tblDurum);
            foreach (DataRow item in tblDurum.Rows)
            {
                DpDurum.Items.Add(item[0].ToString());
            }
            #endregion
            #region dağıtım bayiler geliyor
            adpDagitici = new SqlDataAdapter("SELECT DAGITICI FROM DAGITIM_BAYI", connBizim);
            tblDagitici = new DataTable();
            adpDagitici.Fill(tblDagitici);
            foreach (DataRow item in tblDagitici.Rows)
            {
                dpDagitici.Items.Add(item[0].ToString());
            }
            #endregion
            #region ödeme türleri geliyor
            adpOdemeTur = new SqlDataAdapter("SELECT ODEMETUR FROM ODEME_TUR", connBizim);
            tblOdemeTUr = new DataTable();
            adpOdemeTur.Fill(tblOdemeTUr);
            foreach (DataRow item in tblOdemeTUr.Rows)
            {
                dpOdemeTur.Items.Add(item[0].ToString());
            }
            #endregion
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtTarih.Text = DateTime.Today.ToString().Substring(0, 10);
                fillLists();
                try
                {


                    if (!string.IsNullOrEmpty(Session["ID"].ToString()))
                    {
                        #region alanlar dolduruluyor
                        SqlDataAdapter adpGuncelleme = new SqlDataAdapter("SELECT * FROM MUSTERI_ZIYARET WHERE ID='" + Session["ID"].ToString() + "'", connBizim);
                        DataTable tblGuncelleme = new DataTable();
                        adpGuncelleme.Fill(tblGuncelleme);
                        txtTarih.Text = tblGuncelleme.Rows[0][1].ToString().Substring(0, 10);
                        txtYetkili.Text = tblGuncelleme.Rows[0][3].ToString();
                        txtMusteriAd.Text = tblGuncelleme.Rows[0][2].ToString();
                        txtTaahhutLitre.Text = tblGuncelleme.Rows[0][4].ToString();
                        txtCalistigiFirma.Text = tblGuncelleme.Rows[0][5].ToString();
                        DpDurum.Text = tblGuncelleme.Rows[0][7].ToString();
                        txtTelefon.Text = tblGuncelleme.Rows[0][6].ToString();
                        txtEmail.Text = tblGuncelleme.Rows[0][8].ToString();
                        txtAracSayi.Text = tblGuncelleme.Rows[0][9].ToString();
                        dpOdemeTur.Text = tblGuncelleme.Rows[0][10].ToString();
                        dpDagitici.Text = tblGuncelleme.Rows[0][11].ToString();
                        txtAciklama.Text = tblGuncelleme.Rows[0][13].ToString();
                        txtBolge.Text = tblGuncelleme.Rows[0][14].ToString();
                        txtZiyaretSayi.Text = tblGuncelleme.Rows[0][15].ToString();
                        txtSozlesmeBitisTarih.Text = tblGuncelleme.Rows[0][16].ToString();
                        txtVergiNo.Text = tblGuncelleme.Rows[0][17].ToString();
                        #endregion
                        //Session["ID"] = "";
                    }
                }
                catch (Exception)
                {

                }
            }

            #region randevudan gelen alanları doldurur
            if (!string.IsNullOrEmpty(Request.QueryString["TARIH"]))
            {
                if (!IsPostBack)
                {
                    txtTarih.Text = Request.QueryString["TARIH"];
                    txtMusteriAd.Text = Request.QueryString["FIRMA"];
                    txtYetkili.Text = Request.QueryString["YETKILI"];
                    txtTelefon.Text = Request.QueryString["TELEFON"];
                    txtEmail.Text = Request.QueryString["EMAIL"];
                    dpDagitici.Text = Request.QueryString["DAGITICI"];
                }
                #endregion
            }





        }
    }
}