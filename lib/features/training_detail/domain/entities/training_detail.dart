import 'package:tieup/features/skill/domain/entities/skill.dart';

class TrainingDetail {
  final int id;
  final String name;
  final String description;
  final String requirement;
  final String startDate;
  final String endDate;
  final String registrationDate;
  final double cost;
  final String address;
  final double longitude;
  final double latitude;
  final int vacanciesNum;
  final String cityName;
  final int subDomainId;
  final String subDomainName;
  final int companyId;
  final String companyName;
  final String companyProfileImage;
  final String companyDescription;
  final bool isFavorite;
  final bool isApplied;
  final List<Skill> skills;

  TrainingDetail(
      {required this.id,
      required this.name,
      required this.description,
      required this.requirement,
      required this.startDate,
      required this.endDate,
      required this.registrationDate,
      required this.cost,
      required this.address,
      required this.longitude,
      required this.latitude,
      required this.vacanciesNum,
      required this.cityName,
      required this.subDomainId,
      required this.subDomainName,
      required this.companyId,
      required this.companyName,
      required this.companyProfileImage,
      required this.companyDescription,
      required this.isFavorite,
      required this.isApplied,
      required this.skills});
}
