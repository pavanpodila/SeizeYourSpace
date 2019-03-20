import 'package:mobx/mobx.dart';

part 'jobs_store.g.dart';

class JobsStore = _JobsStore with _$JobsStore;

abstract class _JobsStore implements Store {
  final List<Job> jobs = [
    Job(title: 'React Developer', description: 'Build apps react-ively!'),
    Job(
        title: 'Flutter Developer',
        description:
            "Yes, that's a thing here! Who do you think built this app?"),
    Job(
        title: 'Angular Developer',
        description: 'Angling to build apps the NG style'),
    Job(title: 'Java Developer', description: 'Java never goes out of fashion'),
    Job(
        title: 'Cobol Developer',
        description:
            "Sorry, we don't offer this. But, you are free to pursue!"),
  ];

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
  Job({this.title, this.description});

  final String title;
  final String description;
}
