import 'package:flutter/material.dart';

void main() {
  String mesaj = "Merhaba! İlk Uygulamam.";
  runApp(MaterialApp(
    home: MyApp(mesaj: mesaj),
  ));
}

class MyApp extends StatelessWidget {
  final String mesaj;
  MyApp({required this.mesaj});

  @override
  Widget build(BuildContext context) {
    var ogrenciler = [
      "Sinem Şafak",
      "Sevgi Şafak",
      "Baran Şafak",
      "Semra Şafak"
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: ogrenciler.length,
                    itemBuilder: (BuildContext context, int index) {
                      // list viewin builderi eleman sayısı kadar bu kodu çalıştırır
                      return Text(ogrenciler[
                          index]); // bu index döngüdeki gibi bir sayaç formuna tekabül eder.
                    })),
            Center(
              child: ElevatedButton(
                child: Text("Sonucu Göster"),
                onPressed: () {
                  var mesaj = sinavHesapla(85);
                  mesajGoster(context,mesaj);
                },
              ),
            ),
          ],
        ));
  }

  String sinavHesapla(int puan) {
    String mesaj2 = "";
    if (puan >= 50) {
      mesaj2 = "geçti";
    } else if (puan >= 40) {
      mesaj2 = "bütünlemeye kaldı";
    } else {
      mesaj2 = "kaldı";
    }
    return mesaj2;
  }

  void mesajGoster(BuildContext context,String mesaj2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sınav Sonucu"),
          content: Text(mesaj2),
        );
      },
    );
  }
}
