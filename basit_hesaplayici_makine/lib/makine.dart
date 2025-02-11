import 'package:flutter/material.dart';

class Makine extends StatefulWidget {
  const Makine({super.key});

  @override
  State<Makine> createState() => _MakineState();
}

class _MakineState extends State<Makine> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  num sayi1 = 0, sayi2 = 0, sonuc = 0;

  void Topla() {
    setState(() {
      sayi1 = num.tryParse(t1.text) ?? 0;
      sayi2 = num.tryParse(t2.text) ?? 0;
      sonuc = sayi1 + sayi2;
    });
  }

  void Eksiltme() {
    setState(() {
      sayi1 = num.tryParse(t1.text) ?? 0;
      sayi2 = num.tryParse(t2.text) ?? 0;
      sonuc = sayi1 - sayi2;
    });
  }

  void Carpma() {
    setState(() {
      sayi1 = num.tryParse(t1.text) ?? 0;
      sayi2 = num.tryParse(t2.text) ?? 0;
      sonuc = sayi1 * sayi2;
    });
  }

  void Bolme() {
    setState(() {
      sayi1 = num.tryParse(t1.text) ?? 0;
      sayi2 = num.tryParse(t2.text) ?? 1;
      1;
      sonuc = sayi1 / sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: t1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Birinci Sayı"),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: t2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "İkinci Sayı"),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: Topla, child: const Text("Toplama")),
              ElevatedButton(
                  onPressed: Eksiltme, child: const Text("Çıkartma")),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: Carpma, child: const Text("Çarpma")),
              ElevatedButton(onPressed: Bolme, child: const Text("Bölme")),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Sonuç: $sonuc",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
