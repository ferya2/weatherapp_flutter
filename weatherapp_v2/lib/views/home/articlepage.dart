// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_v2/constants/colors/colors.dart';
import 'package:weatherapp_v2/constants/padding/padding.dart';
import 'package:weatherapp_v2/constants/textstyle/textstyle.dart';
import 'package:weatherapp_v2/viewmodels/viewmodel_disaster_article.dart';
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
          style: AppTextStyles.titleStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Consumer<DisasterArticleViewmodel>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Container(
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
              child: const Center(
                child: CircularProgressIndicator(
                  color: ColorsCollection.whiteNeutral,
                ),
              ),
            );
          }
          return Container(
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
            child: RefreshIndicator(
              color: ColorsCollection.whiteNeutral,
              backgroundColor: ColorsCollection.whiteNeutral.withOpacity(0.4),
              onRefresh: () async {
                await value.getDisasterArticle();
              },
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: value.disasterArticleList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 14),
                itemBuilder: (context, int i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetail(
                              title: value.disasterArticleList[i].title,
                              image: value.disasterArticleList[i].image,
                              text: value.disasterArticleList[i].text,
                              author: value.disasterArticleList[i].author,
                              summary: value.disasterArticleList[i].summary,
                              sourceCountry:
                                  value.disasterArticleList[i].sourceCountry,
                              url: value.disasterArticleList[i].url,
                              publishDate:
                                  value.disasterArticleList[i].publishDate),
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
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
                          Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.26,
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    bottomLeft: Radius.circular(14),
                                  ),
                                  child: Image.network(
                                    value.disasterArticleList[i].image,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Text(
                                          'Not Found',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    bottomRight: Radius.circular(14),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.pin_drop,
                                      size: 11,
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      value.disasterArticleList[i].sourceCountry
                                          .toUpperCase(),
                                      style: AppTextStyles.articlePortalStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.disasterArticleList[i].title,
                                    style: AppTextStyles.articleTitleStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    value.disasterArticleList[i].text,
                                    style: AppTextStyles.articleSubtitleStyle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Spacer(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.pencil,
                                        size: 10,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        value.disasterArticleList[i].author,
                                        style: AppTextStyles.articleDateStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.calendar,
                                        size: 10,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        DateFormat.yMMMd().add_Hms().format(
                                            value.disasterArticleList[i]
                                                .publishDate),
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
        },
      ),
    );
  }
}
