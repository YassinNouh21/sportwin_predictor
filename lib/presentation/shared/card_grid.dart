import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/shared/generated_list.dart';
import 'package:sportwin_predictor/presentation/shared/guess_card.dart';

class CardGrid extends StatefulWidget {
  final Function(int) onTap;
  CardGrid(this.onTap, {Key? key}) : super(key: key);

  @override
  State<CardGrid> createState() => _CardGridState();
}

class _CardGridState extends State<CardGrid> {
  List<int> choosenIndex = [];

  final List<int> randomNumbers = randomList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 16,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                widget.onTap(randomNumbers[index]);
                setState(() {});
                choosenIndex.add(index);
              },
              child: choosenIndex.length == 1
                  ? choosenIndex[0] == index
                      ? Container()
                      : GuessCard(number: randomNumbers[index].toString())
                  : choosenIndex.length == 2
                      ? Container()
                      : GuessCard(number: randomNumbers[index].toString()));
        });
  }
}

/*


*/
