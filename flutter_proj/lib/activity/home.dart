import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import '../views/home_view.dart';

/// Main Call
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
  /// Printer Connection
  void initState() {
    super.initState();

    _bindingPrinter().then((bool? isBind) async => {
          SunmiPrinter.paperSize().then((int size) {
            setState(() {
              paperSize = size;
              print('Paper Size: $paperSize ');
            });
          }),
          SunmiPrinter.printerVersion().then((String version) {
            setState(() {
              printerVersion = version;
              print('Printer Version: $printerVersion');
            });
          }),
          SunmiPrinter.serialNumber().then((String serial) {
            setState(() {
              serialNumber = serial;
              print('Serial number: $serialNumber');
            });
          }),
          setState(() {
            printBinded = isBind!;
            print('Print Binded: $printBinded');
          }),
        });
  }

  String getSerialNumber(){
    return serialNumber;
  }

  Future<bool?> _bindingPrinter() async {
    final bool? result = await SunmiPrinter.bindingPrinter();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return const HomeView(); //Main Interface
  }
}
