import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_v2/viewmodels/viewmodel_citypage.dart';
import 'package:weatherapp_v2/viewmodels/viewmodel_disaster_article.dart';
import 'package:weatherapp_v2/views/getstarted.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CityPageViewModel()),
        ChangeNotifierProvider(create: (_) => DisasterArticleViewmodel()..getDisasterArticle()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetStarted(),
      ),
    );
  }
}
