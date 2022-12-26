import 'package:tieup/features/course/domain/entities/course.dart';
import 'package:tieup/features/experience/domain/entities/experience.dart';
import 'package:tieup/features/languages/domain/entities/language.dart';
import 'package:tieup/features/portfolio/domain/entities/portfolio.dart';
import 'package:tieup/features/skill/domain/entities/skill.dart';

class Profile {
  final int id;
  final String fullName;
  final String? gender;
  final String phone;
  final String? birthday;
  final int openToWork;
  final String? militaryService;
  final String? address;
  final String? summary;
  final int? cityId;
  final String? cityName;
  final String? imageUrl;
  final String? coverImageUrl;
  List<Language> languages;
  List<Portfolio> portfolios;
  List<Experience> experiences;
  List<Skill> skills;
  List<Course> courses;

  Profile(
      { required this.id,
        required this.fullName,
        this.gender,
        required this.phone,
        this.birthday,
        required this.openToWork,
        this.militaryService,
        this.address,
        this.summary,
        this.cityName,
        this.cityId,
        this.imageUrl,
        this.coverImageUrl,
      required this.languages,
      required this.portfolios,
      required this.experiences,
      required this.skills,
      required this.courses});
}
