import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:photo_job/jobs/job.dart';

class JobsService {
  Future<Map<String, List<Job>>> load() async {
    final Map parsed =
        json.decode(await rootBundle.loadString('lib/assets/jobs.json'));

    return parsed.map((key, value) {
      final jobs = value
          .toList()
          .map<Job>((job) => Job(
              id: job["id"],
              title: job["title"],
              summary: job["summary"],
              location: job["location"],
              responsibilities: job["responsibilities"]))
          .toList();

      return MapEntry(key as String, jobs);
    });
  }
}
