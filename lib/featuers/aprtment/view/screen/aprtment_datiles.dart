import 'dart:async';

import 'package:apartment_tow/core/constant/images.dart';
import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:apartment_tow/core/shared/MyPriceForamt_widget.dart';
import 'package:apartment_tow/core/shared/buttons.dart';
import 'package:apartment_tow/core/theme/app_theme.dart';
import 'package:apartment_tow/core/theme/text_styles.dart';
import 'package:apartment_tow/featuers/aprtment/model/aprtment_Model.dart';
import 'package:apartment_tow/featuers/aprtment/view/widget/apartment_image_wiget.dart';
import 'package:apartment_tow/featuers/aprtment/viewModel/apartment_ditales.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AprtmentDatiles extends StatefulWidget {
  final Apartment apartment;
  final bool isUpdate;
  const AprtmentDatiles({
    required this.apartment,
    required this.isUpdate,
    super.key,
  });

  @override
  State<AprtmentDatiles> createState() => _AprtmentDatilesState();
}

class _AprtmentDatilesState extends State<AprtmentDatiles> {
  ApartmentDitalesViewMode viewMode = ApartmentDitalesViewMode();
  PageController controller = PageController(initialPage: 0);
  Timer? _timer;
  changePage() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (controller.page!.toInt() < widget.apartment.images.length - 1) {
        await controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        await controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewMode.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 1.3,
                child: ApartmentImageView(
                  controller: controller,
                  images: widget.apartment.images,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),

            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: controller, // PageController
                  count: widget.apartment.images.length,
                  effect: WormEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: Get.theme.colorScheme.primary,
                  ), // your preferred effect
                  onDotClicked: (index) {
                    controller.animateToPage(
                      index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                trailing: Text(
                  "${amountFromate(widget.apartment.price)} ر.ي",
                  style: AppTextStyles.price,
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppIcons.address,
                      height: getTextSize(fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${widget.apartment.governorate}/${widget.apartment.city}/${widget.apartment.street}",
                        style: AppTextStyles.description,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  widget.apartment.apartmentTitle,
                  style: AppTextStyles.normaBoldlTitle(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                widget.apartment.shortDescription,
                style: AppTextStyles.description,
              ),
            ),
            SliverToBoxAdapter(child: Divider(thickness: 0.5)),
            SliverToBoxAdapter(
              child: Text(
                widget.apartment.features,
                style: AppTextStyles.description,
              ),
            ),
            SliverToBoxAdapter(child: Divider(thickness: 0.5)),
            SliverToBoxAdapter(
              child: Text(
                widget.apartment.longDescription,
                style: AppTextStyles.description,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyGenralButton(
                color: widget.isUpdate ? redColor : null,
                name:
                    widget.isUpdate
                        ? viewMode.deleteLable
                        : viewMode.sendRequst,
                onPressed: () {
                  if (widget.isUpdate) {
                    viewMode.onDelete(widget.apartment.apartmentId);
                  } else {
                    viewMode.onSendRequst(widget.apartment.apartmentId);
                  }
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
