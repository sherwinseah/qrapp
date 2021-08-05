import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQrScreen extends StatefulWidget {
  static const routeName = '/scan-qr';

  @override
  _ScanQrScreenState createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  // final qrKey = GlobalKey(debugLabel: 'QR');

  // QRViewController controller;
  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }

  // Widget buildQrView(BuildContext context) => QRView(
  //       key: qrKey,
  //       onQRViewCreated: onQRViewCreated,
  //     );

  // void onQRViewCreated(QRViewController controller) {}
}
