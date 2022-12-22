import 'package:tieup/features/add_skills/domain/entities/skill.dart';

class JobDetail {
  final int id;
  final String jobTitle;
  final String jobType;
  final String jobStyle;
  final int minYearsRequirement;
  final int maxYearsRequirement;
  final double lowSalary;
  final double highSalary;
  final int minAge;
  final int maxAge;
  final String description;
  final String requirement;
  final String gender;
  final String? militaryService;
  final int vacanciesNum;
  final String cityName;
  final int subDomainId;
  final String subDomainName;
  final int companyId;
  final String companyName;
  final String companyProfileImage;
  final String companyDescription;
  final List<Skill> skills;

  JobDetail(
      {required this.id,
      required this.jobTitle,
      required this.jobType,
      required this.jobStyle,
      required this.minYearsRequirement,
      required this.maxYearsRequirement,
      required this.lowSalary,
      required this.highSalary,
      required this.minAge,
      required this.maxAge,
      required this.description,
      required this.requirement,
      required this.gender,
       this.militaryService,
      required this.vacanciesNum,
      required this.cityName,
      required this.subDomainId,
      required this.subDomainName,
      required this.companyId,
      required this.companyName,
      required this.companyDescription,
      required this.companyProfileImage,
      required this.skills});
}
