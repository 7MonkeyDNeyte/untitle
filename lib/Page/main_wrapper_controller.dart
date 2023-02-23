import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWrapperController extends GetxController {
  late PageController pageController;

  RxInt currentPage = 0.obs;

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // TODO: implement onDelete
  // InternalFinalCallback<void> get onDelete => super.onDelete;
}
