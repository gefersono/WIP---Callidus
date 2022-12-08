import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

/// Full Test Function
Future<void> printCompleteTest() async {
  await SunmiPrinter.startTransactionPrint(true);

  await SunmiPrinter.setCustomFontSize(24);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
  await SunmiPrinter.printText('Alinhamento');
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.printText('--------------------------------');
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
  await SunmiPrinter.printText('TecToy Automação');
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
  await SunmiPrinter.printText('TecToy Automação');
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.RIGHT);
  await SunmiPrinter.printText('TecToy Automação');
  await SunmiPrinter.lineWrap(1);

  await SunmiPrinter.printText('--------------------------------');
  await SunmiPrinter.setCustomFontSize(48);
  await SunmiPrinter.printText('TecToy Automação');

  await SunmiPrinter.setCustomFontSize(24);
  await SunmiPrinter.lineWrap(2);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
  await SunmiPrinter.printText('Imprime BarCode');
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.printText('--------------------------------');
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
  await SunmiPrinter.printBarCode('1234567890',
      barcodeType: SunmiBarcodeType.CODE128,
      textPosition: SunmiBarcodeTextPos.TEXT_UNDER,
      height: 100);
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
  await SunmiPrinter.printBarCode('1234567890',
      barcodeType: SunmiBarcodeType.CODE39,
      textPosition: SunmiBarcodeTextPos.BOTH,
      height: 100);
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.RIGHT);
  await SunmiPrinter.printBarCode('1234567890',
      barcodeType: SunmiBarcodeType.CODABAR,
      textPosition: SunmiBarcodeTextPos.TEXT_ABOVE,
      height: 100);

  await SunmiPrinter.lineWrap(2);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
  await SunmiPrinter.printText('Imprime QrCode');
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.printText('--------------------------------');
  await SunmiPrinter.lineWrap(1);

  await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
  await SunmiPrinter.printQRCode('TecToy Automação');
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
  await SunmiPrinter.printQRCode('TecToy Automação');
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.setAlignment(SunmiPrintAlign.RIGHT);
  await SunmiPrinter.printQRCode('TecToy Automação');

  await SunmiPrinter.resetFontSize(); // Reset font to medium size
  await SunmiPrinter.lineWrap(3);
  await SunmiPrinter.submitTransactionPrint(); // SUBMIT and cut paper
  await SunmiPrinter.exitTransactionPrint(true);
}

/// Line Wrap Function
Future<void> lineWrap() async {
  await SunmiPrinter.startTransactionPrint(true);
  await SunmiPrinter.lineWrap(5);
  await SunmiPrinter.exitTransactionPrint(true);
}
