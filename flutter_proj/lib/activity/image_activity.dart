import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

class ImageActivity extends StatelessWidget {
  const ImageActivity({Key? key}) : super(key: key);

  printImage() async {
    final ByteData bytes = await rootBundle.load('images/test1.jpg');
    final Uint8List list = bytes.buffer.asUint8List();
    await SunmiPrinter.initPrinter();
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.startTransactionPrint(true);
    await SunmiPrinter.printImage(list);
    await SunmiPrinter.lineWrap(5);
    await SunmiPrinter.exitTransactionPrint(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2e3040),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171a2c),
        title: const Text('Imagem'),
      ),
      body: SafeArea(
        //Text('QrCode', style: TextStyle(fontSize: 30.0, color: Colors.white),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('Alinhamento'),
            ),
            const SizedBox(
              width: 400.0,
              height: 1.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('Cortar Papel'),
            ),
            const SizedBox(
              width: 400.0,
              height: 1.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ),
            //Colocar checkbox aqui
            const SizedBox(
              width: 400.0,
              height: 1.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            const SizedBox(
              width: 100.0,
              height: 368.0,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 360,
                      height: 50,
                      color: Colors.red,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size.fromWidth(360),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(13.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        printImage();
                      },
                      child: const Text('Imprimir'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
