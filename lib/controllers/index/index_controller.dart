import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_scala/pages/about_us_page.dart';
import 'package:product_scala/pages/product/necklace_page.dart';
import 'package:product_scala/pages/product/ring_page.dart';
import 'package:product_scala/pages/product/watch_page.dart';
import 'package:product_scala/pages/product/wristband_page.dart';
import 'package:product_scala/pages/product_edit/product_add_page.dart';

class IndexController extends GetxController {
  RxInt index = 0.obs;
  RxInt selectedMenuIndex = 0.obs;

  List<Widget> menu = const [
    AboutUsPage(),
    RingPage(),
    NecklacePage(),
    WristbandPage(),
    WatchPage(),
    ProductAddPage(),
  ];

  Widget getPages() {
    return menu[selectedMenuIndex.value];
  }
}
