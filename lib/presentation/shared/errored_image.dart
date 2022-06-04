import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class MatchIcon extends StatelessWidget {
  final String imageUrl;
  const MatchIcon(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl,
        errorBuilder: (_, __, ___) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.sports_baseball,
                color: ColorManger.kCardBackground,
                size: 35,
              ),
            ));
  }
}
