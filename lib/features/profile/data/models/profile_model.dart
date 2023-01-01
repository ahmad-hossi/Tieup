import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/course/data/models/course_model.dart';
import 'package:tieup/features/experience/data/models/experience_model.dart';
import 'package:tieup/features/languages/data/models/language_model.dart';
import 'package:tieup/features/portfolio/data/models/portfolio_model.dart';
import 'package:tieup/features/profile/domain/entities/profile.dart';
import 'package:tieup/features/skill/data/models/skill_model.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Profile {
  final int id;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String email;
  final String? gender;
  final String phone;
  final String? birthday;
  @JsonKey(name: 'open_to_work')
  final int openToWork;
  @JsonKey(name: 'military_service')
  final String? militaryService;
  final String? address;
  final String? summary;
  @JsonKey(name: 'city_id')
  final int? cityId;
  @JsonKey(name: 'city')
  final String? cityName;
  @JsonKey(name: 'image')
  final String? imageUrl;
  @JsonKey(name: 'cover_image')
  final String? coverImageUrl;
  @JsonKey(name: 'Languages')
  final List<LanguageModel> languages;
  @JsonKey(name: 'portfolios')
  final List<PortfolioModel> portfolios;
  @JsonKey(name: 'Experiances')
  final List<ExperienceModel> experiences;
  @JsonKey(name: 'Skills')
  final List<SkillModel> skills;
  @JsonKey(name: 'Courses')
  final List<CourseModel> courses;
  ProfileModel(
      {required this.id,
      required this.fullName,
      required this.phone,
      required this.email,
      this.birthday,
      this.gender,
      this.address,
      required this.openToWork,
      this.militaryService,
      this.summary,
      required this.cityId,
      this.cityName,
      this.imageUrl,
      this.coverImageUrl,
      required this.languages,
      required this.portfolios,
      required this.experiences,
      required this.skills,
      required this.courses})
      : super(
            id: id,
            fullName: fullName,
            phone: phone,
            openToWork: openToWork,
            cityName: cityName,
            militaryService: militaryService,
            summary: summary,
            address: address,
            gender: gender,
            cityId: cityId,
            birthday: birthday,
            imageUrl: imageUrl,
            coverImageUrl: coverImageUrl,
            skills: skills,
            courses: courses,
            experiences: experiences,
            languages: languages,
            email : email,
            portfolios: portfolios);

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
