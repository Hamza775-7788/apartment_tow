import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/constant/images.dart';
import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/shared/my_text_filed.dart';
import 'package:apartment_tow/featuers/profile/presntaion/controller/profileController.dart';
import 'package:apartment_tow/featuers/profile/presntaion/viewModel/update_profileViewModel.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  UpdateProfileViewModel viewModel = UpdateProfileViewModel();
  @override
  void initState() {
    viewModel.nameController = TextEditingController();
    viewModel.emailController = TextEditingController();
    viewModel.phoneController = TextEditingController();
    viewModel.phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.nameController.dispose();
    viewModel.emailController.dispose();
    viewModel.phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.title),
      ),
      body: GetBuilder<PrfileControllerImpl>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                ProfileImageWidget(
                  viewModel: viewModel,
                  onOk: () {},
                  onCencal: () async {
                    await viewModel.onCancel();
                    setState(() {});
                  },
                  onUpdateImage: () {
                    viewModel.onSelectImage();
                  },
                ),
                MyTextFiledWithLabel(
                    hint: '',
                    controller: viewModel.nameController,
                    label: viewModel.nameLable),
                const SizedBox(
                  height: 16,
                ),
                MyTextFiledWithLabel(
                    isEnebal: false,
                    hint: '',
                    controller: viewModel.emailController,
                    label: viewModel.emailLable),
                const SizedBox(
                  height: 16,
                ),
                MyTextFiledWithLabel(
                    hint: '',
                    controller: viewModel.phoneController,
                    label: viewModel.phoneLable),
                const SizedBox(
                  height: 16,
                ),
                MyGenralButton(
                  name: viewModel.buttonUpdateLable,
                  onPressed: () {
                    viewModel.onSave();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileImageWidget extends StatelessWidget {
  final Function() onUpdateImage;
  final Function() onCencal;
  final Function() onOk;
  const ProfileImageWidget({
    super.key,
    required this.onUpdateImage,
    required this.onCencal,
    required this.onOk,
    required this.viewModel,
  });

  final UpdateProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            height: getTextSize(fontSize: 137),
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 1,
              child: viewModel.imagePicker != null
                  ? Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Get.theme.colorScheme.primary),
                      ),
                      child: Image.file(
                        viewModel.imagePicker!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : viewModel.image != null
                      ? Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Get.theme.colorScheme.primary),
                          ),
                          child: Image.network(
                            viewModel.image!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            viewModel.onSelectImage();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Get.theme.colorScheme.primary),
                            ),
                            child: Image.asset(
                              AppIcons.selectImage,
                              height: getTextSize(fontSize: 50),
                            ),
                          ),
                        ),
            ),
          ),
          if (viewModel.image != null || viewModel.imagePicker != null)
            Positioned(
                top: 0,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: onUpdateImage,
                        icon: Image.asset(
                          AppIcons.updateIcon,
                          height: getTextSize(fontSize: 30),
                        )),
                    Visibility(
                      visible: viewModel.imagePicker != null,
                      child: IconButton(
                          onPressed: onCencal,
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.red,
                          )),
                    ),
                  ],
                )),
        ],
      ),
    );
  }
}
