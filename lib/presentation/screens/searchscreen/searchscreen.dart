import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/presentation/screens/ingridientsscreen/ingridientsscreen.dart';
import 'package:task_project/presentation/screens/searchscreen/widgets/searchscreen_category_tile_widget.dart';
import 'package:task_project/presentation/screens/searchscreen/widgets/searchscreen_subtitle_with_moreoption_widget.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_fonts.dart';
import 'package:task_project/presentation/themes/app_padding.dart';

import '../../../common/datalists/catogery_list.dart';
import '../../../common/globaltexts/globaltexts.dart';
import '../../../serviece/bloc/app_bloc.dart';
import '../../../serviece/bloc/app_events.dart';
import '../../../serviece/bloc/app_state.dart';
import '../../../serviece/model/data_model.dart';
import '../../../serviece/repository/repositories.dart';
import '../../../testdata/profileimage_and_name/profile_image_and_name_test_data.dart';
import 'widgets/searchscreen_appbar_widget.dart';
import 'widgets/searchscreen_editors_choice_list_tile_widget.dart';
import 'widgets/sreachscreen_popular_list_card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DataBloc(DataRepository())..add(LoadDataEvent()),
        child: Scaffold(
            appBar: SearchScreenAppbar(
              onPressed: () {},
            ),
            backgroundColor: AppColors.primaryColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: GlobalTexts.searchHintText,
                        hintStyle: AppFonts.baseStyle.copyWith(
                            color: AppColors.textGray,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                          borderSide:
                              BorderSide(color: AppColors.textGray, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
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
                    SizedBox(height: 10),
                    SubTitleWithMoreOption(
                        title: GlobalTexts.popularTitle, onTap: () {}),
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
                                MediaQuery.of(context).size.height * 0.16748,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                final item = datalist[index];
                                final truncatedTitle =
                                    item.title != null && item.title!.length > 9
                                        ? "${item.title!.substring(0, 9)}..."
                                        : item.title ?? "No title";

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              IngredientsScreen(
                                                  producturl: item.image ?? ''),
                                        ));
                                  },
                                  child: PopularListCard(
                                    productUrl: item.image ?? " ",
                                    title: truncatedTitle,
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
                    SizedBox(
                      height: 20,
                    ),
                    SubTitleWithMoreOption(
                        title: GlobalTexts.editorsChoiceText, onTap: () {}),
                    BlocBuilder<DataBloc, DataState>(
                      builder: (context, state) {
                        if (state is DataLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is DataLoaded) {
                          List<DataModel> datalist = state.data;

                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              final item = datalist[index];
                              final truncatedTitle =
                                  item.title != null && item.title!.length > 30
                                      ? "${item.title!.substring(0, 30)}..."
                                      : item.title ?? "No title";

                              return EditorsChoiceListTile(
                                userUrl: profileData[index]['url'] ?? '',
                                productUrl: item.image ?? '',
                                title: truncatedTitle,
                                author: profileData[index]['name'] ?? '',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => IngredientsScreen(
                                            producturl: item.image ?? ''),
                                      ));
                                },
                              );
                            },
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
            )));
  }
}
