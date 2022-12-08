import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:tectoy_app/formulary_activity.dart';
import 'package:tectoy_app/image_activity.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'qr_activity.dart';
import 'setting_activity.dart';
import 'bar_code_activity.dart';
import 'text_activity.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String placeholder = 'Função nao implementada';
  late PrinterStatus _printerStatus;
  bool printBinded = false;
  int paperSize = 0;
  String serialNumber = "";
  String printerVersion = "";

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

  @override
  void initState() {
    super.initState();

    _bindingPrinter().then((bool? isBind) async => {
          //_getPrinterStatus(),
          //print(_printerStatus);
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

          SunmiPrinter.getPrinterStatus().then((PrinterStatus status) {
            setState(() {
              _printerStatus = status;
            });
          }),

          setState(() {
            printBinded = isBind!;
          }),
        });
  }

  /// must binding ur printer at first init in app
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
                  //Teste Completo
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFF171a2c),
                    //const Image(image: AssetImage('images/function_all.png')),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            iconSize: 100,
                            icon: const Image(
                                image: AssetImage('images/function_all.png')),
                            onPressed: () {
                              _printCompleteTest();
                            }),
                        const Text(
                          'Teste Completo',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  //QRCode
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFF171a2c),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: 100,
                          icon: const Image(
                              image: AssetImage('images/function_qr.png')),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QRCodeActivity()),
                            );
                          },
                        ),
                        const Text(
                          'QR Code',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  //BarCode
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFF171a2c),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: 100,
                          icon: const Image(
                              image: AssetImage('images/function_barcode.png')),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BarCodeActivity()),
                            );
                          },
                        ),
                        const Text(
                          'BarCode',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  //Texto
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFF171a2c),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: 100,
                          icon: const Image(
                              image: AssetImage('images/function_text.png')),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TextActivity()),
                            );
                          },
                        ),
                        const Text(
                          'Texto',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  //Formulário
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFF171a2c),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: 100,
                          icon: const Image(
                              image: AssetImage('images/function_tab.png')),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FormularyActivity()),
                            );
                          },
                        ),
                        const Text(
                          'Formulário',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  //Imagem
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFF171a2c),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: 100,
                          icon: const Image(
                              image: AssetImage('images/function_pic.png')),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ImageActivity()),
                            );
                          },
                        ),
                        const Text(
                          'Imagem',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  //Avanço Papel
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFF171a2c),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: 100,
                          icon: const Image(
                              image:
                                  AssetImage('images/function_threeline.png')),
                          onPressed: () async {
                            await SunmiPrinter.startTransactionPrint(true);
                            await SunmiPrinter.lineWrap(5);
                            await SunmiPrinter.exitTransactionPrint(true);
                          },
                        ),
                        const Text(
                          'Avanço Papel',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  //Gaveta
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_cash.png',
                      textImage: 'Gaveta'),

                  //LCD
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_lcd.png', textImage: 'LCD'),

                  //Status
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color(0xFF171a2c),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: 100,
                          icon: const Image(
                              image: AssetImage('images/function_status.png')),
                          onPressed: () {
                            var printerStatus =
                                (_printerStatus == PrinterStatus.ERROR)
                                    ? 'A impressora está funcionando'
                                    : 'A impressora não está funcionando';
                            //print(_printerStatus);
                            final snackBar = SnackBar(
                              content: Text(printerStatus),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Status',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),

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
