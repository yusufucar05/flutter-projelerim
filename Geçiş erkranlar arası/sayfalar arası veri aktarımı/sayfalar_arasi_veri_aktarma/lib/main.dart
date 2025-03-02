import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      //initialRoute bir body gibi çalışıyor bu başlangıçta hangi ekranın geleceğini belirliyor.
      routes: // parametresi tam olarak adı gibi yönlendirme parametresi.
          {
        "/": (context) => GirisEkrani(),
        "/ProfilsayfasiRotası": (context) => Profilsayfasi(),
      },
    );
  }
}

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({super.key});

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  //controller larımı bir fonkson ile şartlıyorum.
  girisYap() {
    if (t1.text == "yusuf" && t2.text == "123") {
      // bu fonksiyon ile tanımlaıyoruz gideceğimiz ekranı.
      Navigator.pushNamed(
        context,
        "/ProfilsayfasiRotası",
        //
        arguments: VeriModeli(kullaniciAdi: t1.text, sifre: t2.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("giriş ekranı")),
      body: Container(
        child: Column(
          children: [
            TextFormField(controller: t1),
            TextFormField(controller: t2),

            ElevatedButton(onPressed: girisYap, child: Text("button girişyap")),
          ],
        ),
      ),
    );
  }
}

class Profilsayfasi extends StatefulWidget {
  const Profilsayfasi({super.key});

  @override
  State<Profilsayfasi> createState() => _ProfilsayfasiState();
}

class _ProfilsayfasiState extends State<Profilsayfasi> {
  cikisYap() {
    Navigator.pop(context);
    //bu fonksiyon da bizi neden geldiysek oraya gönderiyor ve o sayfayı kapatıyor, sonlandırıyor.
  }

  @override
  Widget build(BuildContext context) {
    //kullandığım:
    //VeriModeli iletilenArgumanlar = ModalRoute.of(context).settings.arguments;
    //kullanmam gereken:
    final iletilenArgumanlar =
        ModalRoute.of(context)?.settings.arguments as VeriModeli?;
    //required kullandığımız için sonradan değer alabilen final türünde oluşturduk
    //ve bu değerleri doğrudan VeriModeli sınıfına aktardık.

    return Scaffold(
      appBar: AppBar(title: Text("Profil ekranı")),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: cikisYap, child: Text("çıkış yap")),
            Text(iletilenArgumanlar?.kullaniciAdi ?? "null"),
            //sonradan değer alması zorunlu olduğunda  ?. ile belirtiriz.
            Text(iletilenArgumanlar?.sifre ?? "null"),
            //ifade null olduğunu kontrol etmemiz ger için ?? kullandık
          ],
        ),
      ),
    );
  }
}

class VeriModeli {
  String kullaniciAdi, sifre;
  VeriModeli({required this.kullaniciAdi, required this.sifre});
  //burada required / late kullanmak zorunlu ama değer almadığı ve
  // daha sonradan değer alacağı için required kullandık.
}
