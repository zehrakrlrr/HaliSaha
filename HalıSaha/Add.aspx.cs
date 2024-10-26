using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Ekle
{
    public partial class Add : System.Web.UI.Page
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
                
                string[] cities = new string[] { "","Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce" };

                // Şehirleri DropDownList'e ekle
                foreach (var city in cities)
                {
                    ListItem item = new ListItem(city, city.ToLower());
                    citySelect.Items.Add(item);
                }

            }
        }
        protected void saveButton_Click(object sender, EventArgs e)
        {
            // Handle the "Kaydet" button click event here
            string selectedCity = citySelect.SelectedValue.ToString();
            string halisahaIsim = isim.Text;
            string telefonNumarasi = tlfNo.Text;

            if (string.IsNullOrEmpty(selectedCity) ||  string.IsNullOrEmpty(halisahaIsim) || string.IsNullOrEmpty(telefonNumarasi))
            {
                string script = "alert('Lütfen tüm alanları doldurunuz...');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);

            }
            else
            {
                using (SqlConnection conn = new SqlConnection("Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True"))
                {
                    conn.Open();
                    string query = "Insert into Firma VALUES(@i1,@i2,@i3)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@i1", selectedCity);
                        cmd.Parameters.AddWithValue("@i2", halisahaIsim);
                        cmd.Parameters.AddWithValue("@i3", telefonNumarasi);
                        cmd.ExecuteNonQuery();
                    }
                }
                string script = "alert('Başarıyla kayıt edilmiştir...');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);
                citySelect.SelectedValue = "";
                isim.Text = "";
                tlfNo.Text = "";
                citySearch.Text = "";
            }
        }
        protected void searchButton_Click(object sender, EventArgs e) {
            Search();
        }
        protected void deleteButton_Click(object sender, EventArgs e) {

            // Handle the "Kaydet" button click event here
            string selectedCity = citySelect.SelectedValue.ToString();
            string halisahaIsim = isim.Text;
            string telefonNumarasi = tlfNo.Text;
            if (string.IsNullOrEmpty(selectedCity) || string.IsNullOrEmpty(halisahaIsim) || string.IsNullOrEmpty(telefonNumarasi) || ViewState["ID"]==null)
            {
                string script = "alert('Lütfen bir halı saha seçiniz...');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);

            }
            else
            {
                using (SqlConnection conn = new SqlConnection("Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True"))
                    {
                        conn.Open();
                        string query = "delete from Firma where Id = @d1";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@d1", ViewState["ID"]);
                            cmd.ExecuteNonQuery();
                        }
                }
                string script = "alert('Başarıyla silinmiştir...');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);

                citySelect.SelectedValue = "";
                isim.Text = "";
                tlfNo.Text = "";
                citySearch.Text = "";
                ViewState["ID"] = null;
            }


        }
        protected void updateButton_Click(object sender, EventArgs e) {
            // Handle the "Kaydet" button click event here
            string selectedCity = citySelect.SelectedValue.ToString();
            string halisahaIsim = isim.Text;
            string telefonNumarasi = tlfNo.Text;

            if (string.IsNullOrEmpty(selectedCity) || string.IsNullOrEmpty(halisahaIsim) || string.IsNullOrEmpty(telefonNumarasi) || ViewState["ID"]==null)
            {
                string script = "alert('Lütfen bir halı saha seçiniz...');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);

            }
            else
            {
                using (SqlConnection conn = new SqlConnection("Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True"))
                {
                    conn.Open();
                    string query = "Update Firma SET sehir = @u1 , ad = @u2 , telefonNumarasi = @u3 where Id = @u4";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@u1", citySelect.SelectedValue);
                        cmd.Parameters.AddWithValue("@u2", isim.Text);
                        cmd.Parameters.AddWithValue("@u3", tlfNo.Text);
                        cmd.Parameters.AddWithValue("@u4", ViewState["ID"]);
                        cmd.ExecuteNonQuery();
                    }
                }

                string script = "alert('Başarıyla güncellenmiştir...');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);

                citySelect.SelectedValue = "";
                isim.Text = "";
                tlfNo.Text = "";
                citySearch.Text = "";
                ViewState["ID"] = null;
            }


        }
        protected void clearButton_Click(object sender, EventArgs e)
        {
            citySearch.Text=string.Empty;
            citySelect.SelectedValue = "";
            isim.Text=string.Empty;
            tlfNo.Text=string.Empty;
            ViewState["ID"] = null;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];

                int id = int.Parse(row.Cells[1].Text);  
                citySelect.SelectedValue = row.Cells[2].Text;
                isim.Text = row.Cells[3].Text;
                tlfNo.Text = row.Cells[4].Text;
                ViewState["ID"] = id;
            }

        }
        private void BindGridView(DataTable dt)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void Search()
        {
            string halisahaIsim = isim.Text.Trim();
            string selectedCity = citySelect.SelectedValue;

            using (SqlConnection conn = new SqlConnection("Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True"))
            {
                conn.Open();
                string query = "SELECT * FROM Firma WHERE (ad LIKE '%' + @halisahaIsim + '%' OR @halisahaIsim = '') AND (sehir = @selectedCity OR @selectedCity = '')";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@halisahaIsim", halisahaIsim);
                    cmd.Parameters.AddWithValue("@selectedCity", selectedCity);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        BindGridView(dt);
                    }
                }
            }
        }

        protected void exit(object sender, EventArgs e)
        {
            Session["id"] = null;
            Session["Kullanici"]=null;
            Response.Redirect("~/Login.aspx");  
         
        }

    }
}