import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/job/domain/entities/job.dart';

part 'job_model.g.dart';

@JsonSerializable()
class JobModel extends Job {
  final int id;
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @JsonKey(name: 'min_years_requirement')
  final int minYearsRequirement;
  @JsonKey(name: 'max_years_requirement')
  final int maxYearsRequirement;
  @JsonKey(name: 'low_salary')
  final double lowSalary;
  @JsonKey(name: 'high_salary')
  final double highSalary;
  @JsonKey(name: 'city')
  final String cityName;
  final String subDomain;
  @JsonKey(name: 'company_id')
  final int companyId;
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'company_profile_image')
  final String companyImgUrl;
  @JsonKey(name: 'posted')
  final String postedDate;
  @JsonKey(name: 'application_date')
  final String? applicationDate;
  final String? status;
  JobModel(
      {required this.id,
      required this.jobTitle,
      required this.minYearsRequirement,
      required this.maxYearsRequirement,
      required this.lowSalary,
      required this.highSalary,
      required this.cityName,
      required this.subDomain,
      required this.companyId,
      required this.companyName,
      required this.companyImgUrl,
      required this.postedDate,
      this.status,
      this.applicationDate})
      : super(
            id: id,
            jobTitle: jobTitle,
            companyName: companyName,
            subDomain: subDomain,
            cityName: cityName,
            companyId: companyId,
            companyImgUrl: companyImgUrl,
            highSalary: highSalary,
            lowSalary: lowSalary,
            maxYearsRequirement: maxYearsRequirement,
            minYearsRequirement: minYearsRequirement,
            postedDate: postedDate,
            status: status,
            applicationDate: applicationDate);

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}
