import 'package:json_annotation/json_annotation.dart';
part 'job_profile.g.dart';

@JsonSerializable()
class JobProfile {
  JobProfile(
      {this.id,
      this.title,
      this.summary,
      this.location,
      this.responsibilities});

  final String id;
  final String title;
  final String summary;
  final String location;
  final List<String> responsibilities;

  Map<String, dynamic> toJson() => _$JobProfileToJson(this);
  factory JobProfile.fromJson(Map<String, dynamic> json) =>
      _$JobProfileFromJson(json);
}

@JsonSerializable()
class ProfileData {
  ProfileData(this.profiles);

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  final Map<String, List<JobProfile>> profiles;
}
