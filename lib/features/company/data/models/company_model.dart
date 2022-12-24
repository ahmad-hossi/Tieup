import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/company/domain/entities/company.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel extends Company{
  int id;
  String name;
  @JsonKey(name: 'profile_image')
  String imageUrl;

  CompanyModel({required this.id,required this.name,required this.imageUrl}) :
        super(id: id,name: name,imageUrl: imageUrl);

  factory CompanyModel.fromJson(Map<String,dynamic> json)=>_$CompanyModelFromJson(json);

  Map<String,dynamic> toJson()=>_$CompanyModelToJson(this);
}