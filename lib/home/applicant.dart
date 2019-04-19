import 'dart:io';

import 'package:photo_job/core/services/applicant_service.dart';
import 'package:photo_job/core/theme.dart';

class Applicant {
  String name;
  String phone;
  String email;

  String jobCategory;
  String jobId;
  String picPath;
  String picRelativePath;

  Applicant(
      {this.name,
      this.phone,
      this.email,
      this.jobCategory,
      this.jobId,
      this.picRelativePath});

  final ApplicantService service = ApplicantService();

  setValues({String name, String email, String phone}) {
    this.phone = phone;
    this.email = email;
    this.name = name;
  }

  setJobCategory(String category) {
    this.jobCategory = category;
  }

  setJobId(String id) {
    this.jobId = id;
  }

  setImagePath(String path) {
    final List<String> tokenizedPath = path.split(PROFILE_PATH);
    this.picPath = path;
    this.picRelativePath = tokenizedPath[1];
  }

  Future<File> writeApplicantDetails() async {
    return service.writeApplication(this);
  }
}
