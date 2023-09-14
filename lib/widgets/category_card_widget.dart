import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCardWidget extends StatefulWidget {
  const CategoryCardWidget({
    super.key,
    required this.serviceName,
    required this.iconPath,
    required this.onTap,
  });

  final RxString serviceName;
  final RxString iconPath;
  final Function() onTap;

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: Container(
        width: _mediaQuery.size.width * 0.3,
        height: _mediaQuery.size.width * 0.3,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.iconPath.value),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                height: _mediaQuery.size.width * 0.04,
                width: isHover ? _mediaQuery.size.width * 0.3 : _mediaQuery.size.width * 0.15,
                decoration: const BoxDecoration(color: Colors.black38),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      widget.serviceName.value,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'SignikaNegative'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
