import 'package:mobx/mobx.dart';
import 'package:photo_job/sdk/domain/job_profile.dart';
import 'package:photo_job/sdk/job_profiles_service.dart';

part 'job_store.g.dart';

class JobStore = _JobStore with _$JobStore;

abstract class _JobStore with Store {
  final JobProfilesService service = JobProfilesService();

  _JobStore() {
    loadJobs();
  }

  @observable
  Map<String, List<JobProfile>> _jobsMap = {};

  @computed
  List<String> get jobCategories =>
      _jobsMap == null ? [] : _jobsMap.keys.toList(growable: false);

  @observable
  String selectedCategory;

  @observable
  JobProfile selectedJob;

  @computed
  List<JobProfile> get jobs => _jobsMap[selectedCategory] ?? [];

  @computed
  bool get hasSelection => selectedJob != null;

  @action
  Future<void> loadJobs() async {
    _jobsMap = await service.load();
  }
}
