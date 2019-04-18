import 'dart:convert';
import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_job/home/applicant.dart';

class ApplicantService {
  Directory _profilesDirectory;

  ApplicantService() {
    _getProfilesDirectory();
  }

  writeApplication(Applicant details) async {
    final file = _getApplicationFile(details);

    // Write the file
    await file.writeAsString(jsonEncode({
      "jobId": details.jobId,
      "jobCategory": details.jobCategory,
      "name": details.name,
      "phone": details.phone,
      "email": details.email,
      "picPath": details.picRelativePath
    }));
  }

  _getApplicationFile(Applicant details) {
    return File(
        '${_profilesDirectory.path}/${details.email}-${details.jobId}.txt');
  }

  _getProfilesDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/profiles';
    if (!await Directory(path).exists()) {
      await Directory(path).create(recursive: true);
    }

    _profilesDirectory = Directory(path);
  }

  Future<List<Applicant>> readApplicants() async {
    try {
      final applicants = _profilesDirectory
          .listSync(recursive: true, followLinks: true)
          .map((entity) async {
        if (entity.path.contains("profiles") && entity.path.contains(".txt")) {
          File file = File(entity.path);
          String contents = await file.readAsString();
          final application = jsonDecode(contents);

          return Applicant.fromJSON(application);
        }
      });
    } catch (e) {
      // If encountering an error, return null
      return null;
    }
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
