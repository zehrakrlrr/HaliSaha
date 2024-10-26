<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Ekle.Add" %>


<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Save</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color:#0088af;
        }

        .container {
            margin-top: 40px; /* Uygun bir boşluk ekleyebilirsiniz */
            background-color:white;
            padding:20px;
           
        }

        .text {
            width: 270px;
            height: 40px;
        }

        .controlBut {
    border-radius: 5px;
    margin: 8px;
    width: 114px;
    height: 50px;
    background-color: inherit; 
   
    transition: background-color 0.3s; /* Geçiş efekti */
}

.controlBut:hover {
    background-color: #17a2b8; /* Butonun arka plan rengini değiştir */
}


     
           
  



        .gridview1 {
            margin-top: 15px; /* Uygun bir boşluk ekleyebilirsiniz */
        }

        /* Ekran büyük olduğunda gridview'ı sağa al */
        @media (min-width: 768px) {
            .gridview1 {
                float: right;
            }


            /* Gridview'ı yukarıya al */
            .move-up {
                margin-top: -470px; /* Uygun bir değer deneyebilirsiniz */
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <img src="login-form-v1/__MACOSX/Login_v1/images/Logo_-01.png" style="height: 50px; width: 100px;" />
            
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

    <!-- Sayfa İçeriği -->
    <div class="container">
        

            <asp:TextBox class="text" ID="citySearch" runat="server" oninput="filterCities()" AutoPostBack="false" placeholder="Şehir Seçiniz"></asp:TextBox><br /><br />
            <asp:DropDownList class="text" ID="citySelect" runat="server" ClientIDMode="Static"></asp:DropDownList><br /> <br />
            <asp:TextBox class="text" ID="isim" runat="server" placeholder="Halı Saha İsmi:"></asp:TextBox><br /><br />
            <asp:TextBox class="text" ID="tlfNo" runat="server" placeholder="Telefon Numarası:"></asp:TextBox> <br /> <br />
      
      
        <asp:Button  CssClass="controlBut" type="submit" runat="server" OnClick="saveButton_Click" Text="Kaydet" name="saveButton" Width="114px" style="text-align: center;" />


            <asp:Button  CssClass="controlBut" type="submit" runat="server" OnClick="updateButton_Click" Text="Güncelle" name="updateButton" Width="114px" style="text-align: center;" /><br />
            <asp:Button CssClass="controlBut"  type="submit" runat="server" OnClick="searchButton_Click" Text="Ara" name="searchButton" ID="Button2" Width="114px" />
            <asp:Button  CssClass="controlBut" type="submit" runat="server" OnClick="deleteButton_Click" Text="Sil" name="deleteButton" ID="Button3" Width="114px" /><br />
            <asp:Button  CssClass="controlBut" type="submit" runat="server" OnClick="clearButton_Click" Text="Temizle" name="clearButton" ID="Button4" Width="114px" style="margin-left:75px;"/>
            <!-- Gridview'ı sağ tarafa ve yukarıya yerleştir -->
            <div class="row">
                <div class="col-md-8 offset-md-4 move-up" style="height:500px;overflow:auto;" >
                <asp:GridView class="gridview1" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" style="color:black;" OnRowCommand="GridView1_RowCommand" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="White" Height="20px" />
                    <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Seç" ItemStyle-Width="75px" >
<ItemStyle Width="75px"></ItemStyle>
                        </asp:ButtonField>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" ItemStyle-Width="75px" >
<ItemStyle Width="75px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="sehir" HeaderText="Şehir" SortExpression="sehir" ItemStyle-Width="75px" >
<ItemStyle Width="100px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="ad" HeaderText="Halısaha" SortExpression="ad" ItemStyle-Width="75px" >
<ItemStyle Width="300px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="telefonNumarasi" HeaderText="Telefon Numarası" SortExpression="telefonNumarasi" ItemStyle-Width="75px" >
<ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle Height="20px" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" Height="20px" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                </div>
            </div>

        </form>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HaliSahaConnectionString %>" SelectCommand="SELECT * FROM [Firma]"></asp:SqlDataSource>
    </div>

    <!-- Bootstrap JavaScript ve jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        const cities = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"];
        const citySelect = document.getElementById("citySelect");
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
