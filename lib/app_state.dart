import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _enableSocialProviders =
          prefs.getBool('ff_enableSocialProviders') ?? _enableSocialProviders;
    });
    _safeInit(() {
      _defaultCruiserImageUrl = prefs.getString('ff_defaultCruiserImageUrl') ??
          _defaultCruiserImageUrl;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _enableSocialProviders = true;
  bool get enableSocialProviders => _enableSocialProviders;
  set enableSocialProviders(bool _value) {
    _enableSocialProviders = _value;
    prefs.setBool('ff_enableSocialProviders', _value);
  }

  List<String> _imageUrls = [];
  List<String> get imageUrls => _imageUrls;
  set imageUrls(List<String> _value) {
    _imageUrls = _value;
  }

  void addToImageUrls(String _value) {
    _imageUrls.add(_value);
  }

  void removeFromImageUrls(String _value) {
    _imageUrls.remove(_value);
  }

  void removeAtIndexFromImageUrls(int _index) {
    _imageUrls.removeAt(_index);
  }

  void updateImageUrlsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _imageUrls[_index] = updateFn(_imageUrls[_index]);
  }

  String _defaultCruiserImageUrl =
      'https://firebasestorage.googleapis.com/v0/b/briz-59ee3.appspot.com/o/defaults%2FdefaulCruiserImage.png?alt=media';
  String get defaultCruiserImageUrl => _defaultCruiserImageUrl;
  set defaultCruiserImageUrl(String _value) {
    _defaultCruiserImageUrl = _value;
    prefs.setString('ff_defaultCruiserImageUrl', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
