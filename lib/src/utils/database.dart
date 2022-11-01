import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final String time = DateTime.now().toString().substring(0, 20);

class Database {
  static Future<void> addItem(
      {required String name,
      required String unit,
      required String nameOfSupplier,
      required String contactPerson,
      required String phoneNumber,
      required String qty,
      required String unitPrice,
      required String budget,
      mBudget,
      status}) async {
    DocumentReference documentReferencer = _firestore.collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "unit": unit,
      "nameOfSupplier": nameOfSupplier,
      "contactPerson": contactPerson,
      "phoneNumber": phoneNumber,
      "qty": qty,
      "unitPrice": unitPrice,
      "budget": budget,
      "mBudget": mBudget,
      "status": status
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String mBudget,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "mBudget": mBudget,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note mBudget recorded in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateStatus({
    required String status,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "status": status,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("DONE"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readOrders() {
    Query<Map<String, dynamic>> orders = _firestore
        .collection('items')
        .where("status", isNotEqualTo: "ACCEPTED");
    print('fetched');

    return orders.snapshots();
  }

  static Stream<QuerySnapshot> readDeliveries() {
    Query<Map<String, dynamic>> deliveries =
        _firestore.collection('items').where("status", isEqualTo: "ACCEPTED");

    print('fetched');

    return deliveries.snapshots();
  }

  static Stream<QuerySnapshot> readAllSuppliers() {
    Query<Map<String, dynamic>> suppliers = _firestore.collection('items');
    print('fetched');

    return suppliers.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _firestore.collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note order deleted from the database'))
        .catchError((e) => print(e));
  }
}
