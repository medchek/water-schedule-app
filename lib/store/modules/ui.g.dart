// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Ui on _Ui, Store {
  Computed<ThemeMode?>? _$selectedThemeComputed;

  @override
  ThemeMode? get selectedTheme => (_$selectedThemeComputed ??=
          Computed<ThemeMode?>(() => super.selectedTheme,
              name: '_Ui.selectedTheme'))
      .value;
  Computed<bool>? _$isUiLoadedComputed;

  @override
  bool get isUiLoaded => (_$isUiLoadedComputed ??=
          Computed<bool>(() => super.isUiLoaded, name: '_Ui.isUiLoaded'))
      .value;
  Computed<String?>? _$localeComputed;

  @override
  String? get locale => (_$localeComputed ??=
          Computed<String?>(() => super.locale, name: '_Ui.locale'))
      .value;
  Computed<Locale?>? _$selectedLocaleComputed;

  @override
  Locale? get selectedLocale => (_$selectedLocaleComputed ??= Computed<Locale?>(
          () => super.selectedLocale,
          name: '_Ui.selectedLocale'))
      .value;

  final _$_themeAtom = Atom(name: '_Ui._theme');

  @override
  ThemeMode? get _theme {
    _$_themeAtom.reportRead();
    return super._theme;
  }

  @override
  set _theme(ThemeMode? value) {
    _$_themeAtom.reportWrite(value, super._theme, () {
      super._theme = value;
    });
  }

  final _$_isThemeLoadedAtom = Atom(name: '_Ui._isThemeLoaded');

  @override
  bool get _isThemeLoaded {
    _$_isThemeLoadedAtom.reportRead();
    return super._isThemeLoaded;
  }

  @override
  set _isThemeLoaded(bool value) {
    _$_isThemeLoadedAtom.reportWrite(value, super._isThemeLoaded, () {
      super._isThemeLoaded = value;
    });
  }

  final _$_localeAtom = Atom(name: '_Ui._locale');

  @override
  String? get _locale {
    _$_localeAtom.reportRead();
    return super._locale;
  }

  @override
  set _locale(String? value) {
    _$_localeAtom.reportWrite(value, super._locale, () {
      super._locale = value;
    });
  }

  final _$_isLocaleLoadedAtom = Atom(name: '_Ui._isLocaleLoaded');

  @override
  bool get _isLocaleLoaded {
    _$_isLocaleLoadedAtom.reportRead();
    return super._isLocaleLoaded;
  }

  @override
  set _isLocaleLoaded(bool value) {
    _$_isLocaleLoadedAtom.reportWrite(value, super._isLocaleLoaded, () {
      super._isLocaleLoaded = value;
    });
  }

  final _$getThemeAsyncAction = AsyncAction('_Ui.getTheme');

  @override
  Future<void> getTheme() {
    return _$getThemeAsyncAction.run(() => super.getTheme());
  }

  final _$setThemeAsyncAction = AsyncAction('_Ui.setTheme');

  @override
  Future<void> setTheme(ThemeMode themeMode) {
    return _$setThemeAsyncAction.run(() => super.setTheme(themeMode));
  }

  final _$getLocaleAsyncAction = AsyncAction('_Ui.getLocale');

  @override
  Future<void> getLocale() {
    return _$getLocaleAsyncAction.run(() => super.getLocale());
  }

  final _$setLocaleAsyncAction = AsyncAction('_Ui.setLocale');

  @override
  Future<void> setLocale(String? locale) {
    return _$setLocaleAsyncAction.run(() => super.setLocale(locale));
  }

  @override
  String toString() {
    return '''
selectedTheme: ${selectedTheme},
isUiLoaded: ${isUiLoaded},
locale: ${locale},
selectedLocale: ${selectedLocale}
    ''';
  }
}
