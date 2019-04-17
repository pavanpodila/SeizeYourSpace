import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

class ApplicantDetails {
  String name;
  String phone;
  String email;
  String jobCategory;
  String jobId;
  String picPath;
  String picRelativePath;

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

  setImagePath(String path) {
    List<String> tokenizedPath = path.split("profiles");
    this.picPath = path;
    this.picRelativePath = tokenizedPath[1];
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/profiles';
    if (!await Directory(path).exists()) {
      await Directory(path).create(recursive: true);
    }
    return path;
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
      "email": details.email,
      "picPath": details.picRelativePath
    }));
  }

  Future<ApplicantDetails> readApplicantDetails() async {
    try {
      final appDirectoryRef = await getApplicationDocumentsDirectory();
      File data = new File('${appDirectoryRef.path}/out.txt');

      appDirectoryRef
          .listSync(recursive: true, followLinks: true)
          .forEach((entity) async {
        if (entity.path.contains("profiles") && entity.path.contains(".txt")) {
          File file = File(entity.path);
          String contents = await file.readAsString();
          contents = contents + "\n";
          data.writeAsStringSync(contents, mode: FileMode.append);
        }
      });
      final ByteData bytes = await rootBundle.load(data.path);
      await Share.file('Applicant Data', 'Applicants.txt',
          bytes.buffer.asUint8List(), 'text/plain');
      data.deleteSync();
    } catch (e) {
      // If encountering an error, return null
      return null;
    }
  }
}
