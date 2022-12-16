import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/experience/domain/entities/experience.dart';

part 'experience_model.g.dart';

@JsonSerializable()
class ExperienceModel extends Experience {
  int id;
  @JsonKey(name: 'user_id')
  int userId;
  @JsonKey(name: 'jop_title')
  String jobTitle;
  @JsonKey(name: 'company')
  String companyName;
  String description;
  @JsonKey(name: 'sub_domain_id')
  int subDomainId;
  @JsonKey(name: 'subDomain')
  String subDomainName;
  @JsonKey(name: 'start_date')
  String startDate;
  @JsonKey(name: 'end_date')
  String? endDate;

  ExperienceModel(
      {required this.id,
      required this.userId,
      required this.jobTitle,
      required this.companyName,
      required this.description,
      required this.subDomainId,
      required this.subDomainName,
      required this.startDate,
      this.endDate})
      : super(
            id: id,
            description: description,
            companyName: companyName,
            jobTitle: jobTitle,
            subDomainId: subDomainId,
            subDomainName: subDomainName,
            startDate: startDate,
            endDate: endDate);

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceModelToJson(this);
}
