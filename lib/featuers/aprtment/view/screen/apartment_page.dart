import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/view/screen/aprtment_datiles.dart';
import 'package:apartment_tow/featuers/aprtment/view/widget/item_list_tile_widget.dart';
import 'package:apartment_tow/featuers/aprtment/viewModel/viewApartment_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApartmentPage extends StatefulWidget {
  const ApartmentPage({super.key});

  @override
  State<ApartmentPage> createState() => _ApartmentPageState();
}

class _ApartmentPageState extends State<ApartmentPage> {
  ApartmentApdminViewModel viewModel = ApartmentApdminViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: GetBuilder<ApartmentControllerImpl>(
        builder: (_) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: viewModel.apartmentList.length,
            itemBuilder: (context, index) {
              final item = viewModel.apartmentList[index];
              return ItemListTileWidget(
                item: item,
                onTap: () {
                  Get.to(
                    () => AprtmentDatiles(isUpdate: true, apartment: item),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}
