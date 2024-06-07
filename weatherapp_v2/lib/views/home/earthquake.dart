import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp_v2/constants/colors/colors.dart';
import 'package:weatherapp_v2/constants/padding/padding.dart';
import 'package:weatherapp_v2/constants/textstyle/textstyle.dart';

class GempaPage extends StatelessWidget {
  const GempaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.lerp(
            ColorsCollection.greenDarkBlue, ColorsCollection.blueDark, 0.084),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Gempa Bumi',
          style: AppTextStyles.titleStyle,
        ),
        actions: [
          Padding(
            padding: CustomPadding.kSidePaddingRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.my_location_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
