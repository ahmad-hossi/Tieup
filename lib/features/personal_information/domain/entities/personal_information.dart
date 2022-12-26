import 'package:equatable/equatable.dart';

class PersonalInformation extends Equatable {
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

  const PersonalInformation(
      {
      required this.id,
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
      this.coverImageUrl
      });

  @override
  List<Object?> get props => [id];
}
