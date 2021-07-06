using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Crm
{
    public partial class Randevu_Giris : System.Web.UI.Page
    {
        SqlConnection connBizim = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["baglantiBizim"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {

            DateTime d = Convert.ToDateTime(txtTarih.Text);
            string desc = txtAciklama.Text;      
            connBizim.Open();
            SqlCommand cmd = new SqlCommand("insert into [CRM].[dbo].RANDEVU (EventDate,EventDesc) values('" + d + "','" + desc + "') ", connBizim);
            int x = cmd.ExecuteNonQuery();
            if (x == 0)
            {

                lbl.ForeColor = System.Drawing.Color.Red;
                lbl.Text = "There is no any row affected in the database";
            }
            else
            {
                lbl.ForeColor = System.Drawing.Color.GreenYellow;
                lbl.Text = x + " - Record is inserted successfully";
            }
        }
    }
}