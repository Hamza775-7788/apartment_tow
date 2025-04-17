import 'package:apartment_tow/featuers/aprtment/view/screen/apartment_page.dart';
import 'package:apartment_tow/featuers/home/views/abut_viewPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_tow/core/constant/images.dart';
import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:apartment_tow/featuers/profile/presntaion/controller/settingController.dart';
import 'package:apartment_tow/featuers/profile/presntaion/pages/local_view_model.dart';
import 'package:apartment_tow/featuers/profile/presntaion/pages/update_profile.dart';
import 'package:apartment_tow/featuers/profile/presntaion/viewModel/setting_viewModel.dart';

import 'package:apartment_tow/main.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  SettingViewModel viewModel = SettingViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SettingControllerImpl>(
        init: getIt!<SettingControllerImpl>(),
        builder: (controller) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Get.theme.colorScheme.secondary,
                      ),
                      child: ListView(
                        padding: EdgeInsets.only(
                          top: getTextSize(fontSize: 55),
                        ),
                        children: [
                          const SizedBox(height: 16),
                          ListTile(
                            onTap: () {
                              Get.to(() => const UpdateProfileView());
                            },
                            leading: Image.asset(
                              AppIcons.profileIcon,
                              color: Get.theme.colorScheme.primary,
                              height: 25,
                            ),
                            title: Text(viewModel.profile),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                          ),
                          const Divider(
                            thickness: 0.2,
                            endIndent: 15,
                            indent: 15,
                          ),
                          if (controller.userInfo?.type == 1)
                            ListTile(
                              onTap: () {
                                Get.to(() => const ApartmentPage());
                              },
                              leading: Image.asset(
                                AppIcons.logo,
                                color: Get.theme.colorScheme.primary,
                                width: 30,
                              ),
                              title: Text(viewModel.apartmentLable),
                              subtitle: Text(viewModel.apartmentSupTitle),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                            ),
                          if (controller.userInfo?.type == 1)
                            const Divider(
                              thickness: 0.2,
                              endIndent: 15,
                              indent: 15,
                            ),
                          ListTile(
                            onTap: () {
                              Get.bottomSheet(LocalizationViewPage());
                            },
                            leading: Image.asset(
                              AppIcons.laungugeIcon,
                              color: Get.theme.colorScheme.primary,
                              height: 25,
                            ),
                            title: Text(viewModel.language),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                          ),
                          const Divider(
                            thickness: 0.2,
                            endIndent: 15,
                            indent: 15,
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Image.asset(
                              AppIcons.privesy,
                              color: Get.theme.colorScheme.primary,
                              height: 25,
                            ),
                            title: Text(viewModel.privesy),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                          ),
                          const Divider(
                            thickness: 0.2,
                            endIndent: 15,
                            indent: 15,
                          ),
                          ListTile(
                            onTap: () {
                              Get.to(() => const AbutViewpage());
                            },
                            leading: Image.asset(
                              AppIcons.about,
                              color: Get.theme.colorScheme.primary,
                              height: 25,
                            ),
                            title: Text(viewModel.about),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                          ),
                          const Divider(
                            thickness: 0.2,
                            endIndent: 15,
                            indent: 15,
                          ),
                          ListTile(
                            onTap: () {
                              controller.signOut();
                            },
                            leading: Image.asset(
                              AppIcons.exitIcon,
                              color: Get.theme.colorScheme.primary,
                              height: 25,
                            ),
                            title: Text(viewModel.logout),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            right: 0,
                            left: 0,
                            bottom: -getTextSize(fontSize: 55),
                            child: ProfileImage(
                              url: controller.userInfo?.profile,
                              name: controller.userInfo?.name,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(flex: 6, child: Container()),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  final Function()? onTap;
  final String? name;
  final String? url;
  const ProfileImage({this.url, this.name, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: getTextSize(fontSize: 90),
              width: getTextSize(fontSize: 90),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Get.theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child:
                  url != null
                      ? Image.network(url!, fit: BoxFit.cover)
                      : Image.asset(AppImages.person, fit: BoxFit.cover),
            ),
          ],
        ),
        const SizedBox(height: 12),
        name != null
            ? Text(
              name!,
              style: TextStyle(
                fontSize: getTextSize(fontSize: 25),
                fontWeight: FontWeight.bold,
              ),
            )
            : Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 3),
              child: const LinearProgressIndicator(minHeight: 1),
            ),
      ],
    );
  }
}
