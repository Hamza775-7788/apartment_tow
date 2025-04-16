import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/view/screen/aprtment_datiles.dart';
import 'package:apartment_tow/featuers/aprtment/view/widget/item_list_tile_widget.dart';
import 'package:apartment_tow/featuers/home/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: GetBuilder<ApartmentControllerImpl>(
        builder: (_) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.typsList.length,
                    itemBuilder: (context, index) {
                      final elment = viewModel.typsList[index];
                      return MyFilterButton(
                        onTap: () {
                          setState(() {
                            viewModel.onChange(elment.id);
                          });
                        },
                        selectID: viewModel.type,
                        category: elment,
                      );
                    },
                  ),
                ),
              ),

              SliverList.builder(
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
            ],
          );
        },
      ),
    );
  }
}
