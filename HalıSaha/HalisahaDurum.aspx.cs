using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ekle
{
    public partial class HalisahaDurum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
            if (Session["Kullanici"] == null)
            {
                string script = "alert('Çıkış yapılmıştır, tekrar giriş yapınız.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                BindRepeaterData();
            }
        }

        private void BindRepeaterData()
        {
            // Veritabanı bağlantısı
            string connectionString = "Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Veri çekme sorgusu
                string query = "SELECT * FROM GorusmelerView";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        // Repeater'a veriyi bağlama
                        Repeater1.DataSource = dataTable;
                        Repeater1.DataBind();
                    }
                }
            }
        }
        protected void exit(object sender, EventArgs e)
        {
            Session["id"] = null;
            Session["Kullanici"] = null;
            Response.Redirect("~/Login.aspx");

        }

    }
}