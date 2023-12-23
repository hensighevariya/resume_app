import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:resume_app/constant/color_constant.dart';
import 'package:resume_app/constant/string_constant.dart';
import 'package:resume_app/constant/validation_constant.dart';
import 'package:resume_app/provider/add_resume_provider.dart';
import 'package:resume_app/widget/app_button.dart';
import 'package:resume_app/widget/app_text.dart';
import 'package:resume_app/widget/app_textfield.dart';

class AddResumeScreen extends StatefulWidget {
  const AddResumeScreen({super.key});

  @override
  State<AddResumeScreen> createState() => _AddResumeScreenState();
}

class _AddResumeScreenState extends State<AddResumeScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AddResumeProvider>(
        builder: (context, addResumeProvider, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.appTheme,
          title: AppText(
            text: AppStringConstant.addUserDetails,
            fontSize: 16.px,
            fontWeight: FontWeight.w600,
            fontColor: ColorConstant.appWhite,
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: ColorConstant.appWhite,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            children: [
              AppTextField(
                title:
                    '${AppStringConstant.name} (${AppStringConstant.firstName} + ${AppStringConstant.lastName})',
                controller: addResumeProvider.nameController,
                hintText: AppStringConstant.enterText,
                keyboardType: TextInputType.text,
                validator: (value) => value == null || value.isEmpty
                    ? AppStringConstant.thisFieldIsRequired
                    : AppValidation.nameRegExp.hasMatch(value)
                        ? null
                        : AppStringConstant.enterValidName,
              ),
              SizedBox(height: 10.px),
              AppTextField(
                title: AppStringConstant.email,
                controller: addResumeProvider.emailController,
                hintText: AppStringConstant.enterEmail,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value == null || value.isEmpty
                    ? AppStringConstant.thisFieldIsRequired
                    : AppValidation.emailRegExp.hasMatch(value)
                        ? ''
                        : AppStringConstant.enterValidEmail,
              ),
              SizedBox(height: 10.px),
              AppTextField(
                title: AppStringConstant.contactDetails,
                controller: addResumeProvider.contactDetailController,
                hintText: AppStringConstant.enterContactDetails,
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? AppStringConstant.thisFieldIsRequired
                    : value.length != 10
                        ? AppStringConstant.contactNumberMustBeOfTenDigit
                        : null,
              ),
              SizedBox(height: 10.px),
              AppTextField(
                title: AppStringConstant.summary,
                controller: addResumeProvider.summaryController,
                hintText: AppStringConstant.enterText,
                validator: (value) => value == null || value.isEmpty
                    ? AppStringConstant.thisFieldIsRequired
                    : null,
                maxLines: 3,
              ),
              SizedBox(height: 10.px),
              AppTextField(
                title: AppStringConstant.technicalSkills,
                controller: addResumeProvider.technicalSkillController,
                hintText: AppStringConstant.enterText,
                validator: (value) => value == null || value.isEmpty
                    ? AppStringConstant.thisFieldIsRequired
                    : null,
                maxLines: 4,
              ),
              SizedBox(height: 10.px),
              AppTextField(
                title: AppStringConstant.experienceAndOrganisation,
                controller:
                    addResumeProvider.experienceAndOrganisationController,
                hintText: AppStringConstant.enterText,
                validator: (value) => value == null || value.isEmpty
                    ? AppStringConstant.thisFieldIsRequired
                    : null,
                maxLines: 4,
              ),
              SizedBox(height: 50.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    color: ColorConstant.appTheme,
                    widget: AppText(
                      text: AppStringConstant.save,
                      fontWeight: FontWeight.bold,
                      fontColor: ColorConstant.appWhite,
                      fontSize: 16.px,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
