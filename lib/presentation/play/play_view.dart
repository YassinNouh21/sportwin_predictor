import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/presentation/play/widgets/dialog_information.dart';
import 'package:sportwin_predictor/presentation/resources/assets_manager.dart';
import 'package:sportwin_predictor/presentation/resources/color_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

import '../../bloc/game_bloc.dart';
import '../resources/string_manager.dart';
import 'widgets/app_bar_button.dart';
import 'widgets/play_button.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final _selectedStar = ValueNotifier<int>(1);
  @override
  void initState() {
    super.initState();
    _selectedStar.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeManager.s16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: SizeManager.s14),
              Expanded(
                flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppBarButton(
                      iconPath: 'mask_group',
                      onPressed: () {
                        showMyDialog(context);
                      },
                    ),
                    const SizedBox(
                      width: SizeManager.s12,
                    ),
                    AppBarButton(
                      iconPath: 'i',
                      onPressed: () {
                        showInformationDialog(context);
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const PlayButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ScreenOneStrings.score,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          width: SizeManager.s8,
                        ),
                        Text(
                          context.watch<GameBloc>().state.maxScore.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          width: SizeManager.s8,
                        ),
                        Image.asset(
                          AssetsManager.dollar,
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          width: SizeManager.s25,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FIXME remove it from here to separate file  :
  showMyDialog(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(SizeManager.s8)),
          ),
          backgroundColor: ColorManger.kDialogBackgound,
          child: Padding(
            padding: const EdgeInsets.all(SizeManager.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ScreenOneStrings.rateApp,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: SizeManager.s4,
                ),
                Container(
                  width: SizeManager.s150,
                  height: SizeManager.s3 + 1,
                  decoration: BoxDecoration(
                    color: ColorManger.kplayButton,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(SizeManager.s3),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SizeManager.s25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStar.value = 1;
                        });
                      },
                      child: ValueListenableBuilder(
                        valueListenable: _selectedStar,
                        builder: (context, value, widget) {
                          return Image.asset(_selectedStar.value >= 1
                              ? AssetsManager.star
                              : AssetsManager.starDisabled);
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStar.value = 2;
                        });
                      },
                      child: ValueListenableBuilder(
                        valueListenable: _selectedStar,
                        builder: (context, value, widget) {
                          return Image.asset(_selectedStar.value >= 2
                              ? AssetsManager.star
                              : AssetsManager.starDisabled);
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStar.value = 3;
                        });
                      },
                      child: ValueListenableBuilder(
                        valueListenable: _selectedStar,
                        builder: (context, value, widget) {
                          return Image.asset(_selectedStar.value >= 3
                              ? AssetsManager.star
                              : AssetsManager.starDisabled);
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStar.value = 4;
                        });
                      },
                      child: ValueListenableBuilder(
                        valueListenable: _selectedStar,
                        builder: (context, value, widget) {
                          return Image.asset(_selectedStar.value >= 4
                              ? AssetsManager.star
                              : AssetsManager.starDisabled);
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStar.value = 5;
                        });
                      },
                      child: ValueListenableBuilder(
                        valueListenable: _selectedStar,
                        builder: (context, value, widget) {
                          return Image.asset(_selectedStar.value >= 5
                              ? AssetsManager.star
                              : AssetsManager.starDisabled);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeManager.s16,
                ),
                Text(
                  ScreenOneStrings.feedback,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        letterSpacing: 0.8,
                        fontSize: 19,
                      ),
                ),
                const SizedBox(
                  height: SizeManager.s40,
                ),
                TextButton(
                  child: Text(
                    ScreenOneStrings.back,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
