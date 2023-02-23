import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:untitle/Page/main_wrapper_controller.dart';
import 'package:untitle/utils/constant.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'Page/compte/compte.dart';
import 'Page/documents/document.dart';
import 'Page/home/acceuil.dart';
import 'Page/rendez_vous/rendezvous.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final MainWrapperController controller = Get.put(MainWrapperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: BouncingScrollPhysics(),
        children: [
          AcceuilScreen(),
          RendezvousScreen(),
          DocumentScreen(),
          CompteScreen()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        elevation: 19,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bottomAppBarItem(
                context,
                icon: IconlyLight.home,
                page: 0,
                label: "Home",
              ),
              _bottomAppBarItem(
                context,
                icon: IconlyLight.calendar,
                page: 1,
                label: "Rendez-vous",
              ),
              _bottomAppBarItem(
                context,
                icon: IconlyLight.folder,
                page: 2,
                label: "Documents",
              ),
              _bottomAppBarItem(
                context,
                icon: IconlyLight.profile,
                page: 3,
                label: "Profil",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => controller.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: controller.currentPage.value == page
                  ? kPrimaryColor
                  : Colors.grey,
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
