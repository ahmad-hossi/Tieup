import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/add_skills/data/models/skill_model.dart';
import 'package:tieup/features/job_detail/domain/entities/job_detail.dart';

part 'job_detail_model.g.dart';

@JsonSerializable()
class JobDetailModel extends JobDetail {
  final int id;
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @JsonKey(name: 'job_type')
  final String jobType;
  @JsonKey(name: 'job_style')
  final String jobStyle;
  @JsonKey(name: 'min_years_requirement')
  final int minYearsRequirement;
  @JsonKey(name: 'max_years_requirement')
  final int maxYearsRequirement;
  @JsonKey(name: 'low_salary')
  final double lowSalary;
  @JsonKey(name: 'high_salary')
  final double highSalary;
  @JsonKey(name: 'min_age')
  final int minAge;
  @JsonKey(name: 'max_age')
  final int maxAge;
  final String description;
  @JsonKey(name: 'requirment')
  final String requirement;
  final String gender;
  @JsonKey(name: 'military_service')
  final String? militaryService;
  @JsonKey(name: 'vacancies_num')
  final int vacanciesNum;
  @JsonKey(name: 'city')
  final String cityName;
  @JsonKey(name: 'sub_domain_id')
  final int subDomainId;
  @JsonKey(name: 'subDomain')
  final String subDomainName;
  @JsonKey(name: 'company_id')
  final int companyId;
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'company_discription')
  final String companyDescription;
  @JsonKey(name: 'company_profile_image')
  final String companyProfileImage;
  @override
  final List<SkillModel> skills;
  JobDetailModel(
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
      required this.companyDescription,
      required this.companyName,
      required this.companyProfileImage,
      required this.skills})
      : super(
            id: id,
            cityName: cityName,
            companyName: companyName,
            subDomainName: subDomainName,
            jobTitle: jobTitle,
            jobStyle: jobStyle,
            jobType: jobType,
            militaryService: militaryService,
            gender: gender,
            skills: skills,
            minYearsRequirement: minYearsRequirement,
            maxYearsRequirement: maxYearsRequirement,
            lowSalary: lowSalary,
            highSalary: highSalary,
            subDomainId: subDomainId,
            description: description,
            maxAge: maxAge,
            minAge: minAge,
            requirement: requirement,
            vacanciesNum: vacanciesNum,
            companyId: companyId,
            companyDescription: companyDescription,
            companyProfileImage: companyProfileImage);

  factory JobDetailModel.fomJson(Map<String, dynamic> json) =>
      _$JobDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobDetailModelToJson(this);
}
