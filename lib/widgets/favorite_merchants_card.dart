import 'package:flutter/material.dart';
import 'package:qrapp/providers/vouchers.dart';

class FavoriteMerchantsCard extends StatelessWidget {
  final VoucherItem item;

  FavoriteMerchantsCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: CircleAvatar(
        backgroundImage: AssetImage(item.imageUrl1),
        radius: 30,
      ),
    );
  }
}
