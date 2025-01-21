import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/common/globaltexts/globaltexts.dart';
import 'package:task_project/presentation/screens/ingridientsscreen/ingridientsscreen.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_padding.dart';
import 'package:task_project/presentation/themes/app_textstyles.dart';

import '../../../common/datalists/catogery_list.dart';
import '../../../serviece/bloc/app_bloc.dart';
import '../../../serviece/bloc/app_events.dart';
import '../../../serviece/bloc/app_state.dart';
import '../../../serviece/model/data_model.dart';
import '../../../serviece/repository/repositories.dart';
import '../../../testdata/profileimage_and_name/profile_image_and_name_test_data.dart';
import 'widgets/homescreen_category_list_tile_widget.dart';
import 'widgets/homescreen_feactured_card_widget.dart';
import 'widgets/homescreen_greeting_section_widget.dart';
import 'widgets/homescreen_popular_list_card_widget.dart';
import 'widgets/homescreen_subtitle_with_moreoption_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(DataRepository())..add(LoadDataEvent()),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              GreetingSection(
                userName: "Alena Sabyan",
                gotoCart: () {},
              ),
              Padding(
                padding: AppPadding.screenPaddingLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GlobalTexts.feacturedTitle,
                      style: AppTextstyles.subTitleTextStyle,
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<DataBloc, DataState>(
                      builder: (context, state) {
                        if (state is DataLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is DataLoaded) {
                          List<DataModel> datalist = state.data;
                          return SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.21182266,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                final item = datalist[index];
                                return FeaturedCard(
                                  userName:
                                      profileData[index]['name'] ?? 'Unknown',
                                  time: "20",
                                  title: item.title ?? "No title",
                                  profileUrl: profileData[index]['url'] ?? '',
                                );
                              },
                            ),
                          );
                        }
                        return const Center(
                          child: Text("No data found"),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SubTitleWithMoreOption(
                title: GlobalTexts.categoryTitle,
                onTap: () {},
              ),
              Padding(
                padding: AppPadding.screenPaddingLeft,
                child: SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            categoryIndex = index;
                          });
                        },
                        child: CategoryTile(
                          title: categoryList[index],
                          bgColor: categoryIndex == index
                              ? AppColors.gradiantColor
                              : AppColors.grayColor,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SubTitleWithMoreOption(
                title: GlobalTexts.popularTitle,
                onTap: () {},
              ),
              Padding(
                padding: AppPadding.screenPaddingLeft,
                child: BlocBuilder<DataBloc, DataState>(
                  builder: (context, state) {
                    if (state is DataLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is DataLoaded) {
                      List<DataModel> datalist = state.data;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: datalist.length,
                          itemBuilder: (context, index) {
                            final item = datalist[index];
                            final title = item.title ?? "No title";
                            final truncatedTitle = title.length > 45
                                ? "${title.substring(0, 45)}..."
                                : title;

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IngredientsScreen(
                                      producturl:
                                          item.image ?? '', // Replace with the actual product URL you want to pass
                                    ),
                                  ),
                                );
                              },
                              child: PopularListCard(
                                calaries: "120",
                                time: "20",
                                title: truncatedTitle,
                                productUrl: item.image ?? '',
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return const Center(
                      child: Text("No data found"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
