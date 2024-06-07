import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp_v2/constants/textstyle/textstyle.dart';

import '../../constants/colors/colors.dart';
import '../../constants/padding/padding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color.lerp(
            ColorsCollection.greenDarkBlue, ColorsCollection.blueDark, 0.084),
        title: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.search, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.sort_sharp, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorsCollection.greenDarkBlue, // Warna mulai
              ColorsCollection.blueDark, // Warna akhir
            ],
          ),
        ),
        child: Padding(
          padding: CustomPadding.kSidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Russian, Moscow', style: AppTextStyles.cityTitle),
              const SizedBox(height: 10),
              Text('Wed, May 01', style: AppTextStyles.dateTitle),
              const SizedBox(height: 20),
              Row(children: [
                const SizedBox(
                    height: 180,
                    width: 180,
                    child: Image(
                        image: AssetImage('assets/images/weatherblack.png'))),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('20 °C', style: AppTextStyles.celciusText),
                    Text('Rainstorm', style: AppTextStyles.weatherStatus),
                  ],
                )
              ]),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: ColorsCollection.greyNeutral.withOpacity(0.6),
                ),
                child: Padding(
                  padding: CustomPadding.kSidePadding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: ColorsCollection.whiteNeutral.withOpacity(0.5),
                        ),
                        child: const Icon(
                          Icons.wb_sunny_outlined,
                        ),
                      ),
                      Text('Rainfall', style: AppTextStyles.dateTitle),
                      const SizedBox(width: 20),
                      Text('3cm', style: AppTextStyles.dateTitle),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: ColorsCollection.greyNeutral.withOpacity(0.6),
                ),
                child: Padding(
                  padding: CustomPadding.kSidePadding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: ColorsCollection.whiteNeutral.withOpacity(0.5),
                        ),
                        child: const Icon(
                          Icons.wind_power_sharp,
                        ),
                      ),
                      Text('Wind', style: AppTextStyles.dateTitle),
                      const SizedBox(width: 20),
                      Text('9km/h', style: AppTextStyles.dateTitle),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: ColorsCollection.greyNeutral.withOpacity(0.6),
                ),
                child: Padding(
                  padding: CustomPadding.kSidePadding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: ColorsCollection.whiteNeutral.withOpacity(0.5),
                        ),
                        child: const Icon(
                          Icons.water_sharp,
                        ),
                      ),
                      Text('Humidity', style: AppTextStyles.dateTitle),
                      const SizedBox(width: 20),
                      Text('70%', style: AppTextStyles.dateTitle),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: AppTextStyles.dateTitle,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Next 7 days >',
                      style: AppTextStyles.titleStyle,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [Container()],
              )
            ],
          ),
        ),
      ),
    );
  }
}
