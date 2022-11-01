import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/add_screen.dart';
import 'package:Kamataha/src/screens/all_suppliers.dart';
import 'package:Kamataha/src/screens/dashboard.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  bool _isSigningOut = false;

  final String time = DateTime.now().toString().substring(0, 4);

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: CustomColors.firebaseNavy,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Text(""),
            const Text(""),
            const Text(""),
            const Text(""),
            const Text(""),
            const Text(""),
            const Text(""),
            const Text(""),
            Card(
              color: CustomColors.firebaseOrange,
              child: ListTile(
                leading: const Icon(
                  Icons.account_box_outlined,
                  color: Colors.white,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                title: const Text(
                  'All Suppliers',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllSuppliers(),
                  ));
                },
                subtitle: Text(
                  "See all registered suppliers",
                  style: TextStyle(color: CustomColors.firebaseGrey),
                ),
              ),
            ),
            // Card(
            //   color: Colors.lightGreen,
            //   child: ListTile(
            //     leading: const Icon(
            //       Icons.credit_score_outlined,
            //       color: Colors.white,
            //     ),
            //     trailing: const Icon(Icons.arrow_forward_ios_outlined),
            //     title: const Text(
            //       'Credits',
            //       style: TextStyle(
            //         fontSize: 24.0,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => const CreditsScreen()));
            //     },
            //     subtitle: Text(
            //       "About US | Technologies",
            //       style: TextStyle(color: CustomColors.firebaseGrey),
            //     ),
            //   ),
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "v2.0",
                  style: TextStyle(color: CustomColors.firebaseGrey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: AppBarTitle(),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () => {_buildDrawer(context)},
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: CustomColors.firebaseOrange,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      drawer: _buildDrawer(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Dashboard(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 90, bottom: 5),
        child: Text(
          "Copyright " + time + " ©️" + "ABC Constructions",
          style: TextStyle(color: CustomColors.firebaseOrange),
        ),
      ),
    );
  }
}
