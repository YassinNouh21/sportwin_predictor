import 'package:flutter/material.dart';

class TimerIndicator extends StatelessWidget {
  final int left;
  final int right;
  const TimerIndicator({Key? key, required this.left, required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$left',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          ':',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          '$right',
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
