import 'package:flutter/material.dart';

//FIXME add gradient to the foreground of the button
class AppButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Gradient gradient;
  const AppButton({Key? key, required this.onPress, required this.text , required this.gradient})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return 
      Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
