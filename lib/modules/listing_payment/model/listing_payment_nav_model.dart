import 'package:tixe_flutter_app/utils/enum.dart';

class ListingPaymentNavModel{
  final ListingType type;
  final String? subTitle;


  const ListingPaymentNavModel({
    required this.type,
    this.subTitle,
  });
}