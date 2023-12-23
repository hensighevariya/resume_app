// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:resume_app/database/db_helper.dart';
import 'package:resume_app/model/user_data_model.dart';
import 'package:resume_app/screen/home/home_screen.dart';

class AddResumeProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactDetailController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController technicalSkillController = TextEditingController();
  TextEditingController experienceAndOrganisationController =
      TextEditingController();
  bool isLoading = false;

  showLoader(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> saveDataOnTap(BuildContext context) async {
    showLoader(true);
    UserDataModel userDataModel = UserDataModel(
      name: nameController.text,
      email: emailController.text,
      contact: contactDetailController.text,
      summary: summaryController.text,
      technicalSkill: technicalSkillController.text,
      experience: experienceAndOrganisationController.text,
    );
    await DBHelper.instance.addUser(userDataModel);
    clearData();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
    showLoader(false);
  }

  Future<void> updateDataOnTap(BuildContext context, int id) async {
    showLoader(true);
    UserDataModel userDataModel = UserDataModel(
      name: nameController.text,
      email: emailController.text,
      contact: contactDetailController.text,
      summary: summaryController.text,
      technicalSkill: technicalSkillController.text,
      experience: experienceAndOrganisationController.text,
    );
    await DBHelper.instance.updateUser(userDataModel, id);
    clearData();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
    showLoader(false);
  }

  clearData() {
    nameController.clear();
    emailController.clear();
    contactDetailController.clear();
    summaryController.clear();
    technicalSkillController.clear();
    experienceAndOrganisationController.clear();
  }
}
