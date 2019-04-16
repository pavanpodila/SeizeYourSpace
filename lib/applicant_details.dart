import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class ApplicantDetails {
  ApplicantDetails(
      {this.name,
      this.phone,
      this.email,
      this.jobCategory,
      this.jobId,
      this.picPath});

  String name;
  String phone;
  String email;
  String jobCategory;
  String jobId;
  String picPath;

  setNamePhoneAndEmailValue(String name, String email, String phone) {
    this.name = name;
    this.phone = phone;
    this.email = email;
    writeApplicantDetails(this);
  }

  setJobCategory(String category) {
    this.jobCategory = category;
  }

  setJobId(String id) {
    this.jobId = id;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/${this.email}-${this.jobId}.txt');
  }

  Future<File> writeApplicantDetails(ApplicantDetails details) async {
    final file = await _localFile;

    // Write the file
    file.writeAsString(jsonEncode({
      "jobId": details.jobId,
      "jobCategory": details.jobCategory,
      "name": details.name,
      "phone": details.phone,
      "email": details.email
    }));
  }
}
