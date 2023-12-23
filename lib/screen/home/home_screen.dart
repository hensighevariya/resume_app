// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:resume_app/constant/color_constant.dart';
import 'package:resume_app/constant/string_constant.dart';
import 'package:resume_app/database/db_helper.dart';
import 'package:resume_app/provider/home_provider.dart';
import 'package:resume_app/screen/add_resume/add_resume_screen.dart';
import 'package:resume_app/widget/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getResumeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.appTheme,
          centerTitle: true,
          title: AppText(
            text: 'Resume App',
            fontSize: 16.px,
            fontWeight: FontWeight.w600,
            fontColor: ColorConstant.appWhite,
          ),
        ),
        body: homeProvider.resumeList == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.appTheme,
                ),
              )
            : homeProvider.resumeList?.isNotEmpty ?? false
                ? ReorderableListView(
                    onReorder: (int oldIndex, int newIndex) {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final items = homeProvider.resumeList!.removeAt(oldIndex);
                      homeProvider.resumeList!.insert(newIndex, items);
                      homeProvider.notifyListeners();
                    },
                    children: [
                      for (final userData in homeProvider.resumeList!)
                        Container(
                          key: ValueKey(userData),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstant.appWhite,
                              boxShadow: const [
                                BoxShadow(
                                  color: ColorConstant.appGrey,
                                  blurRadius: 5.0,
                                ),
                              ]),
                          padding: EdgeInsets.all(10.px),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.px, vertical: 10.px),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: AppText(
                                            text: AppStringConstant.name,
                                            fontSize: 13.px,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.px),
                                          child: const AppText(
                                            text: ' : ',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: AppText(
                                            text: userData.name,
                                            fontSize: 13.px,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.px),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: AppText(
                                            text: AppStringConstant.email,
                                            fontSize: 13.px,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.px),
                                          child: const AppText(
                                            text: ' : ',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: AppText(
                                            text: userData.email,
                                            fontSize: 13.px,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.px),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: AppText(
                                            text: AppStringConstant
                                                .contactDetails,
                                            fontSize: 13.px,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.px),
                                          child: const AppText(
                                            text: ' : ',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: AppText(
                                            text: userData.contact,
                                            fontSize: 13.px,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.px),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: AppText(
                                            text: AppStringConstant.summary,
                                            fontSize: 13.px,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.px),
                                          child: const AppText(
                                            text: ' : ',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: AppText(
                                            text: userData.summary,
                                            fontSize: 13.px,
                                            textAlign: TextAlign.start,
                                            maxLines: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.px),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: AppText(
                                            text: AppStringConstant
                                                .technicalSkills,
                                            fontSize: 13.px,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.px),
                                          child: const AppText(
                                            text: ' : ',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: AppText(
                                            text: userData.technicalSkill,
                                            fontSize: 13.px,
                                            textAlign: TextAlign.start,
                                            maxLines: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.px),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: AppText(
                                            text: AppStringConstant
                                                .experienceAndOrganisation,
                                            fontSize: 13.px,
                                            fontWeight: FontWeight.w600,
                                            maxLines: 2,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.px),
                                          child: const AppText(
                                            text: ' : ',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: AppText(
                                            text: userData.experience,
                                            fontSize: 13.px,
                                            textAlign: TextAlign.start,
                                            maxLines: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddResumeScreen(
                                            isEdit: true,
                                            userData: userData,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10.px),
                                      child: const Icon(Icons.edit),
                                    ),
                                  ),
                                  SizedBox(height: 30.px),
                                  InkWell(
                                    onTap: () {
                                      homeProvider.resumeList!.removeWhere(
                                          (element) =>
                                              element.userId ==
                                              userData.userId);
                                      DBHelper.instance
                                          .deleteUser(userData.userId!);
                                      homeProvider.notifyListeners();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10.px),
                                      child: const Icon(Icons.delete),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                    ],
                  )
                : Center(
                    child: AppText(
                      text: AppStringConstant.resumeListEmpty,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.px,
                    ),
                  ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddResumeScreen())),
          backgroundColor: ColorConstant.appTheme,
          child: const Icon(
            Icons.add,
            color: ColorConstant.appWhite,
          ),
        ),
      );
    });
  }
}
