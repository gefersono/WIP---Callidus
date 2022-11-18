import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

class BarCodeActivity extends StatefulWidget {
  //const MeuApp({Key? key}) : super(key: key);
  const BarCodeActivity({super.key});

  @override
  State<BarCodeActivity> createState() => _BarCodeActivityState();
}

class _BarCodeActivityState extends State<BarCodeActivity> {

  _printBarCode() async {
    await SunmiPrinter.initPrinter();
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.startTransactionPrint(true);
    await SunmiPrinter.printBarCode('1234567890',
        barcodeType: SunmiBarcodeType.CODE128,
        textPosition: SunmiBarcodeTextPos.TEXT_UNDER,
        height: 100);
    await SunmiPrinter.lineWrap(3);
    await SunmiPrinter.exitTransactionPrint(true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2e3040),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171a2c),
        title: const Text('BarCode'),
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
              child: const Text('BarCode'),
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
              child: const Text('Modelos de BarCode'),
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
              child: const Text('HRI posição'),
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
              child: const Text('Altura'),
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
              child: const Text('Largura'),
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
            
            Center(
              child: BarCodeImage(
                params: Code39BarCodeParams(
                  "1234567890",
                  lineWidth: 2.0,                // width for a single black/white bar (default: 2.0)
                  barHeight: 100.0,               // height for the entire widget (default: 100.0)
                  withText: false,
                ),
                onError: (error) {               // Error handler
                // ignore: avoid_print
                print('error = $error');
                },
              ),
            ),                        
            const SizedBox(
              width: 200.0,
              height: 60.0,
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
                        _printBarCode();
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
