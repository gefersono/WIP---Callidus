import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

import 'package:tectoy_app/formulary_activity.dart';
import 'package:tectoy_app/image_activity.dart';
import 'package:tectoy_app/qr_activity.dart';
import 'package:tectoy_app/setting_activity.dart';
import 'package:tectoy_app/bar_code_activity.dart';
import 'package:tectoy_app/text_activity.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool printBinded = false;
  int paperSize = 0;
  String serialNumber = "";
  String printerVersion = "";

  @override
  void initState() {
    super.initState();

    _bindingPrinter().then((bool? isBind) async => {
          SunmiPrinter.paperSize().then((int size) {
            setState(() {
              paperSize = size;
            });
          }),
          SunmiPrinter.printerVersion().then((String version) {
            setState(() {
              printerVersion = version;
            });
          }),
          SunmiPrinter.serialNumber().then((String serial) {
            setState(() {
              serialNumber = serial;
            });
          }),
          setState(() {
            printBinded = isBind!;
          }),
        });
  }

  Future<bool?> _bindingPrinter() async {
    final bool? result = await SunmiPrinter.bindingPrinter();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2e3040),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171a2c),
        title: const Text('TecToy Sunmi Flutter Android'),
        actions: <Widget>[
          //Settings
          IconButton(
            icon: const Image(image: AssetImage('images/setting.png')),
            tooltip: 'Show Settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingActivity()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(2),
              sliver: SliverGrid.count(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 2,
                children: <Widget>[
                  // Main Buttons

                  //Teste Completo
                  const FuncHomeButton(
                      idFunction: 'CompleteTest',
                      assetImage: 'images/function_all.png',
                      textImage: 'Teste Completo'),

                  //QRCode
                  HomeButton(
                      assetImage: 'images/function_qr.png',
                      textImage: 'QR Code',
                      activityIndex: 0),

                  //BarCode
                  HomeButton(
                      assetImage: 'images/function_barcode.png',
                      textImage: 'Bar Code',
                      activityIndex: 1),

                  //Texto
                  HomeButton(
                      assetImage: 'images/function_text.png',
                      textImage: 'Texto',
                      activityIndex: 2),

                  //Formulário
                  HomeButton(
                      assetImage: 'images/function_tab.png',
                      textImage: 'Formulário',
                      activityIndex: 3),

                  //Imagem
                  HomeButton(
                      assetImage: 'images/function_pic.png',
                      textImage: 'Imagem',
                      activityIndex: 4),

                  //Avanço Papel
                  const FuncHomeButton(
                      idFunction: 'LineWrap',
                      assetImage: 'images/function_threeline.png',
                      textImage: 'Avanço Papel'),

                  //Gaveta
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_cash.png',
                      textImage: 'Gaveta'),

                  //LCD
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_lcd.png', textImage: 'LCD'),

                  //Status
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_status.png',
                      textImage: 'Status'),

                  //Tarja Preta
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_blackline.png',
                      textImage: 'Tarja Preta'),

                  //Teste de Etiqueta
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_label.png',
                      textImage: 'Teste de Etiqueta'),

                  //Cortar Papel
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_cortar.png',
                      textImage: 'Cortar Papel'),

                  //Scanner
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_scanner.png',
                      textImage: 'Scanner'),

                  //Luz de Led
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_led.png',
                      textImage: 'Luz de Led'),

                  //PayGo
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_payment.png',
                      textImage: 'PayGo'),

                  //Scanner Leitor
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_scanner.png',
                      textImage: 'Scanner Leitor'),

                  //NFC
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_nfc.png', textImage: 'NFC'),

                  //M-Stef
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_payment.png',
                      textImage: 'M-Stef'),

                  //Display
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/telas.png', textImage: 'Display'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeButtonPlaceHolder extends StatelessWidget {
  const HomeButtonPlaceHolder(
      {Key? key, required this.assetImage, required this.textImage})
      : super(key: key);
  final String placeholder = 'Função nao implementada';
  final String assetImage;
  final String textImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFF171a2c),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            iconSize: 100,
            icon: Image(image: AssetImage(assetImage)),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text(placeholder),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          Text(
            textImage,
            style: const TextStyle(fontSize: 15.0, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  HomeButton(
      {Key? key,
      required this.assetImage,
      required this.textImage,
      required this.activityIndex})
      : super(key: key);

  final String assetImage;
  final String textImage;
  final List<Widget> activityList = [
    const QRCodeActivity(),
    const BarCodeActivity(),
    const TextActivity(),
    const FormularyActivity(),
    const ImageActivity()
  ];
  final int activityIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFF171a2c),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            iconSize: 100,
            icon: Image(image: AssetImage(assetImage)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => activityList[activityIndex]),
              );
            },
          ),
          Text(
            textImage,
            style: const TextStyle(fontSize: 15.0, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class FuncHomeButton extends StatelessWidget {
  const FuncHomeButton(
      {Key? key,
      required this.idFunction,
      required this.assetImage,
      required this.textImage})
      : super(key: key);

  final String idFunction;
  final String assetImage;
  final String textImage;

  Future<void> _printCompleteTest() async {
    await SunmiPrinter.startTransactionPrint(true);

    await SunmiPrinter.setCustomFontSize(24);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printText('Alinhamento');
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.printText('--------------------------------');
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
    await SunmiPrinter.printText('TecToy Automação');
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printText('TecToy Automação');
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.RIGHT);
    await SunmiPrinter.printText('TecToy Automação');
    await SunmiPrinter.lineWrap(1);

    await SunmiPrinter.printText('--------------------------------');
    await SunmiPrinter.setCustomFontSize(48);
    await SunmiPrinter.printText('TecToy Automação');

    await SunmiPrinter.setCustomFontSize(24);
    await SunmiPrinter.lineWrap(2);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printText('Imprime BarCode');
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.printText('--------------------------------');
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
    await SunmiPrinter.printBarCode('1234567890',
        barcodeType: SunmiBarcodeType.CODE128,
        textPosition: SunmiBarcodeTextPos.TEXT_UNDER,
        height: 100);
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printBarCode('1234567890',
        barcodeType: SunmiBarcodeType.CODE39,
        textPosition: SunmiBarcodeTextPos.BOTH,
        height: 100);
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.RIGHT);
    await SunmiPrinter.printBarCode('1234567890',
        barcodeType: SunmiBarcodeType.CODABAR,
        textPosition: SunmiBarcodeTextPos.TEXT_ABOVE,
        height: 100);

    await SunmiPrinter.lineWrap(2);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printText('Imprime QrCode');
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.printText('--------------------------------');
    await SunmiPrinter.lineWrap(1);

    await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
    await SunmiPrinter.printQRCode('TecToy Automação');
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printQRCode('TecToy Automação');
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.RIGHT);
    await SunmiPrinter.printQRCode('TecToy Automação');

    await SunmiPrinter.resetFontSize(); // Reset font to medium size
    await SunmiPrinter.lineWrap(3);
    await SunmiPrinter.submitTransactionPrint(); // SUBMIT and cut paper
    await SunmiPrinter.exitTransactionPrint(true);
  }

  Future<void> _lineWrap() async {
    await SunmiPrinter.startTransactionPrint(true);
    await SunmiPrinter.lineWrap(5);
    await SunmiPrinter.exitTransactionPrint(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFF171a2c),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              iconSize: 100,
              icon: Image(image: AssetImage(assetImage)),
              onPressed: () {
                (idFunction == 'CompleteTest')
                    ? _printCompleteTest()
                    : _lineWrap();
              }),
          Text(
            textImage,
            style: const TextStyle(fontSize: 15.0, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
