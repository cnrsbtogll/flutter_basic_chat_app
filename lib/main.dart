import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temel Mesajlaşma Uygulaması',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
        title: const Text("Mesajlaşma Uygulaması Arayüzü"),
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
  List mesajListesi = [];
  mesajlariEkle() {
    setState(() {
      mesajListesi.insert(0, t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(40),
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: mesajListesi.length,
                    itemBuilder: (context, indeks) =>
                        Text(mesajListesi[indeks]))),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: t1,
                  ),
                ),
                ElevatedButton(
                    onPressed: mesajlariEkle, child: const Text("Gönder"))
              ],
            ),
          ],
        ));
  }
}
