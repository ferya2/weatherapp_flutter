import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp_v2/constants/colors/colors.dart';
import 'package:weatherapp_v2/constants/padding/padding.dart';
import 'package:weatherapp_v2/constants/textstyle/textstyle.dart';

class GempaPage extends StatelessWidget {
  const GempaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data gempa
    final Map<String, String> data = {
      "tanggal": "14 Jun 2024",
      "jam": "12:39:43 WIB",
      "datetime": "2024-06-14T05:39:43+00:00",
      "coordinates": "-1.87,100.39",
      "lintang": "1.87 LS",
      "bujur": "100.39 BT",
      "magnitude": "4.7",
      "kedalaman": "25 km",
      "wilayah":
          "Pusat gempa berada di laut 57 km BaratLaut Pesisir Selatan, Sumatera Barat",
      "potensi": "Gempa ini dirasakan untuk diteruskan pada masyarakat",
      "dirasakan": "II-III Padang, II-III Pesisir Selatan",
      "shakemap": "https://data.bmkg.go.id/DataMKG/TEWS/20240614123943.mmi.jpg"
    };

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorsCollection.greenDarkBlue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Gempa Bumi',
          style: AppTextStyles.titleStyle.copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: CustomPadding.kSidePaddingRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.my_location_sharp, color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: ColorsCollection.blueDark.withOpacity(0.8),
      body: Padding(
        padding: CustomPadding.kSidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Main Earthquake Info Container
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Earthquake Icon
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.orange,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.warning_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Earthquake Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Earthquake Indonesia',
                                style: AppTextStyles.titleStyle2.copyWith(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                data['wilayah']!,
                                style: AppTextStyles.subTitleStyle.copyWith(
                                  color: Colors.redAccent,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                data['dirasakan']!,
                                style: AppTextStyles.subTitleStyle.copyWith(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Earthquake Image
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Outline color
                            width: 2, // Outline width
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: InteractiveViewer(
                            boundaryMargin: const EdgeInsets.all(20),
                            minScale: 0.5,
                            maxScale: 4.0,
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(data['shakemap']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Additional Information
                    Text(
                      'Additional Information',
                      style: AppTextStyles.titleStyle2.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tanggal: ${data['tanggal']}\nJam: ${data['jam']}\nLintang: ${data['lintang']}\nBujur: ${data['bujur']}\nMagnitude: ${data['magnitude']}\nKedalaman: ${data['kedalaman']}\nPotensi: ${data['potensi']}',
                      style: AppTextStyles.bodyStyle.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
