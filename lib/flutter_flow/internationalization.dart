import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'el'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? elText = '',
  }) =>
      [enText, elText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '8bg5zkdg': {
      'en': 'Fleet oulook',
      'el': '',
    },
    '7e6a4n8q': {
      'en': '23%',
      'el': '',
    },
    '4gbqovwd': {
      'en': 'Fleet booked this week',
      'el': '',
    },
    'bwtbd945': {
      'en': '93%',
      'el': '',
    },
    'gk50u1cm': {
      'en': 'Fleet booked this season',
      'el': '',
    },
    '2jfjpnwy': {
      'en': 'Home',
      'el': '',
    },
  },
  // Connect
  {
    'dvxcjlqa': {
      'en': 'Welcome to Briz!',
      'el': '',
    },
    'cpmwajsv': {
      'en': 'Continue with Facebook',
      'el': '',
    },
    '6ndtz978': {
      'en': 'Phone Number',
      'el': '',
    },
    'tq4d199i': {
      'en': 'Button',
      'el': '',
    },
    'fvwu14qv': {
      'en': 'Home',
      'el': '',
    },
  },
  // MyFleet
  {
    's6ufqn8z': {
      'en': 'My Fleet',
      'el': '',
    },
    '9kncbfsu': {
      'en': 'My Fleet',
      'el': '',
    },
  },
  // MyProfile
  {
    'u4ms7iax': {
      'en': 'Your Name',
      'el': '',
    },
    'h4zzgqo0': {
      'en': 'Update',
      'el': '',
    },
    'u0lb1q33': {
      'en': 'My Profile',
      'el': '',
    },
    's1mwf9vy': {
      'en': 'My Profile',
      'el': '',
    },
  },
  // EditCruiser
  {
    'qcsjkaum': {
      'en': 'Details',
      'el': '',
    },
    '6570cskg': {
      'en': 'Photo Gallery',
      'el': '',
    },
    'ndq0r9zf': {
      'en': 'Pricing',
      'el': '',
    },
  },
  // CruiserView
  {
    'a9gn5odw': {
      'en': 'Home',
      'el': '',
    },
  },
  // ValidateSMS
  {
    'l6b5lrmc': {
      'en': 'Code',
      'el': '',
    },
    'nd784hfh': {
      'en': 'Validate',
      'el': '',
    },
    'rv6idjpx': {
      'en': 'Page Title',
      'el': '',
    },
    'b7s5k7xr': {
      'en': 'Home',
      'el': '',
    },
  },
  // viewCruiserGallery
  {
    'xmci7bnf': {
      'en': 'Upload from gallery',
      'el': '',
    },
    '2c954zib': {
      'en': 'Take a picture',
      'el': '',
    },
  },
  // viewCruiserDetails
  {
    'esy1x743': {
      'en': 'Sailing Boat',
      'el': '',
    },
    'gpko7h9q': {
      'en': 'Cruiser',
      'el': '',
    },
    '4flqkenk': {
      'en': 'Select the boat type',
      'el': '',
    },
    'iskmfrqc': {
      'en': 'Name',
      'el': '',
    },
    'ye266uh2': {
      'en': 'What\'s the name of the boat',
      'el': '',
    },
    'sscz2jfl': {
      'en': 'Model',
      'el': '',
    },
    'af2ne5yp': {
      'en': '[Some hint text...]',
      'el': '',
    },
    'lm4961ly': {
      'en': 'Cabins',
      'el': '',
    },
    'fce0r0ru': {
      'en': 'Capacity',
      'el': '',
    },
    'j6ryzumu': {
      'en': 'Length',
      'el': '',
    },
    '2qaob2n5': {
      'en': 'Description',
      'el': '',
    },
    'fe1gh6tw': {
      'en': '[Some hint text...]',
      'el': '',
    },
    '1jclamyj': {
      'en': 'Select Location',
      'el': '',
    },
    'dk4wjelt': {
      'en': 'Update',
      'el': '',
    },
    'zw8vnu2r': {
      'en': 'Field is required',
      'el': '',
    },
    'sm9o8qxg': {
      'en': 'Please choose an option from the dropdown',
      'el': '',
    },
    'jvjc82dl': {
      'en': 'Field is required',
      'el': '',
    },
    'v9qrluej': {
      'en': 'Please choose an option from the dropdown',
      'el': '',
    },
    'rpd0lt1u': {
      'en': 'Field is required',
      'el': '',
    },
    'jjw0sufe': {
      'en': 'Please choose an option from the dropdown',
      'el': '',
    },
  },
  // viewCruiserPricelist
  {
    'atfxdopz': {
      'en': 'Daily rate',
      'el': '',
    },
    'emh5q2r9': {
      'en': 'your daily rate in euros',
      'el': '',
    },
    'kujn7y0f': {
      'en': 'Skipper',
      'el': '',
    },
    'efi873ea': {
      'en': 'Subtitle',
      'el': '',
    },
    '8vsduf05': {
      'en': 'Cost (0 for included)',
      'el': '',
    },
    'klk0i9jl': {
      'en': '[Some hint text...]',
      'el': '',
    },
    'l5ygo5sa': {
      'en': 'Host',
      'el': '',
    },
    'bfcucxdp': {
      'en': 'Subtitle',
      'el': '',
    },
    'u137de6b': {
      'en': 'Cost (0 for included)',
      'el': '',
    },
    'acpkrmxh': {
      'en': '[Some hint text...]',
      'el': '',
    },
    'k7o6q0b7': {
      'en': 'Catering',
      'el': '',
    },
    'qxvcg9c8': {
      'en': 'Subtitle',
      'el': '',
    },
    'd1swg09y': {
      'en': 'Cost (0 for included)',
      'el': '',
    },
    'yg8b9cag': {
      'en': '[Some hint text...]',
      'el': '',
    },
    '6gcu6gqb': {
      'en': 'Update',
      'el': '',
    },
  },
  // settingsDarkMode
  {
    '6lslxbib': {
      'en': 'Dark Mode',
      'el': '',
    },
    'qmivaic0': {
      'en': 'Use system setting',
      'el': '',
    },
    'zvbmmogc': {
      'en': 'Enable dark mode',
      'el': '',
    },
  },
  // cardCruiser
  {
    '465yytc3': {
      'en': ':',
      'el': '',
    },
    'xcj51wgl': {
      'en': ':',
      'el': '',
    },
    'h4ug6mof': {
      'en': ':',
      'el': '',
    },
    'zxig6tjg': {
      'en': 'm',
      'el': '',
    },
  },
  // settingsDarkModeCopy
  {
    'asuezggh': {
      'en': 'Communications',
      'el': '',
    },
    '2cjlev3s': {
      'en': 'Whatsapp',
      'el': '',
    },
    'ttp8ucar': {
      'en': 'Viber',
      'el': '',
    },
    '8tzodetd': {
      'en': 'SMS',
      'el': '',
    },
    'r5i0yec9': {
      'en': 'Please select...',
      'el': '',
    },
    'zxbkghku': {
      'en': 'Search for an item...',
      'el': '',
    },
  },
  // Miscellaneous
  {
    '9suhqqq6': {
      'en': '',
      'el': '',
    },
    'brt3cnqz': {
      'en': '',
      'el': '',
    },
    '3jdf7pxb': {
      'en': '',
      'el': '',
    },
    'kz5otj2g': {
      'en': '',
      'el': '',
    },
    'tklusxyn': {
      'en': '',
      'el': '',
    },
    '4n6hz6dp': {
      'en': '',
      'el': '',
    },
    'b592oqy4': {
      'en': '',
      'el': '',
    },
    'lzrivgkj': {
      'en': '',
      'el': '',
    },
    '4zedk8mf': {
      'en': '',
      'el': '',
    },
    'cjl1inle': {
      'en': '',
      'el': '',
    },
    '7tab9799': {
      'en': '',
      'el': '',
    },
    'g7bki6on': {
      'en': '',
      'el': '',
    },
    'rgrj05zo': {
      'en': '',
      'el': '',
    },
    'vrbnmhlq': {
      'en': '',
      'el': '',
    },
    'p3e897ol': {
      'en': '',
      'el': '',
    },
    '7ze3y1nk': {
      'en': '',
      'el': '',
    },
    '86f7rjhn': {
      'en': '',
      'el': '',
    },
    'ce8fb6wi': {
      'en': '',
      'el': '',
    },
    '8dgwi8o9': {
      'en': '',
      'el': '',
    },
    'c46z7bv0': {
      'en': '',
      'el': '',
    },
    'tlnwbj80': {
      'en': '',
      'el': '',
    },
    '9niapqdb': {
      'en': '',
      'el': '',
    },
    'twih9l58': {
      'en': '',
      'el': '',
    },
  },
].reduce((a, b) => a..addAll(b));
