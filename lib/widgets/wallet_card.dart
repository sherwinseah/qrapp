import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrapp/providers/vouchers.dart';

class WalletCard extends StatelessWidget {
  final VoucherItem item;
  Function useVoucher;

  WalletCard(this.item, this.useVoucher);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: item.isExpiring ? Colors.red.shade100 : Colors.white),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Use Voucher?'),
                            content: Text(
                                'Do you want to use "${item.header}" in ${item.merchant}?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop(false);
                                  },
                                  child: Text('No')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop(true);
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext bc) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            20))),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            child: Column(
                                              children: [
                                                Text(
                                                  item.header,
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                ),
                                                QrImage(
                                                  data: item.id,
                                                  size: 200,
                                                )
                                              ],
                                            ),
                                          );
                                        });

                                    useVoucher(item.id);
                                  },
                                  child: Text('Yes')),
                            ],
                          ));
                },
                child: Text("USE"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
