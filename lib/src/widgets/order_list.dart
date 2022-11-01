// ignore_for_file: use_key_in_widget_constructors

import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/screens/display_all.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No orders yet",
                style: TextStyle(color: CustomColors.firebaseGrey),
              ),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index].data() as dynamic;
              String docID = snapshot.data!.docs[index].id;
              String name = data["name"];
              String unit = data['unit'];
              String nameOfSupplier = data['nameOfSupplier'];
              String contactPerson = data['contactPerson'];
              String phoneNumber = data['phoneNumber'];
              String qty = data['qty'];
              String unitPrice = data['unitPrice'];
              String budget = data['budget'];
              String mBudget = data['mBudget'];
              String status = data['status'];

              print(mBudget);

              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color(0xFF9CF29A),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DisplayAllScreen(
                              docID: docID,
                              name: name,
                              unit: unit,
                              nameOfSupplier: nameOfSupplier,
                              contactPerson: contactPerson,
                              phoneNumber: phoneNumber,
                              qty: qty,
                              unitPrice: unitPrice,
                              budget: budget,
                              mBudget: mBudget,
                              status: status),
                        ),
                      ),
                      title: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                            "Unit : " + unit,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                          Text(
                            "Name of Supplier : " + nameOfSupplier,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                          Text(
                            "Contact Person : " + contactPerson,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                          Text(
                            "Phone : " + phoneNumber,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                          Text(
                            "Qty : " + qty,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                          Text(
                            "Unit Price : " + unitPrice,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                          Text(
                            "Budget : " + budget,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                          Text(
                            mBudget == ""
                                ? "Company Budget(Rs.) : Not provided yet."
                                : 'Company Budget(Rs.) : $mBudget',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                          Text(
                            "Status : " + status,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(""),
                        ],
                      ),
                      trailing: const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ),
                  ));
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              CustomColors.firebaseOrange,
            ),
          ),
        );
      },
    );
  }
}
