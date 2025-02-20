import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "chat",
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
        title: Text("Mesajlaşma uyfgukaması"),
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
  List MesajListesi = [];
  mesajEkle(String metin) {
    setState(() {
      MesajListesi.insert(0, metin);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      //container için iç boluk oluşturuyor.
      child: Column(
        children: [
          Flexible(
              child: ListView.builder(
            reverse: true,
            //bu sayede görüntülemeyi tersten yapıyor
            itemCount: MesajListesi.length,
            itemBuilder: (context, int index) => Text(MesajListesi[index]),
          )),
          Row(
            children: [
              Flexible(
                child: TextField(
                  onSubmitted: mesajEkle,
                  //enter tuşu ile mesajı iletmesini sağlayor.
                  controller: t1,
                ),
              ),
              ElevatedButton(
                onPressed: () => mesajEkle(t1.text),
                //burda butonu doğrudan çalıştıramayız. Bu yüzden  fonksiyonu yönlendirerek çağırıyoruz.
                child: Text(" insert"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
