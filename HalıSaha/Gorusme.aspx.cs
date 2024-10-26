using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ekle
{
    public partial class Gorusme : System.Web.UI.Page
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

            gorusmesayisi.Text = "";
            // Şuanki tarih ve saat bilgisini al
            DateTime today = DateTime.Now;

            // Yıl, ay, gün şeklinde bir ifade oluştur
            string formattedDate = today.ToString("yyyy-MM-dd");
            txtDate.Text = formattedDate;

            if (Session["Kullanici"] == null)
            {
                string script = "alert('Çıkış yapılmıştır, tekrar giriş yapınız.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);
                Response.Redirect("~/Login.aspx");

            }
            if (!IsPostBack)
            {

                string[] cities = new string[] { "", "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce" };

                // Şehirleri DropDownList'e ekle
                foreach (var city in cities)
                {
                    ListItem item = new ListItem(city, city.ToLower());
                    sehir.Items.Add(item);
                }

            }

        }

        protected void ddlHaliSaha_SelectedIndexChanged(object sender, EventArgs e)
        {
            paketgoster.Text = string.Empty;
            kurulmatarihi.Text = string.Empty;
            GridView2.Visible = false;

            string selectedValue = ddlHalisaha.SelectedValue;
            string selectedText = ddlHalisaha.SelectedItem.Text;

            selectedText = selectedText.Split(',')[0];

            sehir.Text= selectedText;
            halisaha.Text= selectedValue;
            int rowCount = 0;
            using (SqlConnection conn = new SqlConnection("Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True"))
            {
                conn.Open();
                string query = "SELECT [Yetkili Adı] FROM GorusmelerView WHERE Şehir = @s1 AND [Halı Saha İsmi] = @s2";
                string query2 = "SELECT telefonNumarasi FROM Firma WHERE sehir = @s1 AND ad = @s2";
                string querydemo = "select p.deger,f.createDate from firma f inner join paket p on p.Id=f.paket  WHERE sehir = @s1 AND ad = @s2";
                using (SqlCommand cmd = new SqlCommand(query2, conn))
                {
                    cmd.Parameters.AddWithValue("@s1", selectedText);
                    cmd.Parameters.AddWithValue("@s2", selectedValue);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            tlf.Text = reader[0].ToString();
                        }
                    }
                }

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@s1", selectedText);
                    cmd.Parameters.AddWithValue("@s2", selectedValue);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            yetkiliadi.Text = reader[0].ToString();
                            rowCount++;
                        }
                    }
                }

                using(SqlCommand cmd = new SqlCommand(querydemo, conn))
                {
                    cmd.Parameters.AddWithValue("@s1", selectedText);
                    cmd.Parameters.AddWithValue("@s2", selectedValue);
                    using(SqlDataReader reader= cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            paketgoster.Text = reader[0].ToString();
                            kurulmatarihi.Text = reader[1].ToString();
                        }
                    }
                }
            }
            gorusmesayisi.Text = rowCount.ToString();
        }


        protected void asamadll_changed(object sender, EventArgs e)
        {
            string selectedValue = asamalar.SelectedValue;

            if(selectedValue == "5")
            {
                durum.SelectedValue = "5";
                durumdiv.Visible = false;
                durumdiv2.Visible = false;
                Olumsuzsebep.Enabled = true;
                paket.SelectedValue = "1";
                dokumanbox.Checked=false;
                mevcutsistem.SelectedValue = "6";
                olumsuzdiv.Visible = false;
                gorusmediv.Visible = true;
            }
            else
            {
                gorusmeddl.SelectedValue = "1";
                gorusmediv.Visible=false;
                durum.SelectedValue = "5";
                durumdiv.Visible = true;
                durumdiv2.Visible = true;
                gorusmeddl.SelectedValue = "1";
                Olumsuzsebep.SelectedValue = "10";
            }

        }
        protected void durumdll_changed(object sender, EventArgs e)
        {
            string selectedValue = durum.SelectedValue;

            if (selectedValue == "2")
            {
                Olumsuzsebep.SelectedValue = "10";
                olumsuzdiv.Visible = true;
            }
            else
            {
                olumsuzdiv.Visible = false;
                Olumsuzsebep.SelectedValue="10";
            } 



        }

        protected void filtreleBut(object sender, EventArgs e)
        {
            ddlHalisaha.Items.Clear();
            Search();
        }

        protected void temizleBut(object sender, EventArgs e)
        {
            citySearch.Text = string.Empty;
            sehir.SelectedValue = "";
            halisaha.Text = string.Empty;
            yetkiliadi.Text = string.Empty;
            tlf.Text = string.Empty;

            ddlHalisaha.SelectedValue = "";

            dokumanbox.Checked=false;
            paket.SelectedValue = "1";
            durum.SelectedValue="5";
            not.Text=string.Empty;

            ddlHalisaha.Items.Clear();

            paketgoster.Text = string.Empty;
            kurulmatarihi.Text = string.Empty;
        }

        protected void kaydetBut(object sender, EventArgs e) {
            string sehirAd = sehir.Text.ToLower();
            string haliSaha = halisaha.Text.ToLower();
            string yetkiliAd = yetkiliadi.Text.ToLower();
            string telefon = tlf.Text;
            string gorusenId=Session["id"] as string;

            if(!string.IsNullOrEmpty(sehirAd) && !string.IsNullOrEmpty(haliSaha) && !string.IsNullOrEmpty(telefon))
            {
                bool dokuman = dokumanbox.Checked;
                int pakett = Convert.ToInt32(paket.SelectedValue);
                int durumm = Convert.ToInt32(durum.SelectedValue);
                int mevcutSistem = Convert.ToInt32(mevcutsistem.SelectedValue);
                int asama = Convert.ToInt32(asamalar.SelectedValue);
                int olumsuzsebep = Convert.ToInt32(Olumsuzsebep.SelectedValue);
                int gorusememe = Convert.ToInt32(gorusmeddl.SelectedValue);
                string notlar = not.Text;

                int id=0;
                DateTime suAn;
                DateTime.TryParse(txtDate.Text, out suAn);

                using (SqlConnection  conn = new SqlConnection("Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True"))
                {
                    conn.Open();

                    string query = "select * from Firma where ad= @s1 and sehir=@s2";

                    string queryInsertFirma = "Update Firma Set Paket=@u1 , CreateDate = @u2 where sehir = @u3 and ad=@u4 and telefonNumarasi = @u5";
                    using (SqlCommand cmd = new SqlCommand(queryInsertFirma, conn))
                    {
                        if (pakett != 1)
                        {
                            cmd.Parameters.AddWithValue("@u1", pakett);
                            cmd.Parameters.AddWithValue("@u2", suAn);
                            cmd.Parameters.AddWithValue("@u3", sehirAd);
                            cmd.Parameters.AddWithValue("@u4", haliSaha);
                            cmd.Parameters.AddWithValue("@u5", telefon);

                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@u1",pakett);
                            cmd.Parameters.AddWithValue("@u2", null);
                            cmd.Parameters.AddWithValue("@u3", sehirAd);
                            cmd.Parameters.AddWithValue("@u4", haliSaha);
                            cmd.Parameters.AddWithValue("@u5", telefon);

                        }
                        cmd.ExecuteNonQuery();
                    }


                    

                    using (SqlCommand cmd = new SqlCommand(query,conn))
                    {
                        cmd.Parameters.AddWithValue("@s1",haliSaha);
                        cmd.Parameters.AddWithValue("@s2", sehirAd);
                        cmd.ExecuteNonQuery();

                        using(SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                id = Convert.ToInt32(reader["Id"]);
                            }
                        }
                    }
                    string queryInsert = "Insert into Gorusmeler (firmaId,yetkiliAd,telefon,gorusenId,tarih,paket,dokuman,mevcutSistem,gorusulememeSebep,durum,asama,olumsuzSebep,notlar) VALUES(@i1,@i2,@i3,@i4,@i6,@i8,@i9,@i10,@i7,@i11,@i12,@i13,@i14)";
                    using(SqlCommand cmd =new SqlCommand(queryInsert,conn))
                    {
                        cmd.Parameters.AddWithValue("@i1", id);
                        cmd.Parameters.AddWithValue("@i2", yetkiliAd);
                        cmd.Parameters.AddWithValue("@i3", telefon);
                        cmd.Parameters.AddWithValue("@i4", Convert.ToInt32(gorusenId));
                        cmd.Parameters.AddWithValue("@i6", suAn.Date);
                        cmd.Parameters.AddWithValue("@i8", pakett);
                        cmd.Parameters.AddWithValue("@i9", dokuman);
                        cmd.Parameters.AddWithValue("@i10", mevcutSistem);
                        cmd.Parameters.AddWithValue("@i11", durumm);
                        cmd.Parameters.AddWithValue("@i12", asama);
                        cmd.Parameters.AddWithValue("@i13", olumsuzsebep);
                        cmd.Parameters.AddWithValue("@i14", notlar);
                        cmd.Parameters.AddWithValue("@i7", gorusememe);

                        cmd.ExecuteNonQuery();
                    }
                }
                string script = "alert('Başarıyla kaydedilmiştir.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);

                sehir.Text=string.Empty;
                halisaha.Text= string.Empty;
                yetkiliadi.Text= string.Empty;
                tlf.Text= string.Empty;

                dokumanbox.Checked=false;

                paket.SelectedValue= "1";
                durum.SelectedValue = "1";
                mevcutsistem.SelectedValue = "1";
                asamalar.SelectedValue = "1";
                Olumsuzsebep.SelectedValue = "1";

                not.Text=string.Empty;

                txtDate.Text= string.Empty;
                ddlHalisaha.Items.Clear();

            }
            else
            {
                string script = "alert('Şehir , halı saha ismi ve telefon alanlarını doldurunuz.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);

            }


        }

        private void Search()
        {
            string sehirAd = sehir.Text;
            string haliSaha = halisaha.Text.ToLower();
            string yetkiliAd = yetkiliadi.Text.ToLower();
            string telefon = tlf.Text;

            using (SqlConnection conn = new SqlConnection("Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True"))
            {
                conn.Open();
                string query = "SELECT ad,sehir FROM Firma WHERE (ad LIKE '%' + @halisahaIsim + '%' OR @halisahaIsim = '') AND (sehir = @selectedCity OR @selectedCity = '') AND (telefonNumarasi = @tlf OR @tlf = '')";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@halisahaIsim", haliSaha);
                    cmd.Parameters.AddWithValue("@selectedCity", sehirAd);
                    cmd.Parameters.AddWithValue("@tlf", telefon);

                    using(SqlDataReader  reader = cmd.ExecuteReader())
                    {
                        ListItem item1 = new ListItem("", "");
                        ddlHalisaha.Items.Add(item1);
                        while (reader.Read())
                        {
                            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                            {
                                
                                string halisahaValue = reader["ad"].ToString();

                                ListItem item = new ListItem(reader["sehir"].ToString() + ',' + halisahaValue, halisahaValue.ToLower());
                                ddlHalisaha.Items.Add(item);
                            }

                        }
                    }
                }
            }
        }

        private DataTable GetDataSource1()
        {
            DataTable dt = new DataTable();
            string sehirAd = sehir.Text;
            string haliSaha = halisaha.Text.ToLower();
            string yetkiliAd = yetkiliadi.Text.ToLower();
            string telefon = tlf.Text;

            // Örnek: Bir SQL Server veritabanından veri çekme
            string connectionString = "Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM GorusmelerView WHERE ([Halı Saha İsmi] LIKE '%' + @halisahaIsim + '%' OR @halisahaIsim = '') AND (Şehir LIKE '%' + @selectedCity + '%' OR @selectedCity = '') AND (Telefon LIKE '%' + @tlf + '%' OR @tlf = '')";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@halisahaIsim", haliSaha);
                    command.Parameters.AddWithValue("@selectedCity", sehirAd);
                    command.Parameters.AddWithValue("@tlf", telefon);
                    command.Parameters.AddWithValue("@yetkiliAdi", yetkiliAd);


                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dt);
                    }
                }
            }

            return dt;
        }
        private DataTable GetDataSource2()
        {
            DataTable dt = new DataTable();
            string sehirAd = sehir.Text;
            string haliSaha = halisaha.Text.ToLower();
            int id=0;

            // Örnek: Bir SQL Server veritabanından veri çekme
            string connectionString = "Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "select f.Id from GorusmelerView g join firma f on f.ad=g.[Halı Saha İsmi] where g.[Halı Saha İsmi] = @s1 and g.Şehir=@s2";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@s1", haliSaha);
                    command.Parameters.AddWithValue("@s2", sehirAd);


                    using (SqlDataReader reader= command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            id= Convert.ToInt32(reader[0]);
                        }
                    }
                }


                query = "SELECT * FROM LoginLog where firmaId = @s1";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@s1", id);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dt);
                    }
                }
            }

            return dt;
        }

        private void BindDataSource1()
        {
            // İlk veri kaynağına bağlama işlemleri
            GridView2.DataSource = GetDataSource1();
            GridView2.DataBind();
        }

        private void BindDataSource2()
        {
            // İkinci veri kaynağına bağlama işlemleri
            GridView2.DataSource = GetDataSource2();
            GridView2.DataBind();
        }

        protected void haliBut(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            BindDataSource1();
        }

        protected void logBut(object sender, EventArgs e)
        {
            GridView2.Visible = true;

            BindDataSource2();
        }
        protected void exit(object sender, EventArgs e)
        {
            Session["id"] = null;
            Session["Kullanici"] = null;
            Response.Redirect("~/Login.aspx");

        }

    }
}