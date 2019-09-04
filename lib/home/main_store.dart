import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/home/app_route.dart';
import 'package:photo_job/jobs/job_store.dart';
import 'package:photo_job/sdk/applicant_service.dart';
import 'package:photo_job/sdk/domain/applicant.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  _MainStore(ApplicantService service) : _applicantService = service;

  @observable
  Applicant applicant;

  @observable
  ObservableFuture<List<Applicant>> applicants;

  ApplicantService _applicantService;

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
    jobStore.selectedCategory = jobCategory;
    applicant.jobCategory = jobCategory;
    Navigator.pushNamed(context, AppRoute.jobs);
  }

  void submitApplication(BuildContext context,
      {String name, String email, String phone}) async {
    applicant.setValues(name: name, email: email, phone: phone);
    await _applicantService.saveApplication(applicant);
    Navigator.pushNamed(context, AppRoute.complete);
  }

  @action
  loadApplicants() {
    applicants = ObservableFuture(_applicantService.loadApplicants());
  }

  share() async {
    await _applicantService.invokeShare();
  }
}
