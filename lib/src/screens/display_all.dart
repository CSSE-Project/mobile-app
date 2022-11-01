import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/utils/validator.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:Kamataha/src/widgets/custom_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DisplayAllScreen extends StatefulWidget {
  final String docID;
  final String name;
  final String unit;
  final String nameOfSupplier;
  final String contactPerson;
  final String phoneNumber;
  final String qty;
  final String unitPrice;
  final String budget;
  final String mBudget;
  final String status;

  const DisplayAllScreen(
      {Key? key,
      required this.docID,
      required this.name,
      required this.unit,
      required this.nameOfSupplier,
      required this.contactPerson,
      required this.phoneNumber,
      required this.qty,
      required this.unitPrice,
      required this.budget,
      required this.mBudget,
      required this.status})
      : super(key: key);

  @override
  _DisplayAllScreenState createState() => _DisplayAllScreenState();
}

class _DisplayAllScreenState extends State<DisplayAllScreen> {
  var isPressed = false;
  bool _isProcessing = false;
  final _addItemFormKey = GlobalKey<FormState>();

  final TextEditingController _managerBudgetTextEditingController =
      TextEditingController();

  final FocusNode fNode = FocusNode();
  bool _isDeleting = false;
  @override
  void initState() {
    super.initState();
  }

  void showToast(isPressed) {
    if (isPressed) {
      Fluttertoast.showToast(
          msg: 'You Liked This',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    } else {
      Fluttertoast.showToast(
          msg: 'Like Removed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }
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
        actions: [
          _isDeleting
              ? const Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    right: 16.0,
                  ),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.redAccent,
                    ),
                    strokeWidth: 3,
                  ),
                )
              : IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                    size: 32,
                  ),
                  onPressed: () async {
                    setState(() {
                      _isDeleting = true;
                    });

                    await Database.deleteItem(
                      docId: widget.docID,
                    );

                    setState(() {
                      _isDeleting = false;
                    });

                    Fluttertoast.showToast(
                        msg: 'You Deleted Order',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.yellow);

                    Navigator.of(context).pop();
                  },
                ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Name 👉 " + widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Unit : " + widget.unit,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Name of Supplier : " + widget.nameOfSupplier,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Contact Person : " + widget.contactPerson,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Qty : " + widget.qty,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Unit Price(Rs.) : " + widget.unitPrice,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Budget(Rs.) : " + widget.budget,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Company Budget(Rs.) : ' + widget.mBudget,
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Column(
                  children: [
                    if (widget.status == "PENDING" && widget.mBudget == "")
                      CustomFormField(
                        isLabelEnabled: false,
                        controller: _managerBudgetTextEditingController,
                        focusNode: fNode,
                        keyboardType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        validator: (value) => Validator.validateField(
                          value: value,
                        ),
                        label: 'Company Budget',
                        hint: 'Enter your company budget',
                        readOnly: widget.mBudget == "",
                        initialValue: widget.mBudget,
                      ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Form(
                    key: _addItemFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.status == "PENDING" && widget.mBudget == "")
                          _isProcessing
                              ? Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      CustomColors.firebaseOrange,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        CustomColors.firebaseOrange,
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(45),
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      fNode.unfocus();

                                      if (_addItemFormKey.currentState!
                                          .validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });

                                        await Database.updateItem(
                                            mBudget:
                                                _managerBudgetTextEditingController
                                                    .text,
                                            docId: widget.docID);

                                        setState(() {
                                          _isProcessing = false;
                                        });

                                        Fluttertoast.showToast(
                                            msg:
                                                'You Submitted The Company Budget For Order',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.yellow);

                                        Navigator.of(context).pop();
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, bottom: 16.0),
                                      child: Text(
                                        'SUBMIT',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.firebaseGrey,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        const SizedBox(height: 24.0),
                        Column(
                          children: [
                            if (widget.status == "PENDING" &&
                                widget.mBudget != "")
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.green,
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(45),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        fNode.unfocus();

                                        if (_addItemFormKey.currentState!
                                            .validate()) {
                                          setState(() {
                                            _isProcessing = true;
                                          });

                                          await Database.updateStatus(
                                              status: "ACCEPTED",
                                              docId: widget.docID);

                                          setState(() {
                                            _isProcessing = false;
                                          });
                                          Fluttertoast.showToast(
                                              msg: 'You Accepted Order',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.yellow);
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16.0, bottom: 16.0),
                                        child: Text(
                                          'ACCEPT',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColors.firebaseGrey,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.red,
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(45),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        fNode.unfocus();

                                        if (_addItemFormKey.currentState!
                                            .validate()) {
                                          setState(() {
                                            _isProcessing = true;
                                          });

                                          await Database.updateStatus(
                                              status: "REJECTED",
                                              docId: widget.docID);

                                          setState(() {
                                            _isProcessing = false;
                                          });

                                          Fluttertoast.showToast(
                                              msg: 'You Rejected Order',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.yellow);

                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16.0, bottom: 16.0),
                                        child: Text(
                                          'REJECT',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColors.firebaseGrey,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
