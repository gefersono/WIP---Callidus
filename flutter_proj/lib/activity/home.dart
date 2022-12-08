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
    return const HomeView(); //Main Interface
  }
}
