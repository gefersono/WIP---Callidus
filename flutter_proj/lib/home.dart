import 'package:flutter/material.dart';
import 'package:tectoy_app/formulary_activity.dart';
import 'package:tectoy_app/image_activity.dart';
import 'qr_activity.dart';
import 'setting_activity.dart';
import 'bar_code_activity.dart';
import 'text_activity.dart';

class Home extends StatelessWidget {
  //const MeuApp({Key? key}) : super(key: key);
  const Home({super.key});

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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                            final snackBar = SnackBar(
                              content: const Text('Teste'),
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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