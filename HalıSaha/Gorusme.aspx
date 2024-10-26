<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gorusme.aspx.cs" Inherits="Ekle.Gorusme" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yapılan Görüşmeler</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />
</head>
<style>
     .kutu {
        background-color: #f0f0f0; /* Arkaplan rengi */
        border: 1px solid #ccc; /* Kenarlık rengi ve kalınlığı */
        padding: 20px; /* İçeriğin kutu ile arasındaki boşluk */
        max-width: 100%; /* Kutunun maksimum genişliği */
        width: 1200px; /* Kutunun belirlenen piksel genişliği */
        margin: 20px auto; /* Otomatik yatay hizalama, dikey hizalamayı belirtmek için margin-top ve margin-bottom kullanılır */
        box-sizing: border-box; /* Kutu boyutunu, kenarlıkları ve dolgu dahil olarak belirler */
        height:500px;
    }
     }

@media screen and (max-width: 1400px) {
    .container, .container-xl {
max-width: 1400px;
}

@media screen and (max-width: 1024px) {
    .container, .container-lg {
max-width: 1400px;
}

@media screen and (max-width: 600px) {
    .container, .container-md {
max-width: 1400px;
}


@media screen and (max-width: 360px) {
    .container, .container-sm {
max-width: 1400px;
}

    text {
        width: 100%;
        height: 150px;
        padding: 12px 20px;
        box-sizing: border-box;
        border: 2px solid #ccc;
        border-radius: 4px;
        background-color: #f8f8f8;
        font-size: 16px;
         resize:  none;
    }
</style>


<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
           <img src="login-form-v1/__MACOSX/Login_v1/images/Logo_-01.png" style="height: 50px; width: 100px;" />

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
       
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/Gorusme.aspx">Yapılan Görüşmeler <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Add.aspx">Halısahalar</a>
                    </li>
                    <li class="nav-item">
    <a class="nav-link" href="/HalisahaDurum.aspx">Halısa Durumu</a>
</li>
                    <li class="nav-item">
    <a class="nav-link" href="/PersonelDurumu.aspx">Personel Durumu</a>
</li>
                    <li class="nav-item">
                        <asp:LinkButton ID="lnkExit" runat="server" OnClick="exit" CssClass="nav-link">Çıkış yap</asp:LinkButton>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container" style="margin-top: 30px;">
            <div class="kutu">

                <table>
                    <tr>
                        <td style="padding-left: 20px; width: 20%; height: 50px;">
                            <asp:TextBox CssClass="form-control mr-sm-2" ID="citySearch" runat="server" oninput="filterCities()" AutoPostBack="false" placeholder="Şehir Seçiniz"></asp:TextBox>
                        </td>
                        <td style="padding-left: 20px; width: 20%; height: 50px;">
                            <asp:DropDownList CssClass="form-control mr-sm-2" ID="sehir" runat="server" ClientIDMode="Static"></asp:DropDownList>
                        </td>
                        <td style="padding-left: 20px; width: 20%; height: 50px;">
                            <asp:TextBox ID="halisaha" runat="server" CssClass="form-control mr-sm-2" placeholder="Halı Saha" title="Halı saha adı"></asp:TextBox>
                        </td>
                        <td style="padding-left: 20px; width: 20%; height: 50px;">
                            <asp:TextBox ID="yetkiliadi" runat="server" CssClass="form-control mr-sm-2" placeholder="Yetkili Adı" title="Yetkili adı"></asp:TextBox>
                        </td>
                        <td style="padding-left: 20px; width: 20%; height: 50px;">
                            <asp:TextBox ID="tlf" runat="server" CssClass="form-control mr-sm-2" placeholder="Telefon" title="Telefon"></asp:TextBox>
                        </td>
                        <td style="padding-left: 20px;">
                            <asp:Button ID="btnFiltrele" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0" Text="Filtrele" OnClick="filtreleBut" type="submit" />
                        </td>
                        <td style="padding-left: 20px;">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0" Text="Temizle" OnClick="temizleBut" type="submit" />
                        </td>
                    </tr>
                    <tr>
                           

                        
                    </tr>
                </table>
             <div style="display: flex; margin-left:20px; align-items: center; margin-top:20px;">
    <asp:DropDownList class="form-control" style="width:325px;"  ID="ddlHalisaha" runat="server" ClientIDMode="Static" AutoPostBack="True" OnSelectedIndexChanged="ddlHaliSaha_SelectedIndexChanged"></asp:DropDownList>
    <span class="input-group-text" style="margin-left: 20px;">Paket</span>
    <asp:TextBox class="form-control" ID="paketgoster" runat="server" ClientIDMode="Static" Enabled="false" Style="width: 100px; padding: 6px 12px; margin-left: 5px;"></asp:TextBox>
    <span class="input-group-text" style="margin-left: 20px;">Kurulma Tarihi</span>
    <asp:TextBox class="form-control" ID="kurulmatarihi" runat="server" ClientIDMode="Static" Enabled="false" Style="width: 150px; padding: 6px 12px; margin-left: 5px;"></asp:TextBox>
</div>


<div class="image-container" style="float: right; margin-left: auto; margin-right: 20px; margin-top:5px; width: 350px; height:212px;">
            <img src="login-form-v1/__MACOSX/Login_v1/images/missportlogo.png" alt="missport" style="width: 350px; height:212px;">
        </div>
                
                <div style="align-items:center; display:flex; width:50%; margin-top:20px; margin-left:20px;">
        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" Style="width: 150px;" TextMode="Date"></asp:TextBox>

        <span class="input-group-text" style="margin-left: 20px;">Aşamalar</span>
        <asp:DropDownList class="form-control" style="width:150px; margin-right: 30px;" ID="asamalar" runat="server" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="asamadll_changed">
            <asp:ListItem Text="İlk Temas" Value="1"></asp:ListItem>
            <asp:ListItem Text="Değerlendirme" Value="2"></asp:ListItem>
            <asp:ListItem Text="Randevu OLuşturuldu" Value="3"></asp:ListItem>
            <asp:ListItem Text="Satın alma sürecinde" Value="4"></asp:ListItem>
            <asp:ListItem Text="Görüşülmedi" Value="5"></asp:ListItem>
        </asp:DropDownList>

    </div>           
    
    <div ID="durumdiv" runat="server" style="align-items:center; display:flex; width:50%; margin-top:20px; margin-left:20px;">


            <span class="input-group-text" >Görüşme Sayısı</span>
            <asp:TextBox CssClass="form-control" ID="gorusmesayisi" runat="server" ClientIDMode="Static" Enabled="false" Style="width: 60px; "></asp:TextBox>


            <span class="input-group-text" style="margin-left:20px;">Döküman Gönderildi</span>
            
            <asp:CheckBox class="form-control" style="width:37px;" runat="server" ID="dokumanbox"></asp:CheckBox>    
        
            <span class="input-group-text" style="margin-left:20px;">Paket</span>
            <asp:DropDownList class="form-control" style="width:120px;" ID="paket" runat="server" ClientIDMode="Static">
                <asp:ListItem Text="-" Value="0"></asp:ListItem>
                <asp:ListItem Text="Demo" Value="1"></asp:ListItem>
                <asp:ListItem Text="Green" Value="2"></asp:ListItem>
                <asp:ListItem Text="Silver" Value="3"></asp:ListItem>
                <asp:ListItem Text="Gold" Value="4"></asp:ListItem>
                <asp:ListItem Text="Platinum" Value="5"></asp:ListItem>
            </asp:DropDownList>

    </div>

        <div ID="durumdiv2" runat="server" style="align-items:center; display:flex; width:50%; margin-top:20px; margin-left:20px;">

            <span class="input-group-text">Mevcut Sistem</span>
            <asp:DropDownList class="form-control" style="width:160px;" ID="mevcutsistem" runat="server" ClientIDMode="Static">
                <asp:ListItem Text="" Value="6"></asp:ListItem>
                <asp:ListItem Text="Manuel" Value="1"></asp:ListItem>
                <asp:ListItem Text="Excel" Value="2"></asp:ListItem>
                <asp:ListItem Text="Sporpin" Value="3"></asp:ListItem>
                <asp:ListItem Text="Sosyal Halı Saha" Value="4"></asp:ListItem>
                <asp:ListItem Text="Olley" Value="5"></asp:ListItem>
            </asp:DropDownList>

            <span class="input-group-text" style="margin-left:20px;">Durum</span>
            <asp:DropDownList class="form-control" style="width:180px;" ID="durum" runat="server" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="durumdll_changed">
                <asp:ListItem Text="" Value="5"></asp:ListItem>
                <asp:ListItem Text="Nötr" Value="1"></asp:ListItem>
                <asp:ListItem Text="Olumsuz" Value="2"></asp:ListItem>
                <asp:ListItem Text="Olumlu Yarı Sıcak" Value="3"></asp:ListItem>
                <asp:ListItem Text="Olumlu Sıcak" Value="4"></asp:ListItem>
            </asp:DropDownList>

</div>
        <div style="align-items:center; display:flex; width:50%; margin-top:20px; margin-left:20px;">
                <div class="input-group " runat="server" ID="olumsuzdiv" visible="false">

                    <span class="input-group-text" >Olumsuz Sebepler</span>
                    <asp:DropDownList class="form-control"  ID="Olumsuzsebep" runat="server" ClientIDMode="Static" >
                        <asp:ListItem Text="Olumsuz sebep yok" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Pahalı" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Mevcut sistem kullanıyor" Value="2"></asp:ListItem>
                        <asp:ListItem Text="İnternet Yok" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Kullanacak eleman yok" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Halısaha kapandı" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Halısaha tadilatta" Value="8"></asp:ListItem>
                    </asp:DropDownList>
                    </div>

             <div class="input-group " runat="server" ID="gorusmediv" visible="false">

                    <span class="input-group-text" >Görüşülememe Sebebi</span>
                    <asp:DropDownList class="form-control"  ID="gorusmeddl" runat="server" ClientIDMode="Static" >
                        <asp:ListItem Text="-" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Yanlış numara" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Numaraya ulaşılamıyor" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Hat düşmüyor" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                    </div>

</div>
         <div style="align-items:center; display:flex; width:100%; margin-top:20px; margin-left:20px;">

                
            <span class="input-group-text" style="height:80px;">Notlar</span>
            <asp:TextBox ID="not" runat="server" CssClass="form-control" style="height:80px;" TextMode="MultiLine"></asp:TextBox>
            <asp:Button class="btn btn-outline-success my-2 my-sm-0"  style= "margin-left:5px; height:80px;"  type="submit" runat="server" OnClick="kaydetBut" Text="Kaydet" name="saveButton" />


    </div>
</div>
    
   

</div>


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
            integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
            crossorigin="anonymous"></script>
         <div style="text-align: center;">
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0" Text="Halı saha durum" OnClick="haliBut" type="submit" />
            <asp:Button ID="Button3" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0" Text="Login Log" OnClick="logBut" type="submit" />
        </div>

        <asp:GridView ID="GridView2" runat="server" Width="1496px" AutoGenerateColumns="True" Style="margin-top: 25px;  margin-left: 10px;" Height="46px" >
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HaliSahaConnectionString %>" SelectCommand="SELECT * FROM [LoginLog]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HaliSahaConnectionString %>" SelectCommand="SELECT * FROM [GorusmelerView]"></asp:SqlDataSource>
    </form>
    <script>
        const cities = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"];
        const citySelect = document.getElementById("sehir");
        const citySearch = document.getElementById("citySearch");

        // Şehirleri filtreleme fonksiyonu
        function filterCities() {
            const searchTerm = citySearch.value.toLowerCase();
            const filteredCities = cities.filter(city => city.toLowerCase().includes(searchTerm));

            // Select'i temizle
            citySelect.innerHTML = "";

            // Filtrelenmiş şehirleri ekle
            filteredCities.forEach(city => {
                const option = document.createElement("option");
                option.value = city.toLowerCase();
                option.text = city;
                citySelect.add(option);
            });
        }
        </script>


</body>
</html>
