import 'dart:io';

class ImageParams {
  File imageFile;
  String imageType;
  int id;

  ImageParams(
      {required this.imageFile, required this.imageType, required this.id});
}

enum ImageType {
  userProfile,
  userCover,
  companyProfile,
  companyCover,
  companyRegistration,
  course,
  educationCertificate,
  benefit
}
