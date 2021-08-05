import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/vouchers.dart';
import 'package:qrapp/widgets/wallet_card.dart';
import 'package:qrapp/widgets/wallet_unusable_card.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = '/wallet';

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade300,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset('assets/images/Photo.jpg')),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kathy Parkerson",
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
                SizedBox(
                  height: 10,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Account Balance"),
                          Row(
                            children: [
                              Icon(Icons.credit_card_rounded),
                              Text("292 Credits")
                            ],
                          )
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Voucher Savings"),
                          Row(
                            children: [Icon(Icons.save), Text("\$197.30")],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(Icons.mail_outline),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Refer a friend",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Refer your friends to enjoy rewards",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              )),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.account_balance_wallet),
                    Text(
                      "Wallet",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) => WalletCard(
                      vouchersData.inWalletNotUsed[i], vouchersData.useVoucher),
                  itemCount: vouchersData.inWalletNotUsed.length,
                ),
                Row(
                  children: [
                    Text(
                      "Used/Expired",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) =>
                      WalletUnusableCard(vouchersData.inWalletUnusable[i]),
                  itemCount: vouchersData.inWalletUnusable.length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
