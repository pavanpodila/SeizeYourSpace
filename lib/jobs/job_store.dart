import 'package:mobx/mobx.dart';
import 'package:photo_job/core/domain/job.dart';
import 'package:photo_job/core/services/jobs_service.dart';

part 'job_store.g.dart';

class JobStore = _JobStore with _$JobStore;

abstract class _JobStore implements Store {
  final JobsService service = JobsService();

  _JobStore() {
    loadJobs();
  }

  @observable
  Map<String, List<Job>> _jobsMap = {};

  @computed
  List<String> get jobCategories =>
      _jobsMap == null ? [] : _jobsMap.keys.toList(growable: false);

  @observable
  String selectedCategory;

  @observable
  Job selectedJob;

  @computed
  List<Job> get jobs => _jobsMap[selectedCategory] ?? [];

  @computed
  bool get hasSelection => selectedJob != null;

  @action
  Future<void> loadJobs() async {
    _jobsMap = await service.load();
  }

  @action
  setJobCategory(String jobCategory) {
    selectedCategory = jobCategory;
  }

  @action
  void selectJob(Job job) {
    selectedJob = job;
  }
}
