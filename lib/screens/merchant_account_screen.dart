import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/vouchers.dart';
import 'package:qrapp/widgets/wallet_card.dart';
import 'package:qrapp/widgets/wallet_unusable_card.dart';

class MerchantAccountScreen extends StatefulWidget {
  static const routeName = '/merchant-account';

  @override
  _MerchantAccountScreenState createState() => _MerchantAccountScreenState();
}

class _MerchantAccountScreenState extends State<MerchantAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final vouchersData = Provider.of<Vouchers>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade300,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset('assets/images/nike_logo.png')),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nike",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "View Profile",
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.bar_chart),
                    Text(
                      "Trends and Analysis",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/analysis.png'),
                        fit: BoxFit.fill),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
