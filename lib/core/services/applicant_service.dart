import 'dart:convert';
import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/home/applicant.dart';

class ApplicantService {
  Directory _profilesDirectory;

  ApplicantService() {
    _getProfilesDirectory();
  }

  Future<File> writeApplication(Applicant details) async {
    final file = _getApplicationFile(details);

    return file.writeAsString(toJSON(details));
  }

  String toJSON(Applicant details) {
    return jsonEncode({
      "jobId": details.jobId,
      "jobCategory": details.jobCategory,
      "name": details.name,
      "phone": details.phone,
      "email": details.email,
      "picPath": details.picRelativePath
    });
  }

  Applicant fromJSON(String source) {
    try {
      final map = jsonDecode(source);
      final applicant = Applicant(
          jobId: map['jobId'],
          jobCategory: map['jobCategory'],
          name: map['name'],
          phone: map['phone'],
          email: map['email'],
          picRelativePath: map['picPath']);

      applicant.picPath = applicant.picRelativePath != null
          ? '${_profilesDirectory.path}${applicant.picRelativePath}'
          : null;

      return applicant;
    } catch (e) {
      return null;
    }
  }

  File _getApplicationFile(Applicant details) {
    return File(
        '${_profilesDirectory.path}/${details.email}-${details.jobId}.txt');
  }

  _getProfilesDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}$PROFILE_PATH';
    if (!await Directory(path).exists()) {
      await Directory(path).create(recursive: true);
    }

    _profilesDirectory = Directory(path);
  }

  Future<List<Applicant>> readApplicants() async {
    final entityList =
        _profilesDirectory.list(recursive: false, followLinks: true);

    List<Applicant> applicants = [];
    await for (final entity in entityList) {
      if (entity.path.contains(".txt")) {
        File file = File(entity.path);
        String contents = await file.readAsString();

        applicants.add(fromJSON(contents));
      }
    }

    return applicants;
  }

  prepareFileForSharing() async {
    File data = new File('${_profilesDirectory.path}/out.txt');

    _profilesDirectory
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
  }
}
