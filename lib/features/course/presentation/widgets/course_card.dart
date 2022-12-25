import 'package:flutter/material.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/features/course/domain/entities/course.dart';
import 'package:timeline_tile/timeline_tile.dart';


class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
        beforeLineStyle: const LineStyle(thickness: 2),
        afterLineStyle: const LineStyle(thickness: 2),
        axis: TimelineAxis.vertical,
        alignment: TimelineAlign.manual,
        lineXY: 0.2,
        indicatorStyle: const IndicatorStyle(
            width: 12, indicatorXY: 0.5, color: kPrimaryColor),
        endChild: Container(
          margin: const EdgeInsets.fromLTRB(8, 4, 18, 4),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor, width: 2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          //color: Colors.grey,
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0)),
                  child: Image.network(
                    '$kBaseUrl/${course.imgUrl}',
                    fit: BoxFit.contain,
                  )),
              Divider(
                color: Colors.grey,
              ),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Text(workExperience.jobTitle),
              //     const Spacer(),
              //     Container(
              //         margin: const EdgeInsets.all(4.0),
              //         child: const Icon(
              //           Icons.edit,
              //           size: 16,
              //         )),
              //     Container(
              //         margin: const EdgeInsets.all(4.0),
              //         child: const Icon(
              //           Icons.delete,
              //           size: 16,
              //         )),
              //   ],
              // ),
              // Container(
              //   alignment: Alignment.centerLeft,
              //   height: 2,
              //   color: kPrimaryColor,
              //   margin: const EdgeInsets.fromLTRB(0, 0, 182, 4),
              // ),
              Text(
                course.name,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text(
                        'From :',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                  Expanded(flex: 8, child: Text(course.from)),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text('In :',
                          style: TextStyle(fontWeight: FontWeight.w500))),
                  Expanded(flex: 8, child: Text(course.subDomain)),
                ],
              ),
            ],
          ),
        ),
        startChild: Container(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(course.dateOfAchievement.substring(0, 7)),
        ));
  }
}
