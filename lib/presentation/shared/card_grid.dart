import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/shared/generated_list.dart';
import 'package:sportwin_predictor/presentation/shared/guess_card.dart';

class CardGrid extends StatelessWidget {
  final List<int> randomNumbers = randomList();
  CardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        1: FlexColumnWidth(1.0),
        2: FlexColumnWidth(1.0),
        3: FlexColumnWidth(1.0),
      },

      defaultVerticalAlignment: TableCellVerticalAlignment .top,
      children: [
        TableRow(
          children: [
            GuessCard(
              number: randomNumbers[0].toString(),
            ),
            GuessCard(
              number: randomNumbers[1].toString(),
            ),
            GuessCard(
              number: randomNumbers[2].toString(),
            ),
          ],
        ),
        TableRow(
          children: [
            GuessCard(
              number: randomNumbers[3].toString(),
            ),
            GuessCard(
              number: randomNumbers[4].toString(),
            ),
            GuessCard(
              number: randomNumbers[5].toString(),
            ),
          ],
        ),
        TableRow(
          children: [
            GuessCard(
              number: randomNumbers[6].toString(),
            ),
            GuessCard(
              number: randomNumbers[7].toString(),
            ),
            GuessCard(
              number: randomNumbers[8].toString(),
            ),
          ],
        ),
      ],
    );
  }
}

/*
GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: 16,
      itemBuilder: (BuildContext context, int index) {
        return GuessCard(
          number: randomNumbers[index].toString(),
        );
      },
    )

*/