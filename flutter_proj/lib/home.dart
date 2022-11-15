import 'package:flutter/material.dart';
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
  var placeholder = 'Função nao implementada';
  //late PrinterStatus _printerStatus;
  //late PrinterMode _printerMode;

  @override
  void initState() {
    super.initState();

    _bindingPrinter().then( (bool? isBind) async => {
      if (isBind!) {
        //_getPrinterStatus(),
        //_printerMode = await _getPrinterMode(),
      }
    });
  }

  /// must binding ur printer at first init in app
  Future<bool?> _bindingPrinter() async {
    final bool? result = await SunmiPrinter.bindingPrinter();
    return result;
  }

  /// you can get printer status
  //Future<void> _getPrinterStatus() async {
    //final PrinterStatus result = await SunmiPrinter.getPrinterStatus();
    //setState(() {
      //_printerStatus = result;
    //});
  //}

  /*
  Future<PrinterMode> _getPrinterMode() async {
    final PrinterMode mode = await SunmiPrinter.getPrinterMode();
    return mode;
  }
  */

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
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
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
                                  builder: (context) => const BarCodeActivity()),
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
                                  builder: (context) => const FormularyActivity()),
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
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                              image: AssetImage('images/function_cash.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Gaveta',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //Lcd
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
                              image: AssetImage('images/function_lcd.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Lcd',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
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
                            //var printerstatus = (_printerStatus == PrinterStatus.NORMAL)?'A Impressora está funcionando':'Impressora não conectada';
                            final snackBar = SnackBar(
                              content: const Text(''),
                              //content: Text(printerstatus),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Status',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //TarjaPreta
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
                              AssetImage('images/function_blackline.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Tarja preta',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //Teste de Etiqueta
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
                              image: AssetImage('images/function_label.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Teste de Etiqueta',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //Cortar Papel
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
                              image: AssetImage('images/function_cortar.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Cortar Papel',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //Scanner
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
                              image: AssetImage('images/function_scanner.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Scanner',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //Luz de Led
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
                              image: AssetImage('images/function_led.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Luz de Led',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //PayGo
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
                              image: AssetImage('images/function_payment.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'PayGo',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //Scanner Leitor
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
                              image: AssetImage('images/function_scanner.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Scanner Leitor',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //NFC
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
                              image: AssetImage('images/function_nfc.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'NFC',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //M-Stef
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
                              image: AssetImage('images/function_payment.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'M-Stef',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  //Display
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
                              image: AssetImage('images/telas.png')),
                          onPressed: () {
                            // NAO IMPLEMENTADA AINDA
                            final snackBar = SnackBar(
                              content: Text(placeholder),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        const Text(
                          'Display',
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}