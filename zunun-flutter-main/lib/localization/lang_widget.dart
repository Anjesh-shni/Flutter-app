import 'package:flutter/material.dart';
import 'package:zunun/features/domain/model/language_model/language_model.dart';
import 'package:zunun/localization/language_controller.dart';
import 'package:zunun/utils/language_constant/language_constant.dart';

class LanguageWidget extends StatelessWidget {
  //This widget let us choose language like English and Spanish
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  const LanguageWidget(
      {super.key,
      required this.languageModel,
      required this.localizationController,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
          LanguageConstant.language[index].languageCode,
          LanguageConstant.language[index].countryCode,
        ));
        localizationController.selectedlangIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey[200]!, blurRadius: 5, spreadRadius: 1)
          ],
        ),
        child: Stack(children: [
          Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(height: 5),
              Text(
                languageModel.languageName,
              ),
            ]),
          ),
          localizationController.selectedInex == index
              ? Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 40,
                  child: Icon(Icons.check_circle,
                      color: Theme.of(context).primaryColor, size: 25),
                )
              : const SizedBox(),
        ]),
      ),
    );
  }
}
