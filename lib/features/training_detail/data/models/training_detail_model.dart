import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/skill/data/models/skill_model.dart';
import 'package:tieup/features/training_detail/domain/entities/training_detail.dart';

part 'training_detail_model.g.dart';

@JsonSerializable()
class TrainingDetailModel extends TrainingDetail {
  final int id;
  final String name;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  @JsonKey(name: 'registration_date')
  final String registrationDate;
  final double cost;
  @JsonKey(name: 'location')
  final String address;
  final double longitude;
  final double latitude;
  final String description;
  @JsonKey(name: 'requirment')
  final String requirement;
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
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;
  @JsonKey(name: 'is_application')
  final bool isApplied;
  final List<SkillModel> skills;
  TrainingDetailModel(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.registrationDate,
      required this.cost,
      required this.address,
      required this.longitude,
      required this.latitude,
      required this.description,
      required this.requirement,
      required this.vacanciesNum,
      required this.cityName,
      required this.subDomainId,
      required this.subDomainName,
      required this.companyId,
      required this.companyName,
      required this.companyDescription,
      required this.companyProfileImage,
        required this.isApplied,
        required this.isFavorite,
      required this.skills})
      : super(
            id: id,
            name: name,
            startDate: startDate,
            cost: cost,
            cityName: cityName,
            companyName: companyName,
            companyId: companyId,
            companyProfileImage: companyProfileImage,
            companyDescription: companyDescription,
            vacanciesNum: vacanciesNum,
            requirement: requirement,
            description: description,
            subDomainId: subDomainId,
            subDomainName: subDomainName,
            skills: skills,
            address: address,
            endDate: endDate,
            latitude: latitude,
            longitude: longitude,
            isFavorite: isFavorite,
            isApplied: isApplied,
            registrationDate: registrationDate);

  factory TrainingDetailModel.fomJson(Map<String, dynamic> json) =>
      _$TrainingDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingDetailModelToJson(this);
}
