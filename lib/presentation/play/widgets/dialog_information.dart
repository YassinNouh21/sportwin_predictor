import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/color_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

import '../../resources/string_manager.dart';

Future<void> showInformationDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
// FIXME Text is not in the center of the dialog
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
                ScreenOneStrings.information,
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: SizeManager.s4,
              ),
              Container(
                width: SizeManager.s155,
                height: SizeManager.s3 + 1,
                decoration: BoxDecoration(
                  color: ColorManger.kplayButton,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(SizeManager.s3),
                  ),
                ),
              ),
              const SizedBox(
                height: SizeManager.s12,
              ),
              SizedBox(
                width: double.infinity,
                child: AutoSizeText(
                  ScreenOneStrings.informationDetail,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: SizeManager.s12,
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
