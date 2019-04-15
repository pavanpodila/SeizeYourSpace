class ApplicantDetails {
  ApplicantDetails({this.name, this.phone, this.email, this.jobCategory, this.jobId, this.picPath});

  String name;
  String phone;
  String email;
  String jobCategory;
  String jobId;
  String picPath;

  setNamePhoneAndEmailValue(String name, String email, String phone) {
    this.name = name;
    this.phone = phone;
    this.email = email;
  }

  setJobCategory(String category) {
    this.jobCategory = category;
  }

  setJobId(String id) {
    this.jobId = id;
  }

}