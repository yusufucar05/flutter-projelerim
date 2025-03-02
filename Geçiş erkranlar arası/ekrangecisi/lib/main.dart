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
  girisYap() {
    Navigator.pushNamed(context, "/ProfilsayfasiRotası");
    // bu fonksiyon ile tanımlaıyoruz gideceğimiz ekranı.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("giriş ekranı")),
      body: Container(
        child: Column(
          children: [
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
    return Scaffold(
      appBar: AppBar(title: Text("Profil ekranı")),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: cikisYap, child: Text("çıkış yap")),
          ],
        ),
      ),
    );
  }
}
