import 'package:flutter/material.dart';
import 'package:qrapp/providers/vouchers.dart';

class WalletUnusableCard extends StatelessWidget {
  final VoucherItem item;

  WalletUnusableCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundImage: AssetImage(item.imageUrl1),
                  radius: 30,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    children: [
                      Text(
                        item.header,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        item.exclusions.toString().substring(
                            1, item.exclusions.toString().length - 1),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text("Expires on ${item.validTill}",
                          style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ),
              item.isUsed
                  ? FittedBox(
                      child: Text("USED"),
                      fit: BoxFit.contain,
                    )
                  : FittedBox(
                      child: Text('EXPIRED'),
                      fit: BoxFit.contain,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
