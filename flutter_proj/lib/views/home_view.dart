import 'package:flutter/material.dart';
import 'package:tectoy_app/activity/formulary_activity.dart';
import 'package:tectoy_app/activity/image_activity.dart';
import 'package:tectoy_app/activity/text_activity.dart';
import 'package:tectoy_app/models/home_controller.dart';
import 'package:tectoy_app/activity/qr_activity.dart';
import 'package:tectoy_app/activity/bar_code_activity.dart';
import 'package:tectoy_app/activity/setting_activity.dart';

/// Main View
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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

                  //Complete Test
                  HomeButton(
                      assetImage: 'images/function_all.png',
                      textImage: 'Teste Completo',
                      activityIndex: 0),

                  //QRCode
                  HomeButton(
                      assetImage: 'images/function_qr.png',
                      textImage: 'QR Code',
                      activityIndex: 1),

                  //BarCode
                  HomeButton(
                      assetImage: 'images/function_barcode.png',
                      textImage: 'Bar Code',
                      activityIndex: 2),

                  //Text
                  HomeButton(
                      assetImage: 'images/function_text.png',
                      textImage: 'Texto',
                      activityIndex: 3),

                  //Table
                  HomeButton(
                      assetImage: 'images/function_tab.png',
                      textImage: 'Formulário',
                      activityIndex: 4),

                  //Image
                  HomeButton(
                      assetImage: 'images/function_pic.png',
                      textImage: 'Imagem',
                      activityIndex: 5),

                  //Line Wrap
                  HomeButton(
                      assetImage: 'images/function_threeline.png',
                      textImage: 'Avanço Papel',
                      activityIndex: 6),

                  //Cash
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

                  //Black Line
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_blackline.png',
                      textImage: 'Tarja Preta'),

                  //Label
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_label.png',
                      textImage: 'Teste de Etiqueta'),

                  //Cut Paper
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_cortar.png',
                      textImage: 'Cortar Papel'),

                  //Scanner
                  const HomeButtonPlaceHolder(
                      assetImage: 'images/function_scanner.png',
                      textImage: 'Scanner'),

                  //Led
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

/// Main Button Pattern
class HomeButton extends StatelessWidget {
  HomeButton(
      {Key? key,
      required this.assetImage,
      required this.textImage,
      required this.activityIndex})
      : super(key: key);

  final String assetImage;
  final String textImage;
  final int activityIndex;
  final List<Widget> activityList = [
    const Placeholder(), //CompleteTest
    const QRCodeActivity(),
    const BarCodeActivity(),
    const TextActivity(),
    const FormularyActivity(),
    const ImageActivity(),
    const Placeholder(), //LineWrap
  ];

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
              switch (activityIndex) {
                case 0:
                  printCompleteTest();
                  break;
                case 6:
                  lineWrap();
                  break;
                default:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => activityList[activityIndex]),
                  );
              }
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

/// PlaceHolder Button Pattern
class HomeButtonPlaceHolder extends StatelessWidget {
  const HomeButtonPlaceHolder(
      {Key? key, required this.assetImage, required this.textImage})
      : super(key: key);
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Função nao implementada'),
                ),
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

/// This class is used to just put a placeholder in 'activityList' from 'HomeButton' class to change index for better readability.
class Placeholder extends StatelessWidget {
  const Placeholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
