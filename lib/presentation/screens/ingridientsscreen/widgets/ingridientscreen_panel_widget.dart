import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/presentation/screens/ingridientsscreen/widgets/ingridientscreen_related_recipes_card_list.dart';
import 'package:task_project/serviece/bloc/app_state.dart';
import 'package:task_project/serviece/model/data_model.dart';

import '../../../../serviece/bloc/app_bloc.dart';
import '../../../../serviece/bloc/app_events.dart';
import '../../../../serviece/repository/repositories.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_fonts.dart';
import '../../../themes/app_padding.dart';
import '../../../themes/app_textstyles.dart';
import 'ingridients_morepotion_widget.dart';
import 'ingridients_tile_widget.dart';

class PanelWidget extends StatefulWidget {
  const PanelWidget({super.key});

  @override
  _PanelWidgetState createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final List<String> tabs = ["Ingredients", "Instructions"];
  int selectedIndex = 0;

  final List<Map<String, String>> items = [
    {
      "url":
          "https://s3-alpha-sig.figma.com/img/9295/3059/769c8659516418e6981ace19cff6a5e8?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CkNmmWSaZsngTckkXgDtgilG48CkW5g84kA-14EdVOpJOBcdTCUelFpoxfXtJrHRxz33xu8wvLBiVig0J9BZNv1JOdPpVBohrK6kIklElWYOBjTKBCTlXcd6sglLE5eJTpS56mD8h3KSurGENnPaUO2oaFq3muZH29TVuekDvJLqNlAbIQIRk3Kmh~JxTwE8Pvy9sVpffvojSt4D~IU0c~x6LPKV41PcRwwVZqkmc~~w0e8Zb7Yro79e2r~iGCVjQArkKSwEre0xpgPg6zr9HCW6PQseyQwjR-Dyr0C-u5DVN3I38SI58squ9~rcDk3CpkSiMrXXAWXCddzP1FA07Q__",
      "item": "Tortilla Chips"
    },
    {
      "url":
          "https://s3-alpha-sig.figma.com/img/803e/dff3/36bcbae30d57369c8a85b405d98b8c72?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XV0ybPhSEQ4dxC7cbMj-yYqT-TVwBj7-cM2Gaao~rqXb7idHsnLFhOFYw7hGu5tF65Ew7oLLSmFiVXV3yLZyN~MM~h35XYjWMZRaALt~sYW9wEexUhkeqLnp24zU7bppWB4Lu5o8tSHYPU1kC1P0aijQRYkDBuLGfC01qCPtviP5Rx8BBtw6U9v06I3AFoPi1HkmjZ0J1oVHEnfWUYQ8P2SRkmQZ73NmGCX4lib-MQELiTjkwUdAljo5TwKr~V-~ftH1O-XmhM4sCgyKXGl7i~U1UBSl8VE2dMZdjtwkE4Fl~4KFVNfZzTDDv3HXEgcCM3JcgnCdKpfGcG~bmfDBsA__",
      "item": "Avocado"
    },
    {
      "url":
          "https://s3-alpha-sig.figma.com/img/40e1/cb34/ab38adb1eec230fd9289be67235c6164?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CaN58YLrcoi6h7U8LPFjZ1CMcG7T~4bXtp5Div8LyPz9D-jNlz-hZIp18MqlOSQDWQ~V9bDNgNTxZ~aYuXvcpapZLtVdkkYQwj5ipvLywUcrf2H2KofXnI2g6RJGukd0rcsvX2y8cba6gFaqGtGaIu1n2wS1bvA1TPNycKmF12021~viWrvxCa~3vb9IHocSSIo5X6Kj5fHWrJLrck9ATG~LEGr-4iDs5FaDMPoJmYmGIyJGSGsZct8LltB1rgIHMLExeGHsl2Vr1PRFwBhdMqUOG3sggN2z8R6AI6NCX-OTS0mEyl-dYJjjBYNPZHisI25xicLtsT-y3OxZJudbRA__",
      "item": "Red Cabbage"
    },
    {
      "url":
          "https://s3-alpha-sig.figma.com/img/e65a/cd70/67c647c66fe5567f2b14a9a7acd666a8?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=R6kfyAMbF35jrTSWP9nHiq6QSPmXo1opruHtksV5nXXaFjb3P659NLEscm6JkDu9-DrGsYM8x2KvQgZKJBqXXyM6Iu1o3H8wC2W89TsjU-4N9HmrC1cTaqeUbiCtdzAgQGtm09t4FGJNDiupGoUeGXIJt0GRaMb~CCmQ-WSNbzk5U-mm0OxKzMaOdI9aFoaK1~fomME2Pxm0A4UIH8cL7Y~gtILCN2uSY-YRTZebXWIbrH7FaX4gtFg50ieoGZlcqye1psScAlzKORsyzVw49GaERlB56xpAMHump48qx9aT59k~ArU9qjkbEsXAfcxqdla0zLW8nyhRCiSsqvk7EA__",
      "item": "Peanuts"
    },
    {
      "url":
          "https://s3-alpha-sig.figma.com/img/8b20/04bd/09754e2c27508b2b078e1d57fc020323?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=DS5WqOOh1g-3NEaRxV~Sirjlg0D6zbcgQuoSTQKpifLklxO6YUP6gQenH6NBEd5Sp6e6egkm3ZFmalwcQ104gPN5YhqXGIh108ze8sn09t69MyNRxyUWQ23KIzbbCc0I792I-Aeyc3JR0LxLLWDFZbtusrPu~braU5iZTTpGsDmsf1an3lcPibIElqyElNGXqQ1-w3aQOXAo0jbNk55DUzZsMFkRHCKMR-Rb0UPePXLbKvZ9-LmILbmvmFOfajGKA23~RJWJC73iVSzIAapC3zxe-VavDyA-18hGJ1SRN02yPwuimcqkkI-3Pv9VUpr6OrTmURTK~6BzwOVepZtO2Q__",
      "item": "Red Onions"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DataBloc(DataRepository())..add(LoadDataEvent()),
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tab Selection Container
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.067,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: List.generate(tabs.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: (MediaQuery.of(context).size.width - 70) /
                              tabs.length,
                          height:
                              MediaQuery.of(context).size.height * 0.067 - 10,
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? AppColors.blackColor
                                : AppColors.grayColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              tabs[index],
                              style: AppFonts.baseStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: selectedIndex == index
                                    ? AppColors.secondaryColor
                                    : AppColors.textBlack,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                SubTitleWithMoreOption(
                  moreOption: "Add All to Cart",
                  onTap: () {},
                  title: "Ingredients",
                ),
                Text(
                  "${items.length} Items",
                  style: AppTextstyles.authorTextStyle
                      .copyWith(fontSize: 16, color: AppColors.textGray),
                ),
                const SizedBox(height: 16),
                // Item List
                Column(
                  children: items
                      .map((item) => ItemTile(
                            url: item["url"]!,
                            item: item["item"]!,
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.067,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.gradiantColor,
                  ),
                  child: Text(
                    "Add To Cart",
                    style: AppFonts.baseStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryColor),
                  ),
                ),
                Divider(
                  color: AppColors.textGray,
                ),
                Text(
                  "Creator",
                  style: AppTextstyles.subTitleTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.gradiantColor,
                      radius: 24,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/5237/8107/50f758522a22cd53a6ab5c4beeb5428e?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=UMWim2q-VrlSL-5cCVtH6TLHSAHGrvvMClInNsJd~ZIG3jkKrFyqj8HwqyxOJG1cELppmivv5LfKne5aJsyF4WifmRFzKiv~VrtRtbuse4fVF-22rKvjAowXy4BXUuWTpIPThbFPCsR5DhpENETlN7M1LkW2xoTOcUzLM5v7YFxOvSIlft3ApocW0zzY5pNc44E1u9yHD2wCtzUay171DTJArJXWUwJWFk02957QDr8Bj6ZljyBO2RlR7rEBrdRxUa~NMTmBdT95JrzogS9o5sUOIKB8ALhwHdgHF0WP0pKGUfdr2EPOZHYEwH5r8a7NxTJfOq-twdX4Oaj~Bt6u3g__",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Natalia Luca",
                          style: AppTextstyles.authorTextStyle.copyWith(
                              color: AppColors.textBlack, fontSize: 16),
                        ),
                        Text(
                          "I'm the author and recipe developer.",
                          style: AppTextstyles.authorTextStyle
                              .copyWith(color: AppColors.textBlack),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SubTitleWithMoreOption(
                  moreOption: "See All",
                  onTap: () {},
                  title: "Related Recipes",
                ),
                BlocBuilder<DataBloc, DataState>(
                  builder: (context, state) {
                    if (state is DataLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is DataLoaded) {
                      List<DataModel> datalist = state.data;

                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.16748,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            final item = datalist[index];
                            final truncatedTitle =
                                item.title != null && item.title!.length > 9
                                    ? "${item.title!.substring(0, 9)}..."
                                    : item.title ?? "No title";

                            return RelatedListCard(
                              productUrl: item.image ?? " ",
                              title: truncatedTitle,
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
        ));
  }
}
