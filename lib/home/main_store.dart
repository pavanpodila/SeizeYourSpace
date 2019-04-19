import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/core/domain/applicant.dart';
import 'package:photo_job/core/services/applicant_service.dart';
import 'package:photo_job/home/app_route.dart';
import 'package:photo_job/jobs/job_store.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore implements Store {
  @observable
  Applicant applicant;

  @observable
  ObservableFuture<List<Applicant>> applicants;

  ApplicantService _applicantService = ApplicantService();

  JobStore jobStore = JobStore();

  CameraStore camera = CameraStore();

  @action
  beginApplication(BuildContext context) {
    camera.clearPhotoPath();
    applicant = Applicant();
    Navigator.pushNamed(context, AppRoute.categories);
  }

  @action
  endApplication(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoute.home);
    applicant = null;
  }

  void setJobCategory(String jobCategory, BuildContext context) {
    jobStore.setJobCategory(jobCategory);
    applicant.setJobCategory(jobCategory);
    Navigator.pushNamed(context, AppRoute.jobs);
  }

  void submitApplication(BuildContext context,
      {String name, String email, String phone}) {
    applicant.setValues(name: name, email: email, phone: phone);
    applicant.writeApplicantDetails();
    Navigator.pushNamed(context, AppRoute.complete);
  }

  @action
  loadApplicants() {
    applicants = ObservableFuture(_applicantService.readApplicants());
  }

  share() async {
    await _applicantService.invokeShare();
  }
}
