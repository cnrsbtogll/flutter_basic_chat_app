import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Uygulaması Arayüzü',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Uygulaması"),
      ),
      body: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<MesajBalonu> mesajListesi = [];
  mesajlariEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(
        mesaj: gelenMesaj,
      );
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 75),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: t1,
              onSubmitted: mesajlariEkle,
            ),
          ),
          IconButton(
              onPressed: () => mesajlariEkle(t1.text),
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                padding: EdgeInsets.all(15),
                reverse: true,
                itemCount: mesajListesi.length,
                itemBuilder: (_, indeksNumarasi) =>
                    mesajListesi[indeksNumarasi]),
          ),
          const Divider(
            thickness: 1,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Caner";

class MesajBalonu extends StatelessWidget {
  // const MesajBalonu({Key? key}) : super(key: key);

  var mesaj;
  MesajBalonu({Key? key, this.mesaj}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          CircleAvatar(child: Text(isim[0])),
          Column(
            children: [
              Text(isim),
              Container(margin: EdgeInsets.all(5), child: Text(mesaj))
            ],
          )
        ],
      ),
    );
  }
}
