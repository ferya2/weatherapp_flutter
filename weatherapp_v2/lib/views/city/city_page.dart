import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_v2/constants/colors/colors.dart';
import 'package:weatherapp_v2/constants/padding/padding.dart';
import 'package:weatherapp_v2/constants/textstyle/textstyle.dart';
import 'package:weatherapp_v2/model/models_city.dart';
import 'package:weatherapp_v2/viewmodels/viewmodel_citypage.dart';
import 'package:weatherapp_v2/views/home/dashboard.dart';

class CityPage extends StatelessWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CityPageViewModel(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorsCollection.greenDarkBlue.withOpacity(0.084),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Weather List City',
            style: AppTextStyles.titleStyle,
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
        backgroundColor: ColorsCollection.blueDark.withOpacity(0.98),
        body: Padding(
          padding: CustomPadding.kSidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'WEATHER',
                style: AppTextStyles.weatherTitle,
              ),
              const SizedBox(height: 10),
              Consumer<CityPageViewModel>(
                builder: (context, viewModel, child) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.078,
                    width: double.infinity,
                    child: CupertinoTextField(
                      controller: viewModel.textEditingController,
                      padding: CustomPadding.kSidePadding,
                      placeholder: 'Enter Your City',
                      placeholderStyle: AppTextStyles.subTitleStyle,
                      style: AppTextStyles.subTitleStyle,
                      onChanged: (value) {
                        viewModel.setSearchText(value);
                      },
                      suffix: Padding(
                        padding: CustomPadding.kSidePaddingRight,
                        child: IconButton(
                          icon: const Icon(
                            CupertinoIcons.mic_circle,
                            color: ColorsCollection.greyNeutral,
                          ),
                          onPressed: () {
                            viewModel.startListening();
                          },
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorsCollection.blackNeutral06.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<CityPageViewModel>(
                  builder: (context, viewModel, child) {
                    return FutureBuilder<List<City>>(
                      future: viewModel.futureCities,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('No cities found'));
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            viewModel.setCities(snapshot.data!);
                          });

                          return CupertinoScrollbar(
                            child: ListView.builder(
                              itemCount: viewModel.filteredCities.length,
                              itemBuilder: (context, index) {
                                final city = viewModel.filteredCities[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: InkWell(
                                    onTap: () {
                                      viewModel.setSelectedIndex(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: viewModel.selectedIndex == index
                                            ? ColorsCollection.greenDarkBlue
                                                .withOpacity(0.44)
                                            : ColorsCollection.whiteNeutral,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                city.name,
                                                style: AppTextStyles
                                                    .weatherTitle
                                                    .copyWith(
                                                  color:
                                                      viewModel.selectedIndex ==
                                                              index
                                                          ? ColorsCollection
                                                              .greyNeutral02
                                                          : ColorsCollection
                                                              .blackNeutral06,
                                                ),
                                              ),
                                            ),
                                            if (viewModel.selectedIndex ==
                                                index)
                                              const Icon(
                                                CupertinoIcons
                                                    .check_mark_circled_solid,
                                                color: ColorsCollection
                                                    .greyNeutral,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: CustomPadding.kAllside,
          child: Consumer<CityPageViewModel>(
            builder: (context, viewModel, child) {
              return Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: viewModel.selectedIndex != -1
                      ? ColorsCollection.greenDarkBlue.withOpacity(0.5)
                      : ColorsCollection.greyNeutral.withOpacity(0.5),
                ),
                child: CupertinoButton(
                  child: Text(
                    'choose',
                    style: AppTextStyles.weatherTitle.copyWith(
                        color: viewModel.selectedIndex != -1
                            ? ColorsCollection.whiteNeutral
                            : ColorsCollection.blackNeutral06),
                  ),
                  onPressed: () {
                    if (viewModel.selectedIndex != -1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
