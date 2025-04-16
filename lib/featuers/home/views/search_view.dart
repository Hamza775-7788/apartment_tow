import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/view/screen/aprtment_datiles.dart';
import 'package:apartment_tow/featuers/aprtment/view/widget/item_list_tile_widget.dart';
import 'package:apartment_tow/featuers/home/viewModel/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel viewModel = SearchViewModel();

  @override
  void initState() {
    viewModel.controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ApartmentControllerImpl>(
        builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextFiledWithLabel(
                  onChanged: (value) {
                    viewModel.onChange(value);
                  },
                  hint: viewModel.search,
                  controller: viewModel.controller,
                  label: "",
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.apartment.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ItemListTileWidget(
                        onTap: () {
                          Get.to(
                            () => AprtmentDatiles(
                              apartment: viewModel.apartment[index],
                              isUpdate: false,
                            ),
                          );
                        },
                        item: viewModel.apartment[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
