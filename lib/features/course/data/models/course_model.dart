import 'package:json_annotation/json_annotation.dart';
import 'package:tieup/features/course/domain/entities/course.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel extends Course{
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final String name;
  final String from;
  @JsonKey(name: 'image')
  final String imgUrl;
  final String subDomain;
  @JsonKey(name: 'date_of_achievement')
  final String dateOfAchievement;

  CourseModel({required this.id,required this.userId,required this.name,
    required this.from,required this.imgUrl,
    required this.subDomain,required this.dateOfAchievement}) :
        super(
        name: name,
        id: id,
        dateOfAchievement: dateOfAchievement,
        from: from,
        imgUrl: imgUrl,
        subDomain: subDomain
      );

  factory CourseModel.fromJson(Map<String,dynamic> json)=>_$CourseModelFromJson(json);

  Map<String , dynamic> toJson()=>_$CourseModelToJson(this);
}