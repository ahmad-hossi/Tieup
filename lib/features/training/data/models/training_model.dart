import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/training/domain/entities/training.dart';

part 'training_model.g.dart';

@JsonSerializable()
class TrainingModel extends Training {
  final int id;
  final String name;
  double cost;
  @JsonKey(name: 'city')
  final String cityName;
  @JsonKey(name: 'subDomain')
  final String subDomainName;
  @JsonKey(name: 'company_id')
  final int companyId;
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'company_profile_image')
  final String companyImgUrl;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'posted')
  final String postedDate;

  TrainingModel(
      {required this.id,
      required this.name,
      required this.cost,
      required this.cityName,
      required this.subDomainName,
      required this.companyId,
      required this.companyName,
      required this.companyImgUrl,
      required this.startDate,
      required this.postedDate})
      : super(
          name: name,
          cityName: cityName,
          id: id,
          postedDate: postedDate,
          companyImgUrl: companyImgUrl,
          companyId: companyId,
          companyName: companyName,
          startDate: startDate,
          subDomainName: subDomainName,
          cost: cost,
        );

  factory TrainingModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingModelToJson(this);
}
