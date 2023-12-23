import 'package:flutter/material.dart';

class AddResumeProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactDetailController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController technicalSkillController = TextEditingController();
  TextEditingController experienceAndOrganisationController =
      TextEditingController();
}
