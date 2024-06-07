import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:weatherapp_v2/model/models_city.dart';
import 'package:weatherapp_v2/services/utils/json_parser.dart';

class CityPageViewModel extends ChangeNotifier {
  int _selectedIndex = -1;
  late stt.SpeechToText _speech;
  late TextEditingController _textEditingController;
  late Future<List<City>> _futureCities;
  List<City> _cities = [];
  List<City> _filteredCities = [];
  final List<String> _countryCodes = ['ID', 'GB', 'IT', 'JP', 'RU', 'KR', 'MY'];
  String _searchText = '';

  CityPageViewModel() {
    _speech = stt.SpeechToText();
    _textEditingController = TextEditingController();
    _futureCities = loadCities(_countryCodes);
    _initializeSpeech();
  }

  int get selectedIndex => _selectedIndex;
  TextEditingController get textEditingController => _textEditingController;
  Future<List<City>> get futureCities => _futureCities;
  List<City> get filteredCities => _filteredCities;

  void _initializeSpeech() async {
    bool available = await _speech.initialize();
    if (available) {
      print('Speech recognition initialized');
    } else {
      print('Speech recognition not available');
    }
  }

  void setCities(List<City> cities) {
    _cities = cities;
    filterCities();
  }

  void filterCities() {
    RegExp regExp = RegExp(r'[!@#\$%^&*(),.?":{}|<>_-]');
    if (_searchText.isEmpty) {
      _filteredCities =
          _cities.where((city) => !regExp.hasMatch(city.name)).toList();
    } else {
      _filteredCities = _cities.where((city) {
        return city.name.toLowerCase().contains(_searchText.toLowerCase()) &&
            !regExp.hasMatch(city.name);
      }).toList();
    }
    notifyListeners();
  }

  void setSearchText(String searchText) {
    _searchText = searchText;
    filterCities();
  }

  void setSelectedIndex(int index) {
    if (_selectedIndex == index) {
      _selectedIndex = -1;
    } else {
      _selectedIndex = index;
    }
    notifyListeners();
  }

  void startListening() {
    bool isListening = _speech.isListening;
    if (isListening) {
      _speech.stop();
      print('Speech recognition stopped');
    } else {
      _speech.listen(
        onResult: (result) {
          _textEditingController.text = result.recognizedWords;
          setSearchText(result.recognizedWords);
          print('Speech recognition result: ${result.recognizedWords}');
        },
      );
      print('Speech recognition started');
    }
  }
}
