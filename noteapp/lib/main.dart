import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "todo app",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todo App"),
        backgroundColor: Colors.amber,
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List genel_liste = [];
  void ElemanEkleme() {
    setState(() {
      genel_liste.add(t1.text);
      t1.clear();
    });
  }

  void ElemanEksiltme() {
    setState(() {
      genel_liste.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            //bu widget genel yapının sağlam şekilde kalmasını sağlamak için var.
            //İçerisindeki listeye ne eklenirse onu görücez ya onları göstereyim derken TextField ve buttonların yapısının bozulmamasını sağlıyor.
            child: ListView.builder(
              itemCount: genel_liste.length,
              itemBuilder: (context, indexnum) =>
                  //itemBuilder ile içeriklerin numaralandırılmasını ve bu şekilde listelenebilir şekilde kayıt edilmesini sağlıyor.
                  ListTile(
                      subtitle: Text("genel Liste"),
                      //subtitle bu oluşturulan başlıkların alt başlıkları olarak detay şekilde bize gözüküyor.
                      title: Text(genel_liste[indexnum])),
              //ListTile widget ı bizlerin listeyi görüntüleyebilmemizi sağlıyor.
            ),
          ),
          TextField(
            controller: t1,
          ),
          ElevatedButton(onPressed: ElemanEkleme, child: Text("Ekle")),
          ElevatedButton(onPressed: ElemanEksiltme, child: Text("Çıkart")),
        ],
      ),
    );
  }
}
