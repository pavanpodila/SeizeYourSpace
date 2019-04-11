import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase implements Store {
  @observable
  int value = 0;

  @observable
  List<Job> jobs = [];

  @action
  void increment() {
    value++;
  }

  readFileContent() async {
    final Map parsed =
        json.decode(await rootBundle.loadString('lib/assets/jobs.json'));
    final jobList = parsed["jobs"].toList();
    final jobs = jobList
        .map<Job>((job) => Job(
            id: job["id"],
            title: job["title"],
            description: job["description"],
            location: job["location"],
            responsibilities: job["responsibilities"]))
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

class Job {
  Job(
      {this.id,
      this.title,
      this.description,
      this.location,
      this.responsibilities});

  final String id;
  final String title;
  final String description;
  final String location;
  final List responsibilities;
}
