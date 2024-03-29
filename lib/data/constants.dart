import 'package:aws_polly_api/polly-2016-06-10.dart';

import 'models.dart';

final List<SupportedLanguage> supportedLanguages = [
  SupportedLanguage('Afrikaans', 'af'),
  SupportedLanguage('Albanian', 'sq'),
  SupportedLanguage(
    'Amharic',
    'am',
    ttsCode: LanguageCode.arb,
  ),
  SupportedLanguage('Arabic', 'ar'),
  SupportedLanguage('Armenian', 'hy'),
  SupportedLanguage('Azerbaijani', 'az'),
  SupportedLanguage('Bengali', 'bn'),
  SupportedLanguage('Bosnian', 'bs'),
  SupportedLanguage('Bulgarian', 'bg'),
  SupportedLanguage('Catalan', 'ca'),
  SupportedLanguage(
    'Chinese (Simplified)',
    'zh',
    ttsCode: LanguageCode.cmnCn,
  ),
  SupportedLanguage(
    'Chinese (Traditional)',
    'zh-TW',
    ttsCode: LanguageCode.cmnCn,
  ),
  SupportedLanguage('Croatian', 'hr'),
  SupportedLanguage('Czech', 'cs'),
  SupportedLanguage(
    'Danish',
    'da',
    ttsCode: LanguageCode.daDk,
  ),
  SupportedLanguage('Dari', 'fa-AF'),
  SupportedLanguage(
    'Dutch',
    'nl',
    ttsCode: LanguageCode.nlNl,
  ),
  SupportedLanguage(
    'English',
    'en',
    ttsCode: LanguageCode.enUs,
  ),
  SupportedLanguage('Estonian', 'et'),
  SupportedLanguage('Farsi (Persian)', 'fa'),
  SupportedLanguage('Filipino, Tagalog', 'tl'),
  SupportedLanguage('Finnish', 'fi'),
  SupportedLanguage(
    'French',
    'fr',
    ttsCode: LanguageCode.frFr,
  ),
  SupportedLanguage(
    'French (Canada)',
    'fr-CA',
    ttsCode: LanguageCode.frCa,
  ),
  SupportedLanguage('Georgian', 'ka'),
  SupportedLanguage(
    'German',
    'de',
    ttsCode: LanguageCode.deDe,
  ),
  SupportedLanguage('Greek', 'el'),
  SupportedLanguage('Gujarati', 'gu'),
  SupportedLanguage('Haitian Creole', 'ht'),
  SupportedLanguage('Hausa', 'ha'),
  SupportedLanguage('Hebrew', 'he'),
  SupportedLanguage(
    'Hindi',
    'hi',
    ttsCode: LanguageCode.hiIn,
  ),
  SupportedLanguage('Hungarian', 'hu'),
  SupportedLanguage(
    'Icelandic',
    'is',
    ttsCode: LanguageCode.isIs,
  ),
  SupportedLanguage('Indonesian', 'id'),
  SupportedLanguage('Irish', 'ga'),
  SupportedLanguage(
    'Italian',
    'it',
    ttsCode: LanguageCode.itIt,
  ),
  SupportedLanguage(
    'Japanese',
    'ja',
    ttsCode: LanguageCode.jaJp,
  ),
  SupportedLanguage('Kannada', 'kn'),
  SupportedLanguage('Kazakh', 'kk'),
  SupportedLanguage(
    'Korean',
    'ko',
    ttsCode: LanguageCode.koKr,
  ),
  SupportedLanguage('Latvian', 'lv'),
  SupportedLanguage('Lithuanian', 'lt'),
  SupportedLanguage('Macedonian', 'mk'),
  SupportedLanguage('Malay', 'ms'),
  SupportedLanguage('Malayalam', 'ml'),
  SupportedLanguage('Maltese', 'mt'),
  SupportedLanguage('Marathi', 'mr'),
  SupportedLanguage('Mongolian', 'mn'),
  SupportedLanguage(
    'Norwegian (Bokmål)',
    'no',
    ttsCode: LanguageCode.nbNo,
  ),
  SupportedLanguage('Pashto', 'ps'),
  SupportedLanguage(
    'Polish',
    'pl',
    ttsCode: LanguageCode.plPl,
  ),
  SupportedLanguage(
    'Portuguese (Brazil)',
    'pt',
    ttsCode: LanguageCode.ptBr,
  ),
  SupportedLanguage(
    'Portuguese (Portugal)',
    'pt-PT',
    ttsCode: LanguageCode.ptPt,
  ),
  SupportedLanguage('Punjabi', 'pa'),
  SupportedLanguage(
    'Romanian',
    'ro',
    ttsCode: LanguageCode.roRo,
  ),
  SupportedLanguage(
    'Russian',
    'ru',
    ttsCode: LanguageCode.ruRu,
  ),
  SupportedLanguage('Serbian', 'sr'),
  SupportedLanguage('Sinhala', 'si'),
  SupportedLanguage('Slovak', 'sk'),
  SupportedLanguage('Slovenian', 'sl'),
  SupportedLanguage('Somali', 'so'),
  SupportedLanguage(
    'Spanish',
    'es',
    ttsCode: LanguageCode.esEs,
  ),
  SupportedLanguage(
    'Spanish (Mexico)',
    'es-MX',
    ttsCode: LanguageCode.esMx,
  ),
  SupportedLanguage('Swahili', 'sw'),
  SupportedLanguage(
    'Swedish',
    'sv',
    ttsCode: LanguageCode.svSe,
  ),
  SupportedLanguage('Tamil', 'ta'),
  SupportedLanguage('Telugu', 'te'),
  SupportedLanguage('Thai', 'th'),
  SupportedLanguage(
    'Turkish',
    'tr',
    ttsCode: LanguageCode.trTr,
  ),
  SupportedLanguage('Ukrainian', 'uk'),
  SupportedLanguage('Urdu', 'ur'),
  SupportedLanguage('Uzbek', 'uz'),
  SupportedLanguage('Vietnamese', 'vi'),
  SupportedLanguage(
    'Welsh',
    'cy',
    ttsCode: LanguageCode.cyGb,
  ),
]..sort((a, b) {
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  });

SupportedLanguage detectLanguage = SupportedLanguage(
  'Detect language',
  'auto',
);
SupportedLanguage englishLanguage =
    supportedLanguages.firstWhere((lang) => lang.code == 'en');
SupportedLanguage frenchLanguage =
    supportedLanguages.firstWhere((lang) => lang.code == 'fr');
