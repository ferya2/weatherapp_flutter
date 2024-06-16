import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_v2/constants/padding/padding.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

import '../../constants/colors/colors.dart';
import '../../constants/textstyle/textstyle.dart';

class ArticleDetail extends StatelessWidget {
  final String title;
  final String text;
  final String summary;
  final String url;
  final String image;
  final DateTime publishDate;
  final String author;
  final String sourceCountry;
  const ArticleDetail(
      {super.key,
      required this.title,
      required this.text,
      required this.summary,
      required this.url,
      required this.image,
      required this.publishDate,
      required this.author,
      required this.sourceCountry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Hero(
              tag: 'article',
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    tooltip: "Back",
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: ColorsCollection.blackNeutral,
                      size: 20,
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, bottom: 10.0, top: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      tooltip: "Summary",
                      icon: const Icon(FontAwesomeIcons.list,
                          color: ColorsCollection.blackNeutral, size: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, bottom: 10.0, top: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      tooltip: "Share",
                      icon: const Icon(
                        FontAwesomeIcons.share,
                        color: ColorsCollection.blackNeutral,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 280,
                  ),
                  padding: CustomPadding.kAllside,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.1),
                        blurRadius: 64,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.artDetTitleStyle,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.pin_drop,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              sourceCountry.toUpperCase(),
                              style: AppTextStyles.articleDateStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesomeIcons.pencil,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              author,
                              style: AppTextStyles.articleDateStyle,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              FontAwesomeIcons.calendar,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              DateFormat.yMMMd().add_Hms().format(publishDate),
                              style: AppTextStyles.articleDateStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          text,
                          style: AppTextStyles.artDetSubtitleStyle,
                        ),
                        const SizedBox(height: 15),
                        SelectableLinkify(
                          text: "Source : $url",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
