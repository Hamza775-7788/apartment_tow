import 'package:apartment_tow/core/model/category_or_unit_entiry.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/shared/my_selection_list_with_lable.dart';
import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/viewModel/add_order_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderPage extends StatefulWidget {
  final int apartmentID;
  const AddOrderPage({required this.apartmentID, super.key});

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  late AddOrderViewModel viewModel;
  @override
  void initState() {
    viewModel = AddOrderViewModel(aprtmentID: widget.apartmentID);
    viewModel.nameController = TextEditingController();
    viewModel.phoneController = TextEditingController();
    viewModel.childrenController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: GetBuilder<ApartmentControllerImpl>(
        builder: (_) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(height: 16),
              MyTextFiledWithLabel(
                hint: "",
                controller: viewModel.nameController,
                label: viewModel.nameLable,
              ),
              SizedBox(height: 16),
              MyTextFiledWithLabel(
                isNumber: true,
                hint: "",
                controller: viewModel.phoneController,
                label: viewModel.phoneLable,
              ),
              SizedBox(height: 16),
              MyTextFiledWithLabel(
                isNumber: true,
                hint: "",
                controller: viewModel.childrenController,
                label: viewModel.childrenLable,
              ),
              SizedBox(height: 16),
              MyDropDwounListWithLabl(
                lable: viewModel.jopLable,
                selectionList:
                    viewModel.jops
                        .map<CategoryOrUnit>(
                          (e) => CategoryOrUnit(id: e.id, name: e.name),
                        )
                        .toList(),
                onChanged: (id) {
                  viewModel.onChanageOne(id);
                },
              ),
              SizedBox(height: 16),
              MyDropDwounListWithLabl(
                lable: viewModel.guaranteesLable,
                selectionList:
                    viewModel.guarantees
                        .map<CategoryOrUnit>(
                          (e) => CategoryOrUnit(id: e.id, name: e.name),
                        )
                        .toList(),
                onChanged: (id) {
                  viewModel.onChangeTow(id);
                },
              ),
              SizedBox(height: 16),
              MyGenralButton(
                name: viewModel.addLable,
                onPressed: () {
                  viewModel.onAdd();
                },
              ),
              SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
