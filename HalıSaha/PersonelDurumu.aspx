<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonelDurumu.aspx.cs" Inherits="Ekle.PersonelDurumu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Personel Durumu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"> 

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />
</head>
    <style>

    .kutu {
    margin: 20px auto;
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
    border: 20px solid #007c99;
    
    
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

                        .form-group {
                            display: inline-block;
                            margin-left: 20px;
                        }
                    }
                }
            }
        }
</style>
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
<div class="container" style="margin-top: 30px; max-width: 1400px;">
    <div class="kutu text-center">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-md-2">
                <label for="ddl1">Başlangıç Tarihi</label>
                <div class="form-group">
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" Style="width: 150px; margin: auto;"  TextMode="Date" OnTextChanged="txtDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-2">
                <label for="tbBitTarih" class="text-red small">Bitiş Tarihi</label>
                <div class="form-group">
                    <asp:TextBox ID="txtDate2" runat="server" CssClass="form-control" Style="width: 150px; margin: auto;" TextMode="Date" Enabled="false"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-2">
                <label for="DropDownList1" class="text-red small">Ay</label>
                <div class="form-group" style="position: relative; margin-left: 10px;">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Width="150px" style="display: inline-block;">
                        <asp:ListItem Text="" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Ocak" Value="1"></asp:ListItem>
                       <asp:ListItem Text="Şubat" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mart" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Nisan" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Mayıs" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Haziran" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Temmuz" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Ağustos" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Eylül" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Ekim" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Kasım" Value="11"></asp:ListItem>
                        <asp:ListItem Text="Aralık" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-md-2">
                <label for="personeltxt" class="text-red small">Personel</label>
                <div class="form-group" style="position: relative; margin-left: 10px;">
                    <asp:TextBox ID="personeltxt" runat="server" CssClass="form-control" Style="width: 150px ; margin: auto; display: inline-block;"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-2">
                <label for="searchBut" class="text-red small"></label>
<div class="form-group" style="position: relative; margin-left: 10px; width:50px;">
                    <asp:Button ID="searchBut" runat="server" Text="Ara" OnClick="Ara_OnClick" CssClass="btn btn-outline-info my-2 my-sm-0" style="width: 120px; "    />
                </div>
            </div>
        </div>
    </div>
</div>



        <table id="myTable" align="center" style="width:100%;table-layout:fixed;" class="table table-striped table-bordered">
        <thead>  
          <tr>  
            <th>Şehir</th>  
            <th>Halı Saha Adı</th>  
            <th>Yetkili</th>  
            <th>Telefon</th>  
            <th>Tarih</th>
            <th>Aşama</th>  
            <th>Durum</th>  
            <th>Paket</th> 
            <th>Personel</th>  
            <th>Not</th>  

          </tr>  
        </thead>  
        <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" >
                                    <ItemTemplate>
                                        <tr>
                                            
                                            <td><%#Eval("Şehir")%></td>
                                            <td><%#Eval("Halı Saha İsmi")%></td>
                                            <td><%#Eval("Yetkili Adı")%></td>
                                            <td><%#Eval("Telefon")%></td>
                                            <td><%#Eval("Tarih")%></td>
                                            <td><%#Eval("Aşama")%></td>
                                            <td><%#Eval("Durum")%></td>
                                            <td><%#Eval("Paket")%></td>
                                            <td><%#Eval("Pazarlamacı Adı")%></td>
                                            <td><%#Eval("Notlar")%></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>

    </table>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>  

<script>
    $(document).ready(function () {
        $('#myTable').dataTable();
    });
</script>    </form>
</body>
</html>
