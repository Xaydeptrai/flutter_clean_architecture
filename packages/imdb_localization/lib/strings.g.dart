/// Generated file. Do not edit.
///
/// Original: lib
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 17
///
/// Built on 2024-07-01 at 03:21 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ru;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ru) // set locale
/// - Locale locale = AppLocale.ru.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ru) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	ru(languageCode: 'ru', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get applicationName => 'IMDB';
	late final _StringsMainRu main = _StringsMainRu._(_root);
	late final _StringsHomeRu home = _StringsHomeRu._(_root);
	late final _StringsSearchRu search = _StringsSearchRu._(_root);
}

// Path: main
class _StringsMainRu {
	_StringsMainRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsMainTabsRu tabs = _StringsMainTabsRu._(_root);
}

// Path: home
class _StringsHomeRu {
	_StringsHomeRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get trendingThisWeek => 'Trending this week';
	String get topRated => 'Top Rated';
	String get popular => 'Popular Movies';
}

// Path: search
class _StringsSearchRu {
	_StringsSearchRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get searchHint => 'Search IMDb';
	late final _StringsSearchTabsRu tabs = _StringsSearchTabsRu._(_root);
	late final _StringsSearchBrowseRu browse = _StringsSearchBrowseRu._(_root);
}

// Path: main.tabs
class _StringsMainTabsRu {
	_StringsMainTabsRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get search => 'Search';
	String get video => 'Video';
	String get profile => 'Profile';
}

// Path: search.tabs
class _StringsSearchTabsRu {
	_StringsSearchTabsRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get browse => 'Browse';
	String get streaming => 'Streaming';
	String get comingSoon => 'Coming soon';
	String get inTheaters => 'In theaters';
}

// Path: search.browse
class _StringsSearchBrowseRu {
	_StringsSearchBrowseRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get popular => 'Popular interests';
	String get movies => 'Movies';
	String get shows => 'Shows';
	String get trailers => 'Trailers';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'applicationName': return 'IMDB';
			case 'main.tabs.home': return 'Home';
			case 'main.tabs.search': return 'Search';
			case 'main.tabs.video': return 'Video';
			case 'main.tabs.profile': return 'Profile';
			case 'home.trendingThisWeek': return 'Trending this week';
			case 'home.topRated': return 'Top Rated';
			case 'home.popular': return 'Popular Movies';
			case 'search.searchHint': return 'Search IMDb';
			case 'search.tabs.browse': return 'Browse';
			case 'search.tabs.streaming': return 'Streaming';
			case 'search.tabs.comingSoon': return 'Coming soon';
			case 'search.tabs.inTheaters': return 'In theaters';
			case 'search.browse.popular': return 'Popular interests';
			case 'search.browse.movies': return 'Movies';
			case 'search.browse.shows': return 'Shows';
			case 'search.browse.trailers': return 'Trailers';
			default: return null;
		}
	}
}
