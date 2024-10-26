<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HalisahaDurum.aspx.cs" Inherits="Ekle.HalisahaDurum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Halısaha Durumu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"> 

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />
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
                                            <td><%#Eval("Tarih") %></td>
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
