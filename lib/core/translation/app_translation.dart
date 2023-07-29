import 'package:get/get.dart';
import 'package:meal_monkey/core/translation/languages/ar_language.dart';
import 'package:meal_monkey/core/translation/languages/en_language.dart';
import 'package:meal_monkey/core/translation/languages/tr_language.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': ENLanguage.map,
        'ar_SA': ARLanguage.map,
        'tr_TR': TRLanguage.map,
      };
}

tr(String key) => key.tr;
