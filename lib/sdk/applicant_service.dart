import 'dart:convert';
import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_job/core/theme.dart';

import 'package:photo_job/sdk/domain/applicant.dart';

class ApplicantService {
  Directory _profilesDirectory;

  ApplicantService() {
    _getProfilesDirectory();
  }

  Future<File> writeApplication(Applicant details) async {
    final file = _getApplicationFile(details);

    return file.writeAsString(jsonEncode(details.toJson()));
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

  invokeShare() async {
    final applicants = await readApplicants();
    final json = jsonEncode(applicants);
    final bytes = utf8.encode(json);

    await Share.file('Applicant Profiles', 'profiles.json', bytes, 'text/json');
  }
}
