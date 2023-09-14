import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailPage extends StatefulWidget {
  final String imageUrl;

  const ImageDetailPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _ImageDetailPageState createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    //stack ile yaptım çünkü çarpı butonu resmin üstüne gelmiyordu
    return Stack(
      children: [
        //image asset ile orjinal resmi ekledim
        Image.asset(
          widget.imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        ///resmin arkasına blur özelliği verdim ve birazcık kararttım
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                //hero ile efekt verdim
                child: MouseRegion(
                  cursor: SystemMouseCursors.zoomIn, // Yakınlaşma işareti bu
                  //photo view resmin büyütülmesi ve etkileşimlerin sağlanması yapıldı
                  child: PhotoView(
                    imageProvider: AssetImage(widget.imageUrl),
                    backgroundDecoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    onTapUp: (context, details, controllerValue) {
                      // Yakınlaştırma veya diğer işlemler
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        //Çarpı butonu
        Positioned(
          top: 10,
          right: 10,
          child: Material(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
            elevation: 10,
            shadowColor: Colors.amber,
            child: IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
