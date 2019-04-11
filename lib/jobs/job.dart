import 'package:mobx/mobx.dart';
part 'job.g.dart';

class Job = JobBase with _$Job;

abstract class JobBase implements Store {
  JobBase(
      id,
        title,
        description,
        location,
        responsibilities);

  @observable
  String id = '';
  @observable
  String title = '';
  @observable
  String description = '';
  @observable
  String location = '';
  @observable
  List responsibilities = [];
}