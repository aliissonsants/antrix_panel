import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _folderid = prefs.getStringList('ff_folderid')?.map(int.parse).toList() ??
        _folderid;
    _apilogin = prefs.getString('ff_apilogin') ?? _apilogin;
    _apikey = prefs.getString('ff_apikey') ?? _apikey;
  }

  late SharedPreferences prefs;

  List<int> _folderid = [];
  List<int> get folderid => _folderid;
  set folderid(List<int> _value) {
    _folderid = _value;
    prefs.setStringList(
        'ff_folderid', _value.map((x) => x.toString()).toList());
  }

  void addToFolderid(int _value) {
    _folderid.add(_value);
    prefs.setStringList(
        'ff_folderid', _folderid.map((x) => x.toString()).toList());
  }

  void removeFromFolderid(int _value) {
    _folderid.remove(_value);
    prefs.setStringList(
        'ff_folderid', _folderid.map((x) => x.toString()).toList());
  }

  String _apilogin = 'a5660958f6f8f97b2f2a';
  String get apilogin => _apilogin;
  set apilogin(String _value) {
    _apilogin = _value;
    prefs.setString('ff_apilogin', _value);
  }

  String _apikey = 'ldLqYbdZOaF7Pj9';
  String get apikey => _apikey;
  set apikey(String _value) {
    _apikey = _value;
    prefs.setString('ff_apikey', _value);
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
