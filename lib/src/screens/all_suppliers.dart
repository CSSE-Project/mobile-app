import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

class AllSuppliers extends StatefulWidget {
  const AllSuppliers({Key? key}) : super(key: key);

  @override
  _AllSuppliersState createState() => _AllSuppliersState();
}

class _AllSuppliersState extends State<AllSuppliers> {
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
            title: AppBarTitle(),
            backgroundColor: CustomColors.firebaseNavy,
            elevation: 0,
            centerTitle: true,
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Table(
                defaultColumnWidth: FixedColumnWidth(150.0),
                border: TableBorder.all(
                    color: Colors.yellow, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Username',
                          style: TextStyle(fontSize: 20.0, color: Colors.white))
                    ]),
                    Column(children: [
                      Text('Email',
                          style: TextStyle(fontSize: 20.0, color: Colors.white))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text(
                        'Sahan Kumarasiri',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      )
                    ]),
                    Column(children: [
                      Text('kumarasirisahan@gmail.com',
                          style: TextStyle(fontSize: 15.0, color: Colors.white))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Thamali Nirmala',
                          style: TextStyle(fontSize: 15.0, color: Colors.white))
                    ]),
                    Column(children: [
                      Text('tnirmalaadasooriya@gmail.com',
                          style: TextStyle(fontSize: 15.0, color: Colors.white))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Chathura Madhusanka',
                          style: TextStyle(fontSize: 15.0, color: Colors.white))
                    ]),
                    Column(children: [
                      Text('cmadhusanka29@gmail.com',
                          style: TextStyle(fontSize: 15.0, color: Colors.white))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Raveena Bandara',
                          style: TextStyle(fontSize: 15.0, color: Colors.white))
                    ]),
                    Column(children: [
                      Text('raveenabandara801@gmail.com',
                          style: TextStyle(fontSize: 15.0, color: Colors.white))
                    ]),
                  ]),
                ],
              ),
            ),
          ]))),
    );
  }
}
