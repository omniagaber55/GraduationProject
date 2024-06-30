import 'package:app/veiws/email.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

import '../constants.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  bool isFlashOn = false;
  bool isScannerComplete = false;
  MobileScannerController cameraController = MobileScannerController();

  void closeScreen() {
    isScannerComplete = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFlashOn = isFlashOn;
                });
                cameraController.toggleTorch();
              },
              icon: Icon(
                Icons.flash_on,
                color: isFlashOn ? PrimaryColor : PrimaryColor,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                "Place the QR Code in the frame",
                style: TextStyle(color: PrimaryColor, fontSize: 16),
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                MobileScanner(
                  controller: cameraController,
                  allowDuplicates: true,
                  onDetect: (barcode, args) {
                    if (!isScannerComplete) {
                      isScannerComplete = true;
                      String code = barcode.rawValue ?? "----";
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmailVerication()),
                      );
                    } else {
                      final String code = barcode.rawValue!;
                      debugPrint('Barcode found! $code');
                    }
                  },
                ),
                QRScannerOverlay(
                  overlayColor: Colors.white,
                  borderColor: PrimaryColor,
                  borderRadius: 20,
                  borderStrokeWidth: 5,
                  scanAreaWidth: 250,
                  scanAreaHeight: 250,
                ),
              ],
            )),
          ],
        ));
  }
}
