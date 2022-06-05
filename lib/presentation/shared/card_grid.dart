import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/shared/generated_list.dart';
import 'package:sportwin_predictor/presentation/shared/guess_card.dart';

class CardGrid extends StatefulWidget {
  final Function(int) onTap;
  static bool pauseTimer = false;
  CardGrid(this.onTap, {Key? key}) : super(key: key);

  @override
  State<CardGrid> createState() => _CardGridState();
}

class _CardGridState extends State<CardGrid> {
  List<int> choosenIndex = [];
  bool isAfterFiveSecond = false;
  bool isSelected = false;
  final List<int> randomNumbers = randomList();

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isAfterFiveSecond = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build CardGrid.pauseTimer ${CardGrid.pauseTimer} ');
    return isAfterFiveSecond
        ? GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: 16,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () async {
                    widget.onTap(randomNumbers[index]);

                    setStateIfMounted(() {
                      setState(() {
                        isAfterFiveSecond = false;
                        CardGrid.pauseTimer = true;
                      });
                    });
                    choosenIndex.add(index);
                    await Future.delayed(const Duration(seconds: 5));
                    setStateIfMounted(() {
                      setState(() {
                        isAfterFiveSecond = true;
                      });
                    });
                  },
                  child: choosenIndex.length == 1
                      ? choosenIndex[0] == index
                          ? Container()
                          : GuessCard(number: randomNumbers[index].toString())
                      : choosenIndex.length == 2
                          ? Container()
                          : GuessCard(number: randomNumbers[index].toString()));
            })
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: 16,
            itemBuilder: (BuildContext context, int index) {
              return const GuessCard();
            });
    ;
  }
}

/*


*/
