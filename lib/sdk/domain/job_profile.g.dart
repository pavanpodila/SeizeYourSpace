// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobProfile _$JobProfileFromJson(Map<String, dynamic> json) {
  return JobProfile(
    id: json['id'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
    location: json['location'] as String,
    responsibilities:
        (json['responsibilities'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$JobProfileToJson(JobProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'location': instance.location,
      'responsibilities': instance.responsibilities,
    };

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return ProfileData(
    (json['profiles'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : JobProfile.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
  );
}

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'profiles': instance.profiles,
    };
