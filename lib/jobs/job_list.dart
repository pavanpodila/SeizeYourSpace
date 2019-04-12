import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';
import 'package:photo_job/jobs/job.dart';

part 'job_list.g.dart';

class JobList = JobListBase with _$JobList;

abstract class JobListBase implements Store {

  JobListBase() {
    setJobCategories();
  }

  @observable
  ObservableList<String> jobCategories = ObservableList<String>();

  @observable
  String jobCategory = 'web';

  @observable
  ObservableList<Job> jobs = ObservableList<Job>();

  @action
  setJobCategories() async {
    final Map parsed =
    json.decode(await rootBundle.loadString('lib/assets/jobs.json'));
    final categories = parsed.keys.toList();
    categories.forEach((jobCategory) => {this.jobCategories.add(jobCategory)});
  }

  @action
  selectJobsForCategory() async {
    this.jobs.clear();
    final Map parsed =
        json.decode(await rootBundle.loadString('lib/assets/jobs.json'));
    final parsedJobList = parsed['${this.jobCategory}'].toList();
    final jobsArray = parsedJobList
        .map<Job>((job) => Job(id: job["id"], title: job["title"], summary: job["summary"],
        location: job["location"], responsibilities: job["responsibilities"]))
        .toList();
    jobsArray.forEach((job) => {this.jobs.add(job)});
  }

  @action
  setJobCategory(String jobCategory) {
    this.jobCategory = jobCategory;
    selectJobsForCategory();
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
