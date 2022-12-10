

import 'package:equatable/equatable.dart';

class PersonalInformationParams {

  String fullName;
  String phoneNumber;
  String? address;
  int? cityId;
  String? gender;
  String? birthday;
  int? openToWork;
  String? militaryService;
  String? summary;


  PersonalInformationParams({
      required this.fullName,
      required this.phoneNumber,
      this.address,
      this.cityId,
      this.gender,
      this.birthday,
      this.openToWork,
      this.militaryService,
      this.summary});

  Map<String , String> toMap(){
    return{
      'full_name' : fullName,
      'phone' : phoneNumber,
      'city_id' : cityId == null ? '' : cityId.toString() ,
      'gender' : gender == null ? '' : gender.toString(),
      'birthday' : birthday == null ? '' : birthday.toString(),
      'open_to_work' : openToWork == null ? '0' : '1',
      'military_service' :militaryService == null ? '':militaryService.toString(),
      'address':address == null ? '' : address.toString(),
      'summary':summary == null ? '' : summary.toString(),
    };
  }

}