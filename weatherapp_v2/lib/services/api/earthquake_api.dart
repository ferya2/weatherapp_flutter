import 'package:dio/dio.dart';
import 'package:weatherapp_v2/model/models_earthquake.dart';

class ApiServiceEarthQuake {
  Future<EarthquakeData> getEarthquakeData() async {
    try {
      final response = await Dio().get(
        'https://cuaca-gempa-rest-api.vercel.app/quake',
      );

      return EarthquakeData.fromJson(response.data);
    } catch (e) {
      print('Error fetching earthquake data: $e');
      throw e;
    }
  }
}
