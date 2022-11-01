import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/widgets/deliveries_list.dart';
import 'package:Kamataha/src/widgets/order_list.dart';
import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: DeliverList(),
    );
  }
}
