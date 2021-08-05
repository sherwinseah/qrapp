import 'package:flutter/material.dart';
import 'package:qrapp/screens/login_screen.dart';
import 'package:qrapp/screens/merchant_scan_qr_screen.dart';
import 'scan_qr_screen.dart';
import 'merchant_vouchers_screen.dart';
import 'merchant_account_screen.dart';

class MerchantTabsScreen extends StatefulWidget {
  static const routename = '/merchant-tabs';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<MerchantTabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  // static const IconData path = IconData(0xe214, fontFamily: 'MaterialIcons');
  // static const IconData explore = IconData(0xf037, fontFamily: 'MaterialIcons');
  // static const IconData person = IconData(0xf006c, fontFamily: 'MaterialIcons');

  @override
  void initState() {
    _pages = [
      {'page': MerchantVouchersScreen(), 'title': 'My Vouchers'},
      {'page': MerchantScanQrScreen(), 'title': 'Scan QR'},
      {'page': MerchantAccountScreen(), 'title': 'My Account'},
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
        actions: _selectedPageIndex == 2
            ? [
                IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    })
              ]
            : _selectedPageIndex == 0
                ? [
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20))),
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Add Product",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Form(
                                              child: Column(
                                            children: [
                                              TextFormField(
                                                decoration: InputDecoration(
                                                    labelText: 'Title'),
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                    labelText: 'Promotions'),
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    labelText: 'Cost'),
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Number of Vouchers'),
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                            ],
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        })
                  ]
                : null,
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
            label: 'Vouchers',
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
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
