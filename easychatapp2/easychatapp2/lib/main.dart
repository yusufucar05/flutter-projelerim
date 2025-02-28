import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "chat", home: Iskele());
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat Uygulaması")),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<MesajBalonu> mesajListesi = [];
  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(child: TextField(controller: t1)),
          IconButton(
            onPressed: () => listeyeEkle(t1.text),
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajListesi.length,
              itemBuilder: (_, indexNumarasi) => mesajListesi[indexNumarasi],
            ),
          ),
          Divider(thickness: 1),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "kullanici1";

class MesajBalonu extends StatelessWidget {
  String mesaj;

  MesajBalonu({required this.mesaj});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(child: Text(isim[0])),
          Column(children: [Text(isim), Text(mesaj)]),
        ],
      ),
    );
  }
}
