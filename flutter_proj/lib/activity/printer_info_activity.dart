import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

class PrinterInfoActivity extends StatefulWidget {
  const PrinterInfoActivity({Key? key}) : super(key: key);

  @override
  State<PrinterInfoActivity> createState() => _PrinterInfoActivityState();
}

class _PrinterInfoActivityState extends State<PrinterInfoActivity> {
  bool printBinded = false;
  int paperSize = 0;
  String serialNumber = "";
  String printerVersion = "";

  @override

  /// Printer Connection
  void initState() {
    super.initState();

    _bindingPrinter().then((bool? isBind) async => {
          SunmiPrinter.paperSize().then((int size) {
            setState(() {
              paperSize = size;
              //print('Paper Size: $paperSize ');
            });
          }),
          SunmiPrinter.printerVersion().then((String version) {
            setState(() {
              printerVersion = version;
              //print('Printer Version: $printerVersion');
            });
          }),
          SunmiPrinter.serialNumber().then((String serial) {
            setState(() {
              serialNumber = serial;
              //print('Serial number: $serialNumber');
            });
          }),
          setState(() {
            printBinded = isBind!;
            //print('Print Binded: $printBinded');
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
        title: const Text('Informações da Impressora'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          InfoWidget(
              infoText: 'Numero de Série',
              paddingLeft: 0,
              printerInfo: serialNumber),
          InfoWidget(
              infoText: 'Versão Firmware',
              paddingLeft: 150,
              printerInfo: printerVersion),
          InfoWidget(
              infoText: 'Impressora Vinculada',
              paddingLeft: 115,
              printerInfo: printBinded.toString())
        ],
      )),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {Key? key,
      required this.infoText,
      required this.paddingLeft,
      required this.printerInfo})
      : super(key: key);
  final String infoText;
  final double paddingLeft;
  final String printerInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 17.5),
              ),
              onPressed: () {},
              child: Text(infoText),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: paddingLeft, bottom: 0, right: 0, top: 5),
              child: Text(
                printerInfo,
                style: const TextStyle(fontSize: 11.5, color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 400.0,
          height: 1.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        )
      ],
    );
  }
}
