// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    id: json['id'] as int,
    fullName: json['full_name'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    birthday: json['birthday'] as String?,
    gender: json['gender'] as String?,
    address: json['address'] as String?,
    openToWork: json['open_to_work'] as int,
    militaryService: json['military_service'] as String?,
    summary: json['summary'] as String?,
    cityId: json['city_id'] as int?,
    cityName: json['city'] as String?,
    imageUrl: json['image'] as String?,
    coverImageUrl: json['cover_image'] as String?,
    educations: (json['EducationCertificates'] as List<dynamic>)
        .map((e) => EducationModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    languages: (json['Languages'] as List<dynamic>)
        .map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    portfolios: (json['portfolios'] as List<dynamic>)
        .map((e) => PortfolioModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    experiences: (json['Experiances'] as List<dynamic>)
        .map((e) => ExperienceModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    skills: (json['Skills'] as List<dynamic>)
        .map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    courses: (json['Courses'] as List<dynamic>)
        .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'open_to_work': instance.openToWork,
      'military_service': instance.militaryService,
      'address': instance.address,
      'summary': instance.summary,
      'city_id': instance.cityId,
      'city': instance.cityName,
      'image': instance.imageUrl,
      'cover_image': instance.coverImageUrl,
      'Languages': instance.languages,
      'portfolios': instance.portfolios,
      'Experiances': instance.experiences,
      'Skills': instance.skills,
      'Courses': instance.courses,
      'EducationCertificates': instance.educations,
    };
