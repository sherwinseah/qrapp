import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/vouchers.dart';
import 'package:qrapp/widgets/favorite_merchants_card.dart';
import 'package:qrapp/widgets/flash_deal_card.dart';
import 'package:qrapp/widgets/merchant_vouchers_card.dart';
import 'package:qrapp/widgets/top_vouchers_card.dart';

class MerchantVouchersScreen extends StatefulWidget {
  static const routeName = '/merchant-vouchers';

  @override
  _MerchantVouchersScreenState createState() => _MerchantVouchersScreenState();
}

class _MerchantVouchersScreenState extends State<MerchantVouchersScreen> {
  @override
  Widget build(BuildContext context) {
    final vouchersData = Provider.of<Vouchers>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nike",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Listed Vouchers",
                      style: TextStyle(fontSize: 11),
                    )
                  ],
                ),
                Text(
                  vouchersData.myListedVouchers("Nike").length.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
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
                    Text(
                      "Your Listed Vouchers",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "view more",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) => MerchantVouchersCard(
                      vouchersData.myListedVouchers("Nike")[i]),
                  itemCount: vouchersData.myListedVouchers("Nike").length > 5
                      ? 5
                      : vouchersData.myListedVouchers("Nike").length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
