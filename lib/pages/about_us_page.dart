import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_scala/controllers/index/index_controller.dart';
import 'package:product_scala/widgets/contact_us_widget.dart';
import 'package:product_scala/widgets/category_card_widget.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  IndexController? indexController;

  @override
  void initState() {
    indexController = Get.find(tag: "index");
    super.initState();
  }

  List imageUrls = [
    {"image_path": 'assets/images/carousel_1.jpeg'},
    {"image_path": 'assets/images/carousel_2.jpeg'},
    {"image_path": 'assets/images/carousel_3.jpeg'},
    {"image_path": 'assets/images/carousel_4.jpeg'},
    {"image_path": 'assets/images/carousel_5.jpeg'},
    {"image_path": 'assets/images/carousel_6.jpeg'},
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 253, 246),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Carousel Slider
              CarouselSlider(
                items: imageUrls
                    .map(
                      (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.fill,
                        width: 1050,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 500,
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        currentIndex = index;
                      },
                    );
                  },
                ),
              ),

              // Hizmetlerimiz
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                //Descriptions
                child: Column(
                  children: [
                    //Banner
                    Container(
                      height: _mediaQuery.size.width * 0.06,
                      width: _mediaQuery.size.width * 0.66,
                      color: Color.fromARGB(255, 219, 219, 219),
                      //Title
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Kaliteyi 12'den Vurun...",
                          style: TextStyle(
                            color: Color.fromARGB(255, 65, 65, 65),
                            fontSize: 34,
                            fontFamily: 'SignikaNegative',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    //Hizmetler
                    SizedBox(
                      width: _mediaQuery.size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 40, left: 60, right: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Product Animated Containers
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30, bottom: 30),
                              child: Column(
                                children: [
                                  // Category Cards 1
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        //Yüzükler Category Card
                                        CategoryCardWidget(
                                          onTap: () {
                                            indexController!.index.value = 1;
                                            indexController!.selectedMenuIndex.value = 1;
                                          },
                                          serviceName: "Yüzükler".obs,
                                          iconPath: 'assets/images/ring_img.jpg'.obs,
                                        ),

                                        //Kolye Category Card
                                        CategoryCardWidget(
                                          onTap: () {
                                            indexController!.index.value = 2;
                                            indexController!.selectedMenuIndex.value = 2;
                                          },
                                          serviceName: "Kolyeler".obs,
                                          iconPath: 'assets/images/necklace_img.jpg'.obs,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Category Cards 2
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        //Bileklik Category Card
                                        CategoryCardWidget(
                                          onTap: () {
                                            indexController!.index.value = 3;
                                            indexController!.selectedMenuIndex.value = 3;
                                          },
                                          serviceName: "Bileklikler".obs,
                                          iconPath: 'assets/images/bracelet_img.jpg'.obs,
                                        ),

                                        //Saat Category Card
                                        CategoryCardWidget(
                                          onTap: () {
                                            indexController!.index.value = 4;
                                            indexController!.selectedMenuIndex.value = 4;
                                          },
                                          serviceName: "Saatler".obs,
                                          iconPath: 'assets/images/watch_img.jpg'.obs,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Contact Us
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 1536,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Instagram
                            ContactUsWidget(
                              contactName: "silosmucevherat".obs,
                              iconPath: 'assets/images/instagram.png'.obs,
                            ),

                            //WhatsApp
                            ContactUsWidget(
                              contactName: "0 537 429 19 19".obs,
                              iconPath: 'assets/images/whatsapp.png'.obs,
                            ),

                            ContactUsWidget(
                              contactName: "silosmucevherat".obs,
                              iconPath: 'assets/images/facebook.png'.obs,
                            ),

                            //Mail
                            ContactUsWidget(
                              contactName: "sc.ilhann@gmail.com".obs,
                              iconPath: 'assets/images/gmail.png'.obs,
                            ),

                            const Text(
                              "by Cevher İlhan",
                              style: TextStyle(fontSize: 25, fontFamily: 'GreatVibes', color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Mayday Software
                  Container(
                    height: 14,
                    width: 1536,
                    color: const Color.fromARGB(255, 33, 92, 255),
                    child: const Center(
                      child: Text(
                        "Mayday Software Copyright © 2023",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
