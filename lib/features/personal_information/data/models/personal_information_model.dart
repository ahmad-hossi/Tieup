// ignore_for_file: annotate_overrides, overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/personal_information/domain/entities/personal_information.dart';

part 'personal_information_model.g.dart';

@JsonSerializable()
class PersonalInformationModel extends PersonalInformation {
  final int id;
  @JsonKey(name: 'full_name')
  final String fullName;
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
  @JsonKey(name: 'city_name')
  final String? cityName;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const PersonalInformationModel({
    required this.id,
    required this.fullName,
    required this.phone,
     this.birthday,
    this.gender,
    this.address,
    required this.openToWork,
    this.militaryService,
    this.summary,
    required this.cityId,
    this.cityName,
    this.createdAt,
    this.updatedAt,
  }) : super(
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
            birthday: birthday);

  factory PersonalInformationModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInformationModelFromJson(json['data']);

  Map<String, dynamic> toJson() => _$PersonalInformationModelToJson(this);

  // factory PersonalInformationModel.fromJson(Map<String, dynamic> json) {
  //   return PersonalInformationModel(
  //       phone: json['data']['phone'],
  //       openToWork: json['data']['openToWork'],
  //       gender: json['data']['gender'],
  //       email: json['data']['email'],
  //       cityId: json['data']['city_id'],
  //       birthday: json['data']['birthday'],
  //       fullName: json['data']['full_name'],
  //       id: json['data']['id'],
  //       summary: json['data']['summary'],
  //       militaryService: json['data']['military_service'],
  //       createdAt: json['data']['created_at'],
  //       updatedAt: json['data']['updated_at'],
  //       fcmToken: json['data']['fcm_token'],
  //       imageUrl: json['data']['image'],
  //       coverImageUrl: json['data']['cover_image']);
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'email': email,
  //     'full_name': fullName,
  //     'birthday': birthday,
  //     'city_id': cityId,
  //     'gender': gender,
  //     'open_to_work': openToWork,
  //     'phone': phone,
  //     'address': address,
  //     'cover_image': coverImageUrl,
  //     'fcm_token': fcmToken,
  //     'image': imageUrl,
  //     'military_service': militaryService,
  //     'summary': summary,
  //   };
  // }
}
