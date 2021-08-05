import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/vouchers.dart';
import 'package:qrapp/screens/login_screen.dart';
import './screens/tabs_screen.dart';
import './screens/scan_qr_screen.dart';
import './screens/voucher_shop_screen.dart';
import './screens/wallet_screen.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF1D3557,
  const <int, Color>{
    50: const Color(0xFF0E7AC7),
    100: const Color(0xFF0E7AC7),
    200: const Color(0xFF0E7AC7),
    300: const Color(0xFF0E7AC7),
    400: const Color(0xFF0E7AC7),
    500: const Color(0xFF0E7AC7),
    600: const Color(0xFF0E7AC7),
    700: const Color(0xFF0E7AC7),
    800: const Color(0xFF0E7AC7),
    900: const Color(0xFF0E7AC7),
  },
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Vouchers())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR App',
        theme: ThemeData(
          primarySwatch: kPrimaryColor,
          accentColor: Color.fromRGBO(168, 218, 220, 1),
          canvasColor: Color.fromRGBO(69, 123, 157, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                bodyText2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1), fontSize: 18),
                headline6: TextStyle(
                  fontSize: 30,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
                headline1: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
        ),
        routes: {
          '/': (ctx) => LoginScreen(),
          TabsScreen.routename: (ctx) => TabsScreen(),
          VoucherShopScreen.routeName: (ctx) => VoucherShopScreen(),
          ScanQrScreen.routeName: (ctx) => ScanQrScreen(),
          WalletScreen.routeName: (ctx) => WalletScreen(),
        },
      ),
    );
  }
}
