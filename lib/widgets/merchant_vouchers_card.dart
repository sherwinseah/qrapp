import 'package:flutter/material.dart';
import 'package:qrapp/providers/vouchers.dart';

class MerchantVouchersCard extends StatelessWidget {
  final VoucherItem item;

  MerchantVouchersCard(this.item);

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
                width: MediaQuery.of(context).size.width * 0.40,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    item.header,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "${item.numberClaimed.toStringAsFixed(0)}/${item.numberIssued.toStringAsFixed(0)}",
                    style: TextStyle(
                        fontSize: 15,
                        color: (item.numberClaimed / item.numberIssued) > 0.8
                            ? Colors.red
                            : Colors.blue),
                  ),
                  Text(
                    "Claimed",
                    style: TextStyle(
                        fontSize: 15,
                        color: (item.numberClaimed / item.numberIssued) > 0.8
                            ? Colors.red
                            : Colors.blue),
                  )
                ],
              ),
              Icon(Icons.edit)
            ],
          ),
        ],
      ),
    );
  }
}
