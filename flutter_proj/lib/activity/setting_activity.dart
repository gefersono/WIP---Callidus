import 'package:flutter/material.dart';
import 'package:tectoy_app/activity/printer_info_activity.dart';

class SettingActivity extends StatelessWidget {
  const SettingActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2e3040),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171a2c),
        title: const Text('Configurações'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: const Text('Método de conexão'),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 125, bottom: 0, right: 0, top: 5),
                  child: Text(
                    'API',
                    style: TextStyle(fontSize: 20.0, color: Colors.grey),
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
            ),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrinterInfoActivity(),
                      ),
                    );
                  },
                  child: const Text('Informação da impressora'),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 60, bottom: 0, right: 0, top: 5),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrinterInfoActivity(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.input_sharp,
                        color: Colors.grey,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              width: 100.0,
              height: 440.0,
            ),
          ],
        ),
      ),
    );
  }
}
