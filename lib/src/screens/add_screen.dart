import 'package:Kamataha/src/res/custom_colors.dart';
import 'package:Kamataha/src/widgets/add_item_form.dart';
import 'package:Kamataha/src/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _unitFocusNode = FocusNode();
  final FocusNode _nameOfSupplierFocusNode = FocusNode();
  final FocusNode _contactPersonFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _qtyFocusNode = FocusNode();
  final FocusNode _unitPriceFocusNode = FocusNode();
  final FocusNode _budgetFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _nameOfSupplierFocusNode.unfocus();
        _contactPersonFocusNode.unfocus();
        _phoneFocusNode.unfocus();
        _qtyFocusNode.unfocus();
        _unitPriceFocusNode.unfocus();
        _budgetFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: AppBarTitle(),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: AddItemForm(
                  nameFocusNode: _nameFocusNode,
                  unitFocusNode: _unitFocusNode,
                  nameOfSupplierFocusNode: _nameOfSupplierFocusNode,
                  contactPersonFocusNode: _contactPersonFocusNode,
                  phoneFocusNode: _phoneFocusNode,
                  qtyFocusNode: _qtyFocusNode,
                  unitPriceFocusNode: _unitPriceFocusNode,
                  budgetFocusNode: _budgetFocusNode),
            ),
          ]),
        ),
      ),
    );
  }
}
