/*

import 'package:flutter/material.dart';

class teste extends StatelessWidget {
  const teste({Key? key}) : super(key: key);
  late PrinterStatus _printerStatus;

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
                  },
                ),
              );
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
    );
  }
}
*/
