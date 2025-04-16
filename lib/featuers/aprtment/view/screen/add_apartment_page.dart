import 'package:apartment_tow/core/model/category_or_unit_entiry.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/shared/my_selection_list_with_lable.dart';
import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/aprtment/controller/Apartment_controller.dart';
import 'package:apartment_tow/featuers/aprtment/viewModel/add_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddApartmentPage extends StatefulWidget {
  const AddApartmentPage({super.key});

  @override
  State<AddApartmentPage> createState() => _AddApartmentPageState();
}

class _AddApartmentPageState extends State<AddApartmentPage> {
  AddApartmentViewModel viewModel = AddApartmentViewModel();

  @override
  void initState() {
    viewModel.titleController = TextEditingController();
    viewModel.streetController = TextEditingController();
    viewModel.priceController = TextEditingController();
    viewModel.governorateController = TextEditingController();
    viewModel.longDescriptionController = TextEditingController();
    viewModel.shortDescriptionController = TextEditingController();
    viewModel.apartmentTypeNameController = TextEditingController();
    viewModel.cityController = TextEditingController();
    viewModel.featuresController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: GetBuilder<ApartmentControllerImpl>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                if (viewModel.images.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      child: PageView.builder(
                        itemCount: viewModel.images.length,
                        onPageChanged: (index) {
                          viewModel.images[index];
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                viewModel.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (viewModel.images.isNotEmpty)
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: MyTextFiledWithLabel(
                          hint: "",
                          controller: viewModel.titleController,
                          label: viewModel.tatileLable,
                        ),
                      ),
                      const SizedBox(width: 8),
                      MyGenralButton(
                        name: viewModel.selectImageLable,
                        onPressed: () {
                          viewModel.onSelectImage();
                        },
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                if (viewModel.apartmentType.isNotEmpty)
                  SliverToBoxAdapter(
                    child: MyDropDwounListWithLabl(
                      onChanged: (value) {
                        viewModel.apartmentTypeId = value;
                      },
                      lable: viewModel.apartmentTypeNameHint,
                      selectionList:
                          viewModel.apartmentType
                              .map<CategoryOrUnit>(
                                (e) => CategoryOrUnit(id: e.id, name: e.name),
                              )
                              .toList(),
                    ),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: MyTextFiledWithLabel(
                    hint: "",
                    controller: viewModel.governorateController,
                    label: viewModel.governorateLable,
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: MyTextFiledWithLabel(
                    hint: "",
                    controller: viewModel.cityController,
                    label: viewModel.cityLable,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: MyTextFiledWithLabel(
                    hint: "",
                    controller: viewModel.streetController,
                    label: viewModel.streetLable,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: MyTextFiledWithLabel(
                    isNumber: true,
                    hint: "",
                    controller: viewModel.priceController,
                    label: viewModel.priceLable,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: MyTextFiledWithLabel(
                    maxLins: 2,
                    hint: "",
                    controller: viewModel.shortDescriptionController,
                    label: viewModel.shortDescriptionLable,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: MyTextFiledWithLabel(
                    maxLins: 5,
                    hint: "",
                    controller: viewModel.longDescriptionController,
                    label: viewModel.longDescriptionLable,
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: MyTextFiledWithLabel(
                    maxLins: 5,
                    hint: "",
                    controller: viewModel.featuresController,
                    label: viewModel.featuresLable,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: MyGenralButton(
                    name: viewModel.addButtonLabel,
                    onPressed: viewModel.onAdd,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}
