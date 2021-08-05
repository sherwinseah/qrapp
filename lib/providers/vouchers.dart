import 'package:flutter/material.dart';

class VoucherItem {
  final String id;
  final String merchant;
  final String header;
  final List exclusions;
  final double price;
  final String validFrom;
  final String validTill;
  final String imageUrl1;
  bool isFavorite;
  final bool isExpiring;
  final bool isExpired;
  final bool isFlashDeal;
  final double flashDealPrice;
  bool inWallet;
  bool isUsed;
  final double numberIssued;
  final double numberClaimed;

  VoucherItem({
    @required this.id,
    @required this.merchant,
    @required this.header,
    @required this.exclusions,
    @required this.price,
    @required this.validFrom,
    @required this.validTill,
    this.imageUrl1,
    this.isFavorite = false,
    this.isExpiring = false,
    this.isExpired = false,
    this.isFlashDeal = false,
    this.flashDealPrice,
    this.inWallet = false,
    this.isUsed = false,
    this.numberIssued,
    this.numberClaimed,
  });
}

class Vouchers with ChangeNotifier {
  List<VoucherItem> _items = [
    VoucherItem(
      id: "voucher_1468",
      merchant: "Uniqlo",
      header: "25% storewide",
      exclusions: ["non PH", "2-5pm", "Up to \$20"],
      price: 10,
      validFrom: "05/08/2021",
      validTill: "05/09/2021",
      imageUrl1: "assets/images/uniqlo_logo.png",
      isExpiring: false,
      isFavorite: false,
    ),
    VoucherItem(
      id: "voucher_1357",
      merchant: "Adidas",
      header: "\$25 off new shoe releases",
      exclusions: ["Not inclusive of store exclusive sneakers"],
      price: 12,
      validFrom: "09/05/2021",
      validTill: "15/08/2021",
      imageUrl1: "assets/images/adidas_logo.png",
      isFavorite: true,
      isExpiring: false,
      isFlashDeal: true,
      flashDealPrice: 8,
      inWallet: false,
    ),
    VoucherItem(
      id: "voucher_2580",
      merchant: "Mcdonald's",
      header: "\$20 McDonald's Voucher",
      exclusions: ["All outlets except Jewel", "2-5pm"],
      price: 10,
      validFrom: "12/07/2021",
      validTill: "19/08/2021",
      imageUrl1: "assets/images/mac_logo.png",
      isFavorite: true,
      isExpiring: false,
      isExpired: false,
      inWallet: true,
    ),
    VoucherItem(
      id: "voucher_1312",
      merchant: "Adidas",
      header: "\$20 off new shoe releases",
      exclusions: ["Not inclusive of store exclusive sneakers"],
      price: 10,
      validFrom: "09/05/2021",
      validTill: "04/08/2021",
      imageUrl1: "assets/images/adidas_logo.png",
      isFavorite: false,
      isExpiring: true,
      isExpired: true,
      inWallet: true,
    ),
    VoucherItem(
      id: "voucher_1312",
      merchant: "Nike",
      header: "\$30 off new shoe releases",
      exclusions: ["Only for limited selection"],
      price: 12,
      validFrom: "09/03/2021",
      validTill: "04/04/2021",
      imageUrl1: "assets/images/nike_logo.png",
      isFavorite: false,
      isExpiring: true,
      isExpired: true,
      isUsed: true,
      inWallet: true,
      numberIssued: 50,
      numberClaimed: 50,
    ),
    VoucherItem(
      id: "voucher_2546",
      merchant: "Nike",
      header: "15% off all apparels",
      exclusions: ["Not Available for Jewel", "Capped at \$50"],
      price: 20,
      validFrom: "05/09/2021",
      validTill: "04/10/2021",
      imageUrl1: "assets/images/nike_logo.png",
      isFavorite: true,
      isExpiring: false,
      numberIssued: 80,
      numberClaimed: 77,
    ),
    VoucherItem(
      id: "voucher_2535",
      merchant: "Nike",
      header: "10% off all apparels",
      exclusions: ["Not Available for Jewel", "Capped at \$50"],
      price: 16,
      validFrom: "05/07/2021",
      validTill: "07/08/2021",
      imageUrl1: "assets/images/nike_logo.png",
      isFavorite: false,
      isExpiring: true,
      isFlashDeal: true,
      flashDealPrice: 10,
      inWallet: true,
      numberIssued: 100,
      numberClaimed: 37,
    ),
  ];

  List<VoucherItem> get items {
    return [..._items];
  }

  List<VoucherItem> get flashDealOnly {
    return _items.where((item) => item.isFlashDeal == true).toList();
  }

  List<VoucherItem> get expiringOnly {
    return _items.where((item) => item.isExpiring == true).toList();
  }

  List<VoucherItem> get notExpired {
    return _items.where((item) => item.isExpired == false).toList();
  }

  List<VoucherItem> get favoriteOnly {
    return _items.where((item) => item.isFavorite == true).toList();
  }

  List<VoucherItem> myListedVouchers(String merchant) {
    return _items.where((item) => item.merchant == merchant).toList();
  }

  List<VoucherItem> get inWalletNotUsed {
    return _items
        .where((item) =>
            item.inWallet == true &&
            item.isUsed == false &&
            item.isExpired == false)
        .toList();
  }

  List<VoucherItem> get inWalletUnusable {
    return _items
        .where((item) =>
            item.inWallet == true &&
            (item.isUsed == true || item.isExpired == true))
        .toList();
  }

  void addVoucher(VoucherItem newVoucher) {
    _items.add(newVoucher);
    notifyListeners();
  }

  void addToWallet(String id) {
    bool inwallet = _items.firstWhere((voc) => voc.id == id).inWallet;
    if (inwallet == false) {
      _items.firstWhere((voc) => voc.id == id).inWallet = true;
    }
    notifyListeners();
  }

  void useVoucher(String id) {
    bool isused = _items.firstWhere((voc) => voc.id == id).isUsed;
    if (isused == false) {
      _items.firstWhere((voc) => voc.id == id).isUsed = true;
    }
    notifyListeners();
  }
}
