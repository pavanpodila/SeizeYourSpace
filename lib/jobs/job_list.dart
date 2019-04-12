import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';
import 'package:photo_job/jobs/job.dart';

part 'job_list.g.dart';

class JobList = JobListBase with _$JobList;

abstract class JobListBase implements Store {

  JobListBase() {
    readFileContent();
  }

  @observable
  ObservableList<Job> jobs = ObservableList<Job>();

  @action
  readFileContent() async {
    final Map parsed =
        json.decode(await rootBundle.loadString('lib/assets/jobs.json'));
    final parsedJobList = parsed["jobs"].toList();
    final jobsArray = parsedJobList
        .map<Job>((job) => Job(id: job["id"], title: job["title"], description: job["description"],
        location: job["location"], responsibilities: job["responsibilities"]))
        .toList();
    jobsArray.forEach((job) => {this.jobs.add(job)});
  }

  @observable
  Job selectedJob;

  @computed
  bool get hasSelection => selectedJob != null;

  @action
  void selectJob(Job job) {
    selectedJob = job;
  }

  @action
  void selectJobWithIndex(int index) {
    selectedJob = index >= 0 && index < jobs.length ? jobs[index] : null;
  }
}
