import 'package:flutter/material.dart';

void main() {
  runApp(const Hesaplayici());
}

class Hesaplayici extends StatelessWidget {
  const Hesaplayici({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hesaplayıcı makine',
      home: const Hesap(),
    );
  }
}

class Hesap extends StatelessWidget {
  const Hesap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basit Hesaplayıcı Makine'),
      ),
      body: Anaekran(),
    );
  }
}

class Anaekran extends StatefulWidget {
  const Anaekran({super.key});

  @override
  State<Anaekran> createState() => _AnaekranState();
}

class _AnaekranState extends State<Anaekran> {
  num sayi1 = 1, sayi2 = 2, sonuc = 0;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  SayiTopla() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);

      sonuc = sayi1 + sayi2;
    });
  }

  SayiCikar() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 - sayi2;
    });
  }

  Carp() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi1 = num.parse(t2.text);
      sonuc = sayi1 * sayi2;
    });
  }

  Bol() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi1 = num.parse(t2.text);
      sonuc = sayi1 / sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Text(sonuc.toString()),
            TextField(
              controller: t1,
            ),
            TextField(
              controller: t2,
            ),
            ElevatedButton(
              onPressed: SayiTopla,
              child: Text("topla"),
            ),
            ElevatedButton(
              onPressed: SayiCikar,
              child: Text("Çıkar"),
            ),
            ElevatedButton(
              onPressed: Carp,
              child: Text("Çarp"),
            ),
            ElevatedButton(
              onPressed: Bol,
              child: Text("Böl"),
            ),
          ],
        ),
      ),
    );
  }
}
