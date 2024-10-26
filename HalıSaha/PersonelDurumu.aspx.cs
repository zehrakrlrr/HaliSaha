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
    public partial class PersonelDurumu : System.Web.UI.Page
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
        protected void Ara_OnClick(object sender, EventArgs e)
        {
            string start = txtDate.Text;
            string end = txtDate2.Text;
            string pers = personeltxt.Text;
            string ay = DropDownList1.SelectedValue;

            using (SqlConnection conn = new SqlConnection("Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True"))
            {
                conn.Open();
                    string query = "Select * from GorusmelerView Where ((Tarih BETWEEN @s1 AND @s2) OR (Tarih=@s1 AND @s2='') OR (@s1='' AND @s2='')) AND (Month(Tarih) = @s3 OR @s3='') AND ([Pazarlamacı Adı] like '%'+@s4+'%' Or @s4='') ";
                    using(SqlCommand command = new SqlCommand(query, conn))
                    {
                        if (!string.IsNullOrEmpty(start) && !string.IsNullOrEmpty(end))
                        {
                            DateTime parsestart;
                            DateTime.TryParse(start, out parsestart);
                            parsestart = parsestart.Date;
                            DateTime parseend;
                            DateTime.TryParse(end, out parseend);
                            parseend = parseend.Date;

                            command.Parameters.AddWithValue("@s1", parsestart);
                            command.Parameters.AddWithValue("@s2", parseend);
                        }else if (!string.IsNullOrEmpty(start))
                        {
                            DateTime parsestart;
                            DateTime.TryParse(start, out parsestart);
                            parsestart = parsestart.Date;
                            command.Parameters.AddWithValue("@s1", parsestart);
                            command.Parameters.AddWithValue("@s2", end);

                        }
                        else
                        {
                            command.Parameters.AddWithValue("@s1", start);
                            command.Parameters.AddWithValue("@s2", end);

                        }

                        if (ay == "0")
                        {
                            ay=string.Empty;
                        }
                        command.Parameters.AddWithValue("@s3", ay);
                        command.Parameters.AddWithValue("@s4", pers);
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
            txtDate.Text = string.Empty;
            txtDate2.Text = string.Empty;
            DropDownList1.SelectedValue = "0";
            personeltxt.Text = string.Empty;
            DropDownList1.Enabled = true;
            txtDate2.Enabled = false;

        }
        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtDate.Text))
            {
                txtDate2.Enabled = false;
                DropDownList1.Enabled = true;
            }
            else
            {
                txtDate2.Enabled = true;
                DropDownList1.Enabled = false;

            }
        }
    }
}