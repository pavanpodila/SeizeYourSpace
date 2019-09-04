// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Applicant _$ApplicantFromJson(Map<String, dynamic> json) {
  return Applicant(
    name: json['name'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    jobCategory: json['jobCategory'] as String,
    jobId: json['jobId'] as String,
    picRelativePath: json['picRelativePath'] as String,
  );
}

Map<String, dynamic> _$ApplicantToJson(Applicant instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'jobCategory': instance.jobCategory,
      'jobId': instance.jobId,
      'picRelativePath': instance.picRelativePath,
    };
