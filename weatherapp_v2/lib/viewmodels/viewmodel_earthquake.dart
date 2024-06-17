import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp_v2/model/models_earthquake.dart';
import 'package:weatherapp_v2/services/api/earthquake_api.dart';

class ViewModelEarthquake extends ChangeNotifier {
  EarthquakeData? dataGempa;
  final services = ApiServiceEarthQuake();
  bool isLoading = true;

  Future<void> getEarthquakeData() async {
    try {
      dataGempa = await services.getEarthquakeData();
      print('Data Gempa: $dataGempa');
    } catch (e) {
      if (e is DioException) {
        print('DioError: ${e.response?.statusCode}');
      }
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }
}
