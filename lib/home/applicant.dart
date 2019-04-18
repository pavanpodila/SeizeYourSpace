import 'dart:io';

import 'package:photo_job/core/services/applicant_service.dart';

class Applicant {
  String name;
  String phone;
  String email;

  String jobCategory;
  String jobId;
  String picPath;
  String picRelativePath;

  Applicant.fromJSON(json) {}

  Applicant();

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
    List<String> tokenizedPath = path.split("profiles");
    this.picPath = path;
    this.picRelativePath = tokenizedPath[1];
  }

  Future<File> writeApplicantDetails() async {
    return service.writeApplication(this);
  }
}
