import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_scala/controllers/index/index_controller.dart';
import 'package:product_scala/pages/ImageDetailPage.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    Key? key,
    required this.text,
    required this.text2,
    required this.image,
  }) : super(key: key);
  final RxString text;
  final RxString text2;
  final RxString image;
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  IndexController? indexController;
  bool isHover = false;

  @override
  void initState() {
    indexController = Get.find(tag: "index");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            // Get.to(ImageDetailPage(imageUrl: widget.image.value.obs));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ImageDetailPage(imageUrl: widget.image.value),
              ),
            );
          },
          onHover: (value) {
            setState(() {
              isHover = value;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: isHover ? Colors.black : const Color.fromARGB(255, 215, 215, 215), width: 1),
              color: const Color.fromARGB(255, 215, 215, 215),
            ),
            width: 320,
            height: 510,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  height: 390,
                  width: 430,
                  child: ClipRRect(
                    child: Image.asset(
                      widget.image.value,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3, left: 5),
                  child: Text(
                    widget.text.value,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.text2.value,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
