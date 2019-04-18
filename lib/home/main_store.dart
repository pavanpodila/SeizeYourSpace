import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/home/app_route.dart';
import 'package:photo_job/home/applicant.dart';
import 'package:photo_job/jobs/job_list.dart';

class MainStore implements Store {
  @observable
  Applicant applicant;

  JobStore jobStore = JobStore();

  CameraStore camera = CameraStore();

  beginApplication(BuildContext context) {
    applicant = Applicant();
    Navigator.pushNamed(context, AppRoute.categories);
  }

  endApplication(BuildContext context) {
    applicant = null;
    Navigator.popUntil(context, ModalRoute.withName(AppRoute.home));
  }

  void setJobCategory(String jobCategory, BuildContext context) {
    jobStore.setJobCategory(jobCategory);
    applicant.setJobCategory(jobCategory);
    Navigator.pushNamed(context, AppRoute.jobs);
  }

  void submitApplication(BuildContext context,
      {String name, String email, String phone}) {
    camera.clearPhotoPath();
    applicant.setValues(name: name, email: email, phone: phone);
    applicant.writeApplicantDetails();
    Navigator.pushNamed(context, AppRoute.complete);
  }
}
