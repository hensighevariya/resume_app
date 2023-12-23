import 'package:flutter/material.dart';
import 'package:resume_app/database/db_helper.dart';
import 'package:resume_app/model/user_data_model.dart';

class HomeProvider extends ChangeNotifier {
  List<UserDataModel>? resumeList;

  getResumeList() async {
    resumeList = await DBHelper.instance.getAllResumeList();
    notifyListeners();
  }
}
