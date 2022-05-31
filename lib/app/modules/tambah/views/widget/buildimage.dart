import 'package:flutter/material.dart';

class buildimage extends StatelessWidget {
  const buildimage({
    Key? key,
    required this.urlImage,
    required this.index,
  }) : super(key: key);

  final String urlImage;
  final int index;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.asset(
          'assets/images/noimage.png',
          fit: BoxFit.cover,
        ),
      );
}

class buildimageE extends StatelessWidget {
  const buildimageE({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  final String urlImage;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Color.fromARGB(255, 255, 255, 255),
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}

// CarouselSlider.builder(
//                               options: CarouselOptions(
//                                 height: 200,
//                                 enlargeCenterPage: false,
//                                 enableInfiniteScroll: false,
//                                 // initialPage: 2,
//                               ),
//                               itemCount: 1,
//                               itemBuilder: (context, index, realIndex) {
//                                 if (controller.listImg.value.isEmpty) {
//                                   controller.tambahImg(noimage);
//                                 } else {
//                                   controller
//                                       .tambahImg(controller.imageUrlStr.value);
//                                   print(controller.listImg.value);
//                                   // final imageUrl =
//                                   //     controller.listImg.value.toString();

//                                 }
//                                 return buildimage(
//                                     urlImage:
//                                         controller.listImg.value.toString(),
//                                     index: index);
//                               },
//                             ),