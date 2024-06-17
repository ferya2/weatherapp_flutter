import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_v2/constants/colors/colors.dart';
import 'package:weatherapp_v2/constants/padding/padding.dart';
import 'package:weatherapp_v2/constants/textstyle/textstyle.dart';
import 'package:weatherapp_v2/viewmodels/viewmodel_earthquake.dart';

class GempaPage extends StatefulWidget {
  const GempaPage({Key? key}) : super(key: key);

  @override
  State<GempaPage> createState() => _GempaPageState();
}

class _GempaPageState extends State<GempaPage> {
  late ViewModelEarthquake dataGempaProvider;
  @override
  void initState() {
    super.initState();
    // Panggil metode untuk mengambil data gempa saat halaman diinisialisasi
    Provider.of<ViewModelEarthquake>(context, listen: false)
        .getEarthquakeData();
  }

  @override
  Widget build(BuildContext context) {
    dataGempaProvider =
        Provider.of<ViewModelEarthquake>(context, listen: false);
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
        child: Consumer<ViewModelEarthquake>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsCollection.whiteNeutral,
                ),
              );
            }

            return Column(
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
                                    dataGempaProvider.dataGempa?.data.wilayah ??
                                        '',
                                    style: AppTextStyles.subTitleStyle.copyWith(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    value.dataGempa?.data.dirasakan ?? '',
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
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
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
                                child: Image.network(
                                  value.dataGempa?.data.shakemap ?? '',
                                  fit: BoxFit.cover,
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
                          'Tanggal: ${value.dataGempa?.data.tanggal ?? ''}\n'
                          'Jam: ${value.dataGempa?.data.jam ?? ''}\n'
                          'Lintang: ${value.dataGempa?.data.lintang ?? ''}\n'
                          'Bujur: ${value.dataGempa?.data.bujur ?? ''}\n'
                          'Magnitude: ${value.dataGempa?.data.magnitude ?? ''}\n'
                          'Kedalaman: ${value.dataGempa?.data.kedalaman ?? ''}\n'
                          'Potensi: ${value.dataGempa?.data.potensi ?? ''}',
                          style: AppTextStyles.bodyStyle.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
