import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:permission_handler/permission_handler.dart';

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
  //   controller?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/customer_scan_qr.png'),
            fit: BoxFit.fill),
      ),
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: [buildQrView(context)],
      //   ),
    );
  }

  // Widget buildQrView(BuildContext context) => QRView(
  //       key: qrKey,
  //       onQRViewCreated: onQRViewCreated,
  //     );

  // void onQRViewCreated(QRViewController controller) {}
}
