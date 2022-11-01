import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/deliveries.dart';
import 'package:Kamataha/src/screens/order.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            ),
            backgroundColor: CustomColors.firebaseNavy,
            elevation: 0,
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "ORDERS",
                  icon: Icon(Icons.access_alarm),
                ),
                Tab(
                  text: "DELIVERIES",
                  icon: Icon(Icons.delivery_dining),
                ),
              ],
            )),

        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   backgroundColor: CustomColors.firebaseOrange,
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) => AddScreen(user: _user),
        //       ),
        //     );
        //   },
        // ),
        body: TabBarView(
          children: [Order(), Delivery()],
        ),
      ),
    );
  }
}
