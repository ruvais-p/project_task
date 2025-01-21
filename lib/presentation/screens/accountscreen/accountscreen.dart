import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/common/globaltexts/globaltexts.dart';
import 'package:task_project/presentation/screens/accountscreen/widgets/accountscreen_favorite_list_tile_widget.dart';
import 'package:task_project/presentation/screens/accountscreen/widgets/accountscreen_profile_widget.dart';
import 'package:task_project/presentation/screens/homescreen/widgets/homescreen_subtitle_with_moreoption_widget.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_icon.dart';
import 'package:task_project/presentation/themes/app_padding.dart';
import 'package:task_project/presentation/themes/app_textstyles.dart';
import 'package:task_project/testdata/profileimage_and_name/profile_image_and_name_test_data.dart';

import '../../../serviece/bloc/app_bloc.dart';
import '../../../serviece/bloc/app_events.dart';
import '../../../serviece/bloc/app_state.dart';
import '../../../serviece/repository/repositories.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _truncateTitle(String title) {
    if (title.length <= 40) return title;
    return '${title.substring(0, 40)}...';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DataBloc(DataRepository())..add(LoadDataEvent()),
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        GlobalTexts.accountTitle,
                        style: AppTextstyles.tileBodyTextStyle.copyWith(
                            fontSize: 24, color: AppColors.blackColor),
                      ),
                      AppIcon(
                          height: 24,
                          width: 24,
                          iconPath: "assets/icons/Setting.png",
                          iconColor: AppColors.blackColor)
                    ],
                  ),
                  ProfileCard(
                    userUrl: profileData[4]['url'] ?? '',
                    title: "Recipe Developer",
                    author: "Alena Sabyan",
                    onTap: () {},
                  ),
                  SubTitleWithMoreOption(
                    onTap: () {},
                    title: GlobalTexts.favoriteTitle,
                  ),
                  BlocBuilder<DataBloc, DataState>(
                    builder: (context, state) {
                      if (state is DataLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is DataLoaded) {
                        final datalist = state.data;

                        if (datalist.isEmpty) {
                          return const Center(
                            child: Text("No items available"),
                          );
                        }

                        final screenWidth = MediaQuery.of(context).size.width;

                        final availableWidth = screenWidth - 70;
                        final itemWidth = availableWidth / 2;

                        return SingleChildScrollView(
                          child: Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: List.generate(
                              5,
                              (index) {
                                final safeProfileData = profileData.isNotEmpty
                                    ? profileData
                                    : [
                                        {'name': '', 'url': ''}
                                      ];
                                final profileIndex =
                                    index % safeProfileData.length;

                                final username = safeProfileData[profileIndex]
                                            ['name']
                                        ?.toString() ??
                                    '';
                                final profileUrl = safeProfileData[profileIndex]
                                            ['url']
                                        ?.toString() ??
                                    '';
                                final dataItem = datalist[index];
                                final productUrl =
                                    dataItem.image?.toString() ?? '';
                                final title = _truncateTitle(
                                    dataItem.title?.toString() ?? 'No title');

                                return SizedBox(
                                  width: itemWidth,
                                  child: FavoriteListTile(
                                    productUrl:
                                        productUrl.isNotEmpty ? productUrl : '',
                                    username: username.isNotEmpty
                                        ? username
                                        : 'Unknown User',
                                    title: title,
                                    profileUrl:
                                        profileUrl.isNotEmpty ? profileUrl : '',
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }

                      return const Center(
                        child: Text("No data found"),
                      );
                    },
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
