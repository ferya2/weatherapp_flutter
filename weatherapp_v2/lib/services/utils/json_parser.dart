import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:weatherapp_v2/model/models_city.dart';

Future<List<City>> loadCities(List<String> countryCodes) async {
  final String jsonString =
      await rootBundle.loadString('assets/json/city.list.min.json');
  final List<dynamic> jsonList = json.decode(jsonString);

  final List<City> cities = jsonList
      .where((city) => countryCodes.contains(city['country']))
      .map((city) => City.fromJson(city))
      .toList();

  return cities;
}
