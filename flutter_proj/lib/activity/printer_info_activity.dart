import 'package:flutter/material.dart';

class PrinterInfoActivity extends StatelessWidget {
  const PrinterInfoActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color(0xFF2e3040),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171a2c),
        title: const Text('Informações da Impressora'),
      ),
    );
  }
}
