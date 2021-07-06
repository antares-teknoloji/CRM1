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
    public partial class Musteri_Randevu : System.Web.UI.Page
    {
        SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
        SqlDataAdapter adpDurum, adpDagitici, adpOdemeTur;
        DataTable tblDurum, tblDagitici, tblOdemeTUr;
        void fillLists()
        {
            #region dağıtım bayiler geliyor
            adpDagitici = new SqlDataAdapter("SELECT DAGITICI FROM DAGITIM_BAYI", connBizim);
            tblDagitici = new DataTable();
            adpDagitici.Fill(tblDagitici);
            foreach (DataRow item in tblDagitici.Rows)
            {
                dpDagitici.Items.Add(item[0].ToString());
            }
            #endregion           
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            fillLists();
            try
            {


                if (!string.IsNullOrEmpty(Session["IDRANDEVU"].ToString()))
                {
                    #region dağıtım bayiler geliyor
                    adpDagitici = new SqlDataAdapter("SELECT DAGITICI FROM DAGITIM_BAYI", connBizim);
                    tblDagitici = new DataTable();
                    adpDagitici.Fill(tblDagitici);
                    foreach (DataRow item in tblDagitici.Rows)
                    {
                        dpDagitici.Items.Add(item[0].ToString());
                    }
                    #endregion
                    #region alanlar dolduruluyor
                    SqlDataAdapter adpGuncelleme = new SqlDataAdapter("SELECT * FROM MUSTERI_RANDEVU WHERE ID='" + Session["IDRANDEVU"].ToString() + "'", connBizim);
                    DataTable tblGuncelleme = new DataTable();
                    adpGuncelleme.Fill(tblGuncelleme);
                    txtTarih.Text = tblGuncelleme.Rows[0][1].ToString().Substring(0, 10);
                    txtYetkili.Text = tblGuncelleme.Rows[0][3].ToString();
                    txtMusteriAd.Text = tblGuncelleme.Rows[0][2].ToString();
                    txtTelefon.Text = tblGuncelleme.Rows[0][4].ToString();
                    txtEmail.Text = tblGuncelleme.Rows[0][5].ToString();
                    dpDagitici.Text = tblGuncelleme.Rows[0][6].ToString();
                    txtAciklama.Text = tblGuncelleme.Rows[0][8].ToString();
                    #endregion
                    Session["IDRANDEVU"] = "";
                }

                else
                {
                    if (!IsPostBack)
                    {
                        txtTarih.Text = DateTime.Today.ToString().Substring(0, 10);
                        #region dağıtım bayiler geliyor
                        adpDagitici = new SqlDataAdapter("SELECT DAGITICI FROM DAGITIM_BAYI", connBizim);
                        tblDagitici = new DataTable();
                        adpDagitici.Fill(tblDagitici);
                        foreach (DataRow item in tblDagitici.Rows)
                        {
                            dpDagitici.Items.Add(item[0].ToString());
                        }
                        #endregion
                    }
                }
            }
            catch (Exception )
            {
             

            }
        }
        protected void imgDate_Click(object sender, ImageClickEventArgs e)
        {
            DateTime dob = DateTime.Parse(Request.Form[txtTarih.UniqueID]);
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["IDRANDEVU"].ToString()))
            {
                SqlCommand cmdGuncelle = new SqlCommand("UPDATE MUSTERI_RANDEVU SET TARIH=@TARIH,FIRMA=@FIRMA,YETKILI=@YETKILI,TELEFON=@TELEFON,EMAIL=@EMAIL,DAGITICI=@DAGITICI,SATISPERSONEL=@SATISPERSONEL,ACIKLAMA=@ACIKLAMA WHERE ID='" + Session["IDRANDEVU"].ToString() + "'", connBizim);
                cmdGuncelle.Parameters.AddWithValue("@TARIH", Convert.ToDateTime(txtTarih.Text));
                cmdGuncelle.Parameters.AddWithValue("@FIRMA", txtMusteriAd.Text);
                cmdGuncelle.Parameters.AddWithValue("@YETKILI", txtYetkili.Text);
                cmdGuncelle.Parameters.AddWithValue("@TELEFON", txtTelefon.Text);
                cmdGuncelle.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
                cmdGuncelle.Parameters.AddWithValue("@DAGITICI", dpDagitici.Text);
                cmdGuncelle.Parameters.AddWithValue("@SATISPERSONEL", Session["Kullanici"].ToString());
                cmdGuncelle.Parameters.AddWithValue("@ACIKLAMA", txtAciklama.Text);
                connBizim.Open();
                cmdGuncelle.ExecuteNonQuery();
                connBizim.Close();
                Session["IDRANDEVU"] = "";
                RegisterStartupScript("PencereyiKapa", "<script>window.close(); </script>");
            }
            else
            {
                SqlCommand cmdKaydet = new SqlCommand("INSERT INTO MUSTERI_RANDEVU(TARIH,FIRMA,YETKILI,TELEFON,EMAIL,DAGITICI,SATISPERSONEL,ACIKLAMA) VALUES (@TARIH,@FIRMA,@YETKILI,@TELEFON,@EMAIL,@DAGITICI,@SATISPERSONEL,@ACIKLAMA)", connBizim);
                cmdKaydet.Parameters.AddWithValue("@TARIH", Convert.ToDateTime(txtTarih.Text));
                cmdKaydet.Parameters.AddWithValue("@FIRMA", txtMusteriAd.Text);
                cmdKaydet.Parameters.AddWithValue("@YETKILI", txtYetkili.Text);
                cmdKaydet.Parameters.AddWithValue("@TELEFON", txtTelefon.Text);
                cmdKaydet.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
                cmdKaydet.Parameters.AddWithValue("@DAGITICI", dpDagitici.Text);
                cmdKaydet.Parameters.AddWithValue("@SATISPERSONEL", Session["Kullanici"].ToString());
                cmdKaydet.Parameters.AddWithValue("@ACIKLAMA", txtAciklama.Text);
                connBizim.Open();
                cmdKaydet.ExecuteNonQuery();
                connBizim.Close();
                Session["IDRANDEVU"] = "";
                Response.Redirect("Musteri_Randevu.aspx");
            }
        }
    }
}