class EarthquakeData {
  final bool success;
  final String? message;
  final Data data;

  EarthquakeData({
    required this.success,
    this.message,
    required this.data,
  });

  factory EarthquakeData.fromJson(Map<String, dynamic> json) {
    return EarthquakeData(
      success: json['success'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class Data {
  final String tanggal;
  final String jam;
  final String datetime;
  final String coordinates;
  final String lintang;
  final String bujur;
  final String magnitude;
  final String kedalaman;
  final String wilayah;
  final String potensi;
  final String dirasakan;
  final String shakemap;

  Data({
    required this.tanggal,
    required this.jam,
    required this.datetime,
    required this.coordinates,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
    required this.dirasakan,
    required this.shakemap,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      tanggal: json['tanggal'],
      jam: json['jam'],
      datetime: json['datetime'],
      coordinates: json['coordinates'],
      lintang: json['lintang'],
      bujur: json['bujur'],
      magnitude: json['magnitude'],
      kedalaman: json['kedalaman'],
      wilayah: json['wilayah'],
      potensi: json['potensi'],
      dirasakan: json['dirasakan'],
      shakemap: json['shakemap'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tanggal': tanggal,
      'jam': jam,
      'datetime': datetime,
      'coordinates': coordinates,
      'lintang': lintang,
      'bujur': bujur,
      'magnitude': magnitude,
      'kedalaman': kedalaman,
      'wilayah': wilayah,
      'potensi': potensi,
      'dirasakan': dirasakan,
      'shakemap': shakemap,
    };
  }
}
