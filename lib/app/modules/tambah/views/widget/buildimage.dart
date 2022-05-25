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
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
