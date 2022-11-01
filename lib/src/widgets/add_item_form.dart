import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/utils/database.dart';
import 'package:Kamataha/src/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'custom_form_field.dart';

// ignore: must_be_immutable
class AddItemForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode unitFocusNode;
  final FocusNode nameOfSupplierFocusNode;
  final FocusNode contactPersonFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode qtyFocusNode;
  final FocusNode unitPriceFocusNode;
  final FocusNode budgetFocusNode;

  const AddItemForm(
      {Key? key,
      required this.nameFocusNode,
      required this.unitFocusNode,
      required this.nameOfSupplierFocusNode,
      required this.contactPersonFocusNode,
      required this.phoneFocusNode,
      required this.qtyFocusNode,
      required this.unitPriceFocusNode,
      required this.budgetFocusNode})
      : super(key: key);

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _nameTextEditingController =
      TextEditingController();

  final TextEditingController _unitTextEditingController =
      TextEditingController();
  final TextEditingController _nameOfSupplierTextEditingController =
      TextEditingController();
  final TextEditingController _contactPersonTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _qtyTextEditingController =
      TextEditingController();
  final TextEditingController _unitPriceTextEditingController =
      TextEditingController();
  final TextEditingController _budgetTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                Text(
                  'Name',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _nameTextEditingController,
                  focusNode: widget.nameFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Name',
                  hint: 'Enter your name',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Unit',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _unitTextEditingController,
                  focusNode: widget.unitFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Unit',
                  hint: 'Enter your unit',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Store Name',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _nameOfSupplierTextEditingController,
                  focusNode: widget.nameOfSupplierFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Store Name',
                  hint: 'Enter your store name',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Contact Person',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _contactPersonTextEditingController,
                  focusNode: widget.contactPersonFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Contact Person',
                  hint: 'Enter your contact person',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Phone',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                    isLabelEnabled: false,
                    controller: _phoneTextEditingController,
                    focusNode: widget.phoneFocusNode,
                    keyboardType: TextInputType.number,
                    inputAction: TextInputAction.next,
                    validator: (value) => Validator.validateField(
                          value: value,
                        ),
                    label: 'Phone',
                    hint: 'Enter your phone',
                    type: "phone"),
                const SizedBox(height: 24.0),
                Text(
                  'Qty',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _qtyTextEditingController,
                  focusNode: widget.qtyFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Qty',
                  hint: 'Enter your qty',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Unit Price',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _unitPriceTextEditingController,
                  focusNode: widget.unitPriceFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Unit Price',
                  hint: 'Enter your unit price',
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Budget',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _budgetTextEditingController,
                  focusNode: widget.budgetFocusNode,
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Budget',
                  hint: 'Enter your budget',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  ),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      CustomColors.firebaseOrange,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    widget.nameFocusNode.unfocus();
                    widget.nameOfSupplierFocusNode.unfocus();
                    widget.contactPersonFocusNode.unfocus();
                    widget.phoneFocusNode.unfocus();
                    widget.qtyFocusNode.unfocus();
                    widget.unitPriceFocusNode.unfocus();
                    widget.budgetFocusNode.unfocus();

                    if (_addItemFormKey.currentState!.validate()) {
                      setState(() {
                        _isProcessing = true;
                      });

                      await Database.addItem(
                          name: _nameTextEditingController.text,
                          unit: _unitTextEditingController.text,
                          nameOfSupplier:
                              _nameOfSupplierTextEditingController.text,
                          contactPerson:
                              _contactPersonTextEditingController.text,
                          phoneNumber: _phoneTextEditingController.text,
                          qty: _qtyTextEditingController.text,
                          unitPrice: _unitPriceTextEditingController.text,
                          budget: _budgetTextEditingController.text,
                          mBudget: "",
                          status: "PENDING");

                      setState(() {
                        _isProcessing = false;
                      });
                      Fluttertoast.showToast(
                          msg: 'You Added Order',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.yellow);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
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
        ],
      ),
    );
  }
}
