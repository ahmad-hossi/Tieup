import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/features/education/domain/entities/education.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    Key? key,
    required this.education,
  }) : super(key: key);

  final Education education;

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
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0)),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/place_holder.png',
                  image: '$kBaseUrl/${education.imageUrl}',
                  height: 128.h,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  imageErrorBuilder: (_, object, __) =>
                      Image.asset('assets/images/place_holder.png'),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Text(
                education.fieldOfStudy,
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
                  Expanded(flex: 8, child: Text(education.from)),
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
                  Expanded(flex: 8, child: Text(education.fieldOfStudy)),
                ],
              ),
              if(education.grade != null)...{
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text('Grade :',
                            style: TextStyle(fontWeight: FontWeight.w500))),
                    Expanded(flex: 8, child: Text(education.grade.toString())),
                  ],
                ),
              }
            ],
          ),
        ),
        startChild: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text(education.startDate.substring(0,7)),
              SizedBox(height: 4,),
              Text(education.endDate == null ? 'present' : education.endDate!.substring(0,7)),
            ],
          ),
        )
    );
  }
}
