import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';
import 'package:photo_job/jobs/job.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase implements Store {
  @observable
  int value = 0;

  @observable
  List<Job> jobs = ObservableList<Job>();

  @action
  void increment() {
    value++;
  }

  @action
  readFileContent() async {
    final Map parsed =
        json.decode(await rootBundle.loadString('lib/assets/jobs.json'));
    final jobList = parsed["jobs"].toList();
    final jobs = jobList
        .map<Job>((job) => Job(job["id"], job["title"], job["description"],
            job["location"], job["responsibilities"]))
        .toList();
    jobs.forEach((job) => {this.jobs.add(job)});
    print("check");
    print(this.jobs);
  }

  CounterBase() {
    readFileContent();
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
