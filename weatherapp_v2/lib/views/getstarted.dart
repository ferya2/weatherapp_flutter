import 'package:flutter/material.dart';
import 'package:weatherapp_v2/constants/colors/colors.dart';
import 'package:weatherapp_v2/constants/textstyle/textstyle.dart';
import 'package:weatherapp_v2/views/city/city_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              color: ColorsCollection.blueLight,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorsCollection.blueLight, ColorsCollection.blueDark],
              )
              // image: DecorationImage(
              //   image: AssetImage('assets/images/sky.jpg'),
              //   fit: BoxFit.fill,
              ),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/images/weatherblack.png')),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Weather App',
                style: AppTextStyles.titleStyleBrown,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '"Forecast Weather App in your city with just one click"',
                style: AppTextStyles.titleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 220,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsCollection.blackNeutral06,
                      foregroundColor: ColorsCollection.whiteNeutral,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CityPage(),
                          ));
                    },
                    child: Text(
                      'Get Started',
                      style: AppTextStyles.titleStyle,
                    )),
              ),
            ]),
          )),
    );
  }
}
