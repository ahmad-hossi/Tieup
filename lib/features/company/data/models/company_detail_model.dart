import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/company/domain/entities/company_detail.dart';

part 'company_detail_model.g.dart';

@JsonSerializable()
class CompanyDetailModel extends CompanyDetail {
  final int id;
  final String name;
  final String email;
  final String description;
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  final String phone;
  final String location;
  final double longitude;
  final double latitude;
  @JsonKey(name: 'city_id')
  final int cityId;
  final String city;

  CompanyDetailModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.description,
      this.profileImage,
      this.coverImage,
      required this.phone,
      required this.location,
      required this.longitude,
      required this.latitude,
      required this.cityId,
      required this.city})
      : super(
            id: id,
            name: name,
            longitude: longitude,
            latitude: latitude,
            description: description,
            cityId: cityId,
            phone: phone,
            email: email,
            city: city,
            location: location,
            coverImage: coverImage,
            profileImage: profileImage);

  factory CompanyDetailModel.fomJson(Map<String, dynamic> json) =>
      _$CompanyDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDetailModelToJson(this);
}
