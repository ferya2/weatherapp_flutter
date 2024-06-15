// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherapp_v2/constants/colors/colors.dart';
import 'package:weatherapp_v2/constants/padding/padding.dart';
import 'package:weatherapp_v2/constants/textstyle/textstyle.dart';
import 'package:weatherapp_v2/views/home/articledetail.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color.lerp(
            ColorsCollection.greenDarkBlue, ColorsCollection.blueDark, 0.084),
        centerTitle: true,
        title: Text(
          "Article",
          style: AppTextStyles.titleStyle2,
        ),
      ),
      body: Container(
        padding: CustomPadding.kAllside,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorsCollection.greenDarkBlue,
              ColorsCollection.blueDark,
            ],
          ),
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 8,
          separatorBuilder: (context, index) => const SizedBox(height: 14),
          itemBuilder: (context, int i) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ArticleDetail(),
                  ),
                );
              },
              child: Container(
                height: 105,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: ColorsCollection.whiteNeutral.withOpacity(0.4),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 105,
                      height: 105,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                        ),
                        child: Image.network(
                          "https://ugm.ac.id/wp-content/uploads/2023/02/07022316757602511534466263.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                              style: AppTextStyles.articleTitleStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Lorem - ",
                                    style: AppTextStyles.articlePortalStyle,
                                  ),
                                  TextSpan(
                                    text:
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                    style: AppTextStyles.articleSubtitleStyle,
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Jumat, 01 Mar 2024 13:45 WIB",
                                  style: AppTextStyles.articleDateStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
