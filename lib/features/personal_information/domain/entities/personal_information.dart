import 'package:equatable/equatable.dart';

class PersonalInformation extends Equatable {
  final int id;
  final String? fcmToken;
  final String fullName;
  final String email;
  final String? imageUrl;
  final String? coverImageUrl;
  final String? gender;
  final String phone;
  final DateTime? birthday;
  final int openToWork;
  final String? militaryService;
  final String? address;
  final String? summary;
  final int? cityId;

  const PersonalInformation(
      {required this.id,
       this.fcmToken,
      required this.fullName,
      required this.email,
       this.imageUrl,
       this.coverImageUrl,
       this.gender,
      required this.phone,
       this.birthday,
      required this.openToWork,
       this.militaryService,
       this.address,
       this.summary,
       this.cityId});

  @override
  List<Object?> get props => [id];
}
