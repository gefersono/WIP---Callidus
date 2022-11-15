import 'package:flutter/material.dart';
import 'package:sunmi_printer/sunmi_printer.dart';

String displayText = "";
bool isBold = false;
bool isUnderline = false;
double _tamText = 24;
double _isTamText = 24;
String _charSet = "CP18030";

class TextActivity extends StatefulWidget {
  //const MeuApp({Key? key}) : super(key: key);
  const TextActivity({super.key});
  @override
  State<TextActivity> createState() => _TextActivityState();
}

class _TextActivityState extends State<TextActivity> {
  TextEditingController textController = TextEditingController(
      text:
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa欢迎光临(Simplified Chinese)\n歡迎光臨（traditional chinese）\nWelcome(English)\n어서 오세요.(Korean)\nいらっしゃいませ(Japanese)\nWillkommen in der(Germany)\nSouhaits de bienvenue(France)\nยินดีต้อนรับสู่(Thai)\nДобро пожаловать(Russian)\nBenvenuti a(Italian)\nvítejte v(Czech)\nBEM - vindo Ao Brasil(Portutuese)\nمرحبا بكم في(Arabic)");

  _printText() async {
    // must start with this function if you are print with label
    await SunmiPrinter.startLabelPrint();

    /// 0 align left, 1 center, 2 align right.
    await SunmiPrinter.setAlignment(PrintAlign.CENTER);
    // spacing line
    await SunmiPrinter.lineWrap(1);
    // print image only support Uint8List
    //await SunmiPrinter.printImage(img);
    await SunmiPrinter.printText('$displayText\n\n');
    // only run exitLabelPrint at last index if you need print multiple label at once;
    await SunmiPrinter.exitLabelPrint();
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //0xFF2e3040
      backgroundColor: const Color(0xFF171a2c),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171a2c),
        title: const Text('Impressão de texto'),
        actions: const <Widget>[TesteDoTexto()],
      ),
      body: SafeArea(
        //Text('QrCode', style: TextStyle(fontSize: 30.0, color: Colors.white),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Typeface
            Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'text typeface',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 278, bottom: 0, right: 0, top: 20),
                  child: Text(
                    'Type monospace',
                    style: TextStyle(fontSize: 13.0, color: Colors.grey),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    width: 360,
                    height: 50,
                    //color: Colors.red,
                  ),
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(13.0),
                      fixedSize: const Size.fromWidth(360),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: null,
                    child: const Text(''),
                  ),
                ),
              ],
            ),
            const Center(
              child: SizedBox(
                width: 360.0,
                height: 0.2,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
            ),
            //Charset
            Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'char set',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 295, bottom: 0, right: 0, top: 20),
                  child: Text(_charSet,
                      style:
                          const TextStyle(fontSize: 15.0, color: Colors.grey)),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 355, bottom: 0, right: 0, top: 18),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(13.0),
                      fixedSize: const Size.fromWidth(360),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        scrollable: true,
                        insetPadding: const EdgeInsets.symmetric(vertical: 206),
                        title: const Text('char set'),
                        content: StatefulBuilder(
                          builder: (context, state) {
                            return Column(
                              children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                        () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                        () {
                                          _charSet = 'CP437';
                                        },
                                      );
                                    },
                                    child: const Text('CP437')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP850';
                                        },
                                      );
                                    },
                                    child: const Text('CP850')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP860';
                                        },
                                      );
                                    },
                                    child: const Text('CP860')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP863';
                                        },
                                      );
                                    },
                                    child: const Text('CP863')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP865';
                                        },
                                      );
                                    },
                                    child: const Text('CP865')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP857';
                                        },
                                      );
                                    },
                                    child: const Text('CP857')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP737';
                                        },
                                      );
                                    },
                                    child: const Text('CP737')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'Windows-1252';
                                        },
                                      );
                                    },
                                    child: const Text('Windows-1252')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP866';
                                        },
                                      );
                                    },
                                    child: const Text('CP866')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP852';
                                        },
                                      );
                                    },
                                    child: const Text('CP852')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP858';
                                        },
                                      );
                                    },
                                    child: const Text('CP858')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP862';
                                        },
                                      );
                                    },
                                    child: const Text('CP862')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP864';
                                        },
                                      );
                                    },
                                    child: const Text('CP864')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'CP18030';
                                        },
                                      );
                                    },
                                    child: const Text('CP18030')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'BIG5';
                                        },
                                      );
                                    },
                                    child: const Text('BIG5')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'KSC5601';
                                        },
                                      );
                                    },
                                    child: const Text('KSC5601')),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.all(13.0),
                                      fixedSize: const Size.fromWidth(250),
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      state(
                                            () {
                                          Navigator.pop(context,'');
                                        },
                                      );
                                      setState(
                                            () {
                                          _charSet = 'utf-8';
                                        },
                                      );
                                    },
                                    child: const Text('utf-8')),
                              ],
                            );
                          },
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                              setState(() {
                                _charSet = 'CP18030';
                              });
                            },
                            child: const Center(child: Text('Cancelar', style: TextStyle(fontSize: 15, color: Colors.black),)),
                          ),
                        ],
                      ),
                    ),
                    child: const Text(
                        ''), //Text(tamText1, style: const TextStyle(fontSize: 15.0, color: Colors.grey)),
                  ),
                ),
              ],
            ),
            const Center(
              child: SizedBox(
                width: 360.0,
                height: 0.5,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
            ),
            //Tamanho texto
            Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'Tamanho texto',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 320, bottom: 0, right: 0, top: 20),
                  child: Text('$_isTamText',
                      style:
                          const TextStyle(fontSize: 17.0, color: Colors.grey)),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 355, bottom: 0, right: 0, top: 18),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(13.0),
                      fixedSize: const Size.fromWidth(360),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        insetPadding: const EdgeInsets.symmetric(vertical: 280),
                        title: const Text('Tamanho texto'),
                        content: StatefulBuilder(
                          builder: (context, state) {
                            return Stack(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 25, bottom: 0, right: 0, top: 30),
                                  child: Text(
                                    '12.0',
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 190, bottom: 0, right: 0, top: 30),
                                  child: Text(
                                    '36.0',
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 105, bottom: 0, right: 0, top: 30),
                                  child: Text(
                                    '$_tamText',
                                    style: const TextStyle(
                                        fontSize: 15.0, color: Colors.black),
                                  ),
                                ),
                                Slider(
                                  value: _tamText,
                                  max: 36,
                                  min: 12,
                                  divisions: 24,
                                  activeColor: Colors.red,
                                  inactiveColor: Colors.grey,
                                  thumbColor: Colors.grey,
                                  //label: _tamText.round().toString(),
                                  onChanged: (double value) {
                                    state(() {
                                      //_tamText = value;
                                    });
                                    setState(() {
                                      _tamText = value;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.all(10.0),
                              fixedSize: const Size.fromWidth(120),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {Navigator.pop(context, 'Cancel');
                              setState(() {
                                _tamText = 24;
                              });},
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.all(10.0),
                              fixedSize: const Size.fromWidth(120),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () { Navigator.pop(context, 'OK');
                              setState(() {
                                _isTamText = _tamText;
                              });},
                            child: const Text('Confirmar'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text(
                        ''), //Text(tamText1, style: const TextStyle(fontSize: 15.0, color: Colors.grey)),
                  ),
                ),
              ],
            ),
            //Checkbox's
            Center(
              child: Container(
                width: 360.0,
                height: 50.0,
                color: const Color(0xFF454855),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'bold',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.grey,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isBold,
                      onChanged: (bool? value) {
                        setState(() {
                          isBold = value!;
                        });
                      },
                    ),
                    const Text(
                      'underline',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.grey,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isUnderline,
                      onChanged: (bool? value) {
                        setState(() {
                          isUnderline = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 100.0,
              height: 3.0,
            ),
            //Texto
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextFormField(
                controller: textController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.zero)),
                maxLines: 11,
              ),
            ),
            const SizedBox(
              width: 100.0,
              height: 3.0,
            ),
            //Imprimir
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 360,
                      height: 50,
                      color: Colors.red,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size.fromWidth(360),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(13.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        setState(() {
                          displayText = textController.text;
                          _printText();
                        });
                      },
                      child: const Text('Imprimir'),
                    ),
                  ],
                ),
              ),
            ),
            //Teste da chamada do Texto
          ],
        ),
      ),
    );
  }
}

class TesteDoTexto extends StatelessWidget {
  const TesteDoTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Texto Escrito'),
          content: Text(displayText, style: const TextStyle(fontSize: 20)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text(
        'Texto',
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}
