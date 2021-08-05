import 'package:flutter/material.dart';
import 'package:qrapp/providers/vouchers.dart';

class TopVouchersCard extends StatelessWidget {
  final VoucherItem item;
  Function addToWallet;

  TopVouchersCard(this.item, this.addToWallet);

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
                  child: Text(
                    item.header,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Column(
                children: [
                  Text('\$${item.price}'),
                  item.inWallet
                      ? TextButton(
                          onPressed: () {},
                          child: Text("GOT"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)))
                      : TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: Text('Purchase Voucher?'),
                                      content: Text(
                                          'Do you want to purchase "${item.header}" from ${item.merchant}?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop(false);
                                            },
                                            child: Text('No')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop(true);
                                              addToWallet(item.id);
                                            },
                                            child: Text('Yes')),
                                      ],
                                    ));
                          },
                          child: Text("GET"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
