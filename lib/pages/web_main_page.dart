import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_scala/controllers/index/index_controller.dart';
import 'package:product_scala/widgets/menu_button_widget.dart';

class WebMainPage extends StatefulWidget {
  const WebMainPage({super.key});

  @override
  State<WebMainPage> createState() => _WebMainPageState();
}

class _WebMainPageState extends State<WebMainPage> {
  IndexController? indexController;
  @override
  void initState() {
    super.initState();
    indexController = Get.put(IndexController(), tag: "index");
  }

  @override
  Widget build(BuildContext context) {
    List menuItems = [
      //Hakkımızda Menu Button
      MenuButtonWidget(
        buttonwidth: 70.0.obs,
        itemIndex: 0.obs,
        menuName: "Hakkımızda".obs,
        ontap: () {
          indexController!.index.value = 0;
          indexController!.selectedMenuIndex.value = 0;
        },
      ),
      //Yüzük Menu Button
      MenuButtonWidget(
        buttonwidth: 70.0.obs,
        itemIndex: 1.obs,
        menuName: "Yüzük".obs,
        ontap: () {
          indexController!.index.value = 1;
          indexController!.selectedMenuIndex.value = 1;
        },
      ),
      //Kolye Menu Button
      MenuButtonWidget(
        buttonwidth: 70.0.obs,
        itemIndex: 2.obs,
        menuName: "Kolye".obs,
        ontap: () {
          indexController!.index.value = 2;
          indexController!.selectedMenuIndex.value = 2;
        },
      ),
      //Bileklik Menu Button
      MenuButtonWidget(
        buttonwidth: 70.0.obs,
        itemIndex: 3.obs,
        menuName: "Bileklik".obs,
        ontap: () {
          indexController!.index.value = 3;
          indexController!.selectedMenuIndex.value = 3;
        },
      ),
      //Saat Menu Button
      MenuButtonWidget(
        buttonwidth: 70.0.obs,
        itemIndex: 4.obs,
        menuName: "Saat".obs,
        ontap: () {
          indexController!.index.value = 4;
          indexController!.selectedMenuIndex.value = 4;
        },
      ),
      //Ürün Ekle Menu Button
      MenuButtonWidget(
        buttonwidth: 70.0.obs,
        itemIndex: 5.obs,
        menuName: "Ürün Ekle".obs,
        ontap: () {
          indexController!.index.value = 5;
          indexController!.selectedMenuIndex.value = 5;
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 197, 197, 197),
        toolbarHeight: 90,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.diamond,
                  color: Colors.black,
                  size: 34,
                ),
                Text(
                  "Silös Mücevherat",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'GreatVibes',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemBuilder: (context, index) => menuItems[index],
                    itemCount: menuItems.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Pages
                Obx(
                  () => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: indexController!.getPages(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
