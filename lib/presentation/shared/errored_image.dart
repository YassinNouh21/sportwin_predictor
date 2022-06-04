import 'package:flutter/material.dart';

class MatchIcon extends StatelessWidget {
  final String imageUrl;
  const MatchIcon(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      errorBuilder: (_, __, ___) => const Icon(Icons.sports_baseball),
    );
  }
}
