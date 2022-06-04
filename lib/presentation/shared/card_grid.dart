import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/shared/generated_list.dart';
import 'package:sportwin_predictor/presentation/shared/guess_card.dart';

class CardGrid extends StatelessWidget {
  final List<int> randomNumbers = randomList();
  final Function(int) onTap;
  CardGrid(this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        1: FlexColumnWidth(1.0),
        2: FlexColumnWidth(1.0),
        3: FlexColumnWidth(1.0),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: [
        TableRow(
            children: List.generate(
                3,
                (index) => InkWell(
                      onTap: () => onTap(randomNumbers[index]),
                      child: GuessCard(
                        number: randomNumbers[index].toString(),
                      ),
                    ))),
        TableRow(
            children: List.generate(
                3,
                (index) => InkWell(
                      onTap: () => onTap(randomNumbers[index + 3]),
                      child: GuessCard(
                        number: randomNumbers[index + 3].toString(),
                      ),
                    ))),
        TableRow(
          children: List.generate(
              3,
              (index) => InkWell(
                    onTap: () => onTap(randomNumbers[index + 6]),
                    child: GuessCard(
                      number: randomNumbers[index + 6].toString(),
                    ),
                  )),
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
