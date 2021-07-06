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
    public partial class Default : System.Web.UI.Page
    {
        SqlCommand cmdCariAd;
        string cariAd, kullaniciKod, kullaniciAd, kullanici, thetext = "Kullanıcı adı veya Parola hatalı!", kullaniciİsim;
        int txtLeft = 230;
        int txtTop = 480;

        SqlConnection connBizim;
        protected void Page_Load(object sender, EventArgs e)
        {
            string userAgent = Request.UserAgent.ToString().ToLower();
            if (userAgent != null)
            {
                if (Request.Browser.IsMobileDevice == true)
                {
                    //Response.Redirect("m.default.aspx");
                }
            }
            connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
            kullaniciKod = "";
            kullaniciAd = "";
        }
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            if (txtKullaniciAd.Text == "" || txtParola.Text == "")
            {

            }
            else
            {
                SqlDataAdapter adpVeri = new SqlDataAdapter("SELECT KULLANICIAD,PAROLA,ISIM FROM KULLANICI WHERE KULLANICIAD='" + txtKullaniciAd.Text + "' AND PAROLA='" + txtParola.Text + "'", connBizim);
                DataTable tblVeri = new DataTable();
                adpVeri.Fill(tblVeri);
                foreach (DataRow item in tblVeri.Rows)
                {
                    kullaniciKod = item[0].ToString();
                    kullaniciAd = item[1].ToString();
                    kullaniciİsim = item[2].ToString();
                }
                if (kullaniciKod != "")
                {
                    kullanici = txtKullaniciAd.Text.ToString();
                    Session["CariKod"] = kullaniciKod.ToString();
                    Session["CariAd"] = kullaniciAd.ToString();
                    Session["Kullanici"] = kullanici.ToString();
                    Session["İsim"] = kullaniciİsim.ToString();
                    Session["ID"] = "";
                    Session["IDRANDEVU"] = "";
                    Response.Redirect("Yonetim.aspx");
                }

                else
                {
                    Response.Write("<div style=\" text-align:center;color: #FF0000; \">" + thetext + "</div>");
                }
            }
        }
    }
}