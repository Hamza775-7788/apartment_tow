import 'package:apartment_tow/core/constant/images.dart';
import 'package:apartment_tow/featuers/main_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewPage extends StatefulWidget {
  const MainViewPage({super.key});

  @override
  State<MainViewPage> createState() => _MainViewPageState();
}

class _MainViewPageState extends State<MainViewPage> {
  int selectedPage = 0;
  double he = 25;
  MainViewModel viewModel = MainViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: viewModel.pages[viewModel.selectedPage],
      bottomNavigationBar: NavigationBar(
        height: 55,
        elevation: 0,
        onDestinationSelected: (vale) {
          setState(() {
            viewModel.selectedPage = vale;
          });
        },
        selectedIndex: viewModel.selectedPage,
        backgroundColor: Get.theme.colorScheme.secondary,
        indicatorColor: Get.theme.colorScheme.surface,
        destinations: [
          NavigationDestination(
            selectedIcon: Image.asset(
              AppIcons.home02,
              height: he,
              color: Get.theme.colorScheme.primary,
            ),
            icon: Image.asset(
              AppIcons.home01,
              height: he,
              color: Get.theme.colorScheme.primary,
            ),
            label: viewModel.homeLabel,
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.search_sharp,
              size: he,
              color: Get.theme.colorScheme.primary,
            ),
            icon: Icon(
              Icons.search_outlined,
              size: he,
              color: Get.theme.colorScheme.primary,
            ),
            label: viewModel.categorylabel,
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.info_sharp,
              size: he,
              color: Get.theme.colorScheme.primary,
            ),
            icon: Icon(
              Icons.info_outline_rounded,
              size: he,
              color: Get.theme.colorScheme.primary,
            ),
            label: viewModel.offersLabel,
          ),

          NavigationDestination(
            selectedIcon: Icon(
              Icons.settings,
              size: he,
              color: Get.theme.colorScheme.primary,
            ),
            icon: Icon(
              Icons.settings_outlined,
              size: he,
              color: Get.theme.colorScheme.primary,
            ),
            label: viewModel.more,
          ),
        ],
      ),
    );
  }
}
