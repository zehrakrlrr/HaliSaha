using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace test
{

	public partial class Login : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void Button1_Click(object sender, EventArgs e)
		{
			SqlConnection baglanti = new SqlConnection("Server=ZEHRA\\SQLEXPRESS;Database=HaliSaha;Integrated Security=True");
			baglanti.Open();
			SqlCommand komut = new SqlCommand("select * from PazarlamaGiris where isim=@UserName and sifre=@Sifre", baglanti);
			komut.Parameters.AddWithValue("@UserName", txtUserName.Text.ToString());
			komut.Parameters.AddWithValue("@Sifre", TxtSifre.Text.ToString());
			SqlDataReader oku = komut.ExecuteReader();
			if (oku.Read())
			{
				Session["id"] = oku["Id"].ToString();
				Session["Kullanici"] = oku["isim"].ToString();
				Response.Redirect("~/Gorusme.aspx");
				

			}
			else
			{
				string script = "alert('Kullanıcı adı veya şifreniz yanlış...');";
				ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);
			}
			//oku.Close();
			baglanti.Close();
		
		}

	}
}