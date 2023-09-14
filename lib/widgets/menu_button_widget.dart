import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_scala/controllers/index/index_controller.dart';

class MenuButtonWidget extends StatefulWidget {
  const MenuButtonWidget({
    Key? key,
    required this.menuName,
    this.ontap,
    required this.buttonwidth,
    required this.itemIndex,
  }) : super(key: key);
  final RxString menuName;
  final Function()? ontap;
  final RxDouble buttonwidth;
  final RxInt itemIndex;

  @override
  State<MenuButtonWidget> createState() => _MenuButtonWidgetState();
}

class _MenuButtonWidgetState extends State<MenuButtonWidget> {
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
      () => InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: widget.ontap,
        child: SizedBox(
          height: 50,
          width: 80,
          child: Column(
            children: [
              const Spacer(),
              const Divider(
                color: Colors.black,
              ),
              Text(
                widget.menuName.value,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isHover
                      ? Colors.black
                      : widget.itemIndex == indexController!.index
                          ? Colors.black
                          : const Color.fromARGB(255, 86, 86, 86),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white54,
                      Colors.grey.shade600,
                      Colors.black,
                    ],
                  ),
                ),
                duration: isHover ? const Duration(milliseconds: 150) : const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                width: isHover
                    ? 25
                    : widget.itemIndex == indexController!.index
                        ? widget.buttonwidth.value
                        : 0,
                height: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
