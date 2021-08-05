import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/providers/vouchers.dart';
import 'package:qrapp/widgets/favorite_merchants_card.dart';
import 'package:qrapp/widgets/flash_deal_card.dart';
import 'package:qrapp/widgets/top_vouchers_card.dart';

class VoucherShopScreen extends StatefulWidget {
  static const routeName = '/voucher-shop';

  @override
  _VoucherShopScreenState createState() => _VoucherShopScreenState();
}

class _VoucherShopScreenState extends State<VoucherShopScreen> {
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
                      "Kathy Parkerson",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Available Credits",
                      style: TextStyle(fontSize: 11),
                    )
                  ],
                ),
                Text(
                  "292",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FLASH VOUCHER DEALS",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "00:01:56",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) => FlashDealCards(
                      vouchersData.flashDealOnly[i], vouchersData.addToWallet),
                  itemCount: vouchersData.flashDealOnly.length,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Favorite Merchants",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemBuilder: (ctx, i) =>
                        FavoriteMerchantsCard(vouchersData.favoriteOnly[i]),
                    itemCount: vouchersData.favoriteOnly.length,
                  ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Vouchers",
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
                  itemBuilder: (ctx, i) => TopVouchersCard(
                      vouchersData.notExpired[i], vouchersData.addToWallet),
                  itemCount: vouchersData.notExpired.length > 5
                      ? 5
                      : vouchersData.notExpired.length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
