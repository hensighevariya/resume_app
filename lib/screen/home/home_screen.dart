import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:resume_app/constant/color_constant.dart';
import 'package:resume_app/provider/home_provider.dart';
import 'package:resume_app/screen/add_resume/add_resume_screen.dart';
import 'package:resume_app/widget/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      return Scaffold(
        appBar: AppBar(
          title: AppText(
            text: 'Resume App',
            fontSize: 16.px,
            fontWeight: FontWeight.w600,
            fontColor: ColorConstant.appWhite,
          ),
        ),
        body: Container(),
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
