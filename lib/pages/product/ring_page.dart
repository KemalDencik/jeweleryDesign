import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_scala/widgets/CardWidget.dart';

class RingPage extends StatefulWidget {
  const RingPage({Key? key}) : super(key: key);

  @override
  State<RingPage> createState() => _RingPageState();
}

class _RingPageState extends State<RingPage> {
  bool isHover = false;

  int currentPageIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Burada tüm kartları tek bir listeye ekleyeceğiz
    List<CardWidget> allCards = [
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Halka Pırlantalı Nişan Yüzüğü '.obs, text2: 'Y345KC'.obs, image: 'assets/images/ring_img.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Halka Pırlantalı Nişan Yüzüğü '.obs, text2: 'Y345KC'.obs, image: 'assets/images/ring_img.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'asdasd'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
      CardWidget(text: 'Tek Taş Baget Pırlanta Yüzük '.obs, text2: 'K380YU'.obs, image: 'assets/images/Ring.jpg'.obs),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: (allCards.length / 12).ceil(), // Toplam Container sayısını belirlemek için
              //allCards.length listenin toplam eleman sayısını temsil eder.
              controller: _pageController,
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 12;
                //start başlangıç index end index sondaki indexi temsil eder
                final endIndex = (startIndex + 12 < allCards.length) ? startIndex + 12 : allCards.length;
                //3 container dan sonra satır iniyor ve 12 den sonra sayfa geçişi sağlıyor
                return GridView.count(
                  crossAxisCount: 3, //her satırda 3 index
                  children: allCards.sublist(startIndex, endIndex),
                );
              },
              onPageChanged: (index) {
                //sayfa değiştirme
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
          ),
          //kaçıncı sayfada olduğumuzu görmemiz için
          Text(
            'Sayfa ${currentPageIndex + 1}',
            style: const TextStyle(
              color: Color.fromARGB(255, 74, 74, 74),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (currentPageIndex > 0) {
                    _pageController?.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(11, 3, 3, 5),
                      child: Icon(Icons.arrow_back_ios),
                    )),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  if (currentPageIndex < ((allCards.length / 12).ceil()) - 1) {
                    _pageController?.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_forward_ios)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
