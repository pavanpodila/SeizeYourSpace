import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:photo_job/sdk/domain/job_profile.dart';

class JobProfilesService {
  Future<Map<String, List<JobProfile>>> load() async {
    final Map parsed =
        json.decode(await rootBundle.loadString('lib/assets/jobs.json'));

    return ProfileData.fromJson(parsed).profiles;
  }
}
