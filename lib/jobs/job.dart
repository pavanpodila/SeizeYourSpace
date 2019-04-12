import 'package:mobx/mobx.dart';

class Job {
  Job({this.id, this.title, this.description, this.location, this.responsibilities});

  String id;
  String title;
  String description;
  String location;
  List responsibilities;
}
