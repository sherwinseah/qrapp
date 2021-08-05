import 'package:flutter/material.dart';
import 'scan_qr_screen.dart';
import 'voucher_shop_screen.dart';
import 'wallet_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routename = '/tabs';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  // static const IconData path = IconData(0xe214, fontFamily: 'MaterialIcons');
  // static const IconData explore = IconData(0xf037, fontFamily: 'MaterialIcons');
  // static const IconData person = IconData(0xf006c, fontFamily: 'MaterialIcons');

  @override
  void initState() {
    _pages = [
      {'page': VoucherShopScreen(), 'title': 'Vouchers Mall'},
      {'page': ScanQrScreen(), 'title': 'Scan QR'},
      {'page': WalletScreen(), 'title': 'Voucher Wallet'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        // actions: _selectedPageIndex == 0
        //     ? [
        //         IconButton(
        //             icon: Icon(Icons.star),
        //             onPressed: () {
        //               Navigator.of(context)
        //                   .pushNamed(AchievementScreen.routeName);
        //             })
        //       ]
        //     : null,
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.storefront_outlined),
            label: 'Vouchers Mall',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.red,
                ),
                child: Icon(Icons.qr_code)),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}
