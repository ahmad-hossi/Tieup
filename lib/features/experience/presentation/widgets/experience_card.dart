import 'package:flutter/material.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/experience/domain/entities/experience.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceCard extends StatelessWidget {

  final Experience workExperience;

  const ExperienceCard({Key? key,
    required this.workExperience
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return TimelineTile(
        beforeLineStyle: const LineStyle(thickness: 2),
        afterLineStyle: const LineStyle(thickness: 2),
        axis: TimelineAxis.vertical,
        alignment: TimelineAlign.manual,
        lineXY: 0.22,
        indicatorStyle: const IndicatorStyle(
          width: 12,
          indicatorXY: 0.3,
          color: kPrimaryColor
        ),
        endChild: Container(
          margin: const EdgeInsets.fromLTRB(8, 4, 18, 4),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor,width: 2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          //color: Colors.grey,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(workExperience.jobTitle),
                  const Spacer(),
                  Container(
                      margin: const EdgeInsets.all(4.0),
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                      )),
                  Container(
                      margin: const EdgeInsets.all(4.0),
                      child: const Icon(
                        Icons.delete,
                        size: 16,
                      )),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 2,
                color: kPrimaryColor,
                margin: const EdgeInsets.fromLTRB(0, 0, 182, 4),
              ),
              Row(
                children:  [
                  const Expanded(
                      flex: 4,
                      child: Text(
                        'Company',
                        style: TextStyle(
                            fontWeight: FontWeight.w500),
                      )),
                  Expanded(
                      flex: 7, child: Text(workExperience.companyName)),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children:  [
                  const Expanded(
                      flex: 4,
                      child: Text('Job role',
                          style: TextStyle(
                              fontWeight: FontWeight.w500))),
                  Expanded(flex: 7, child: Text(workExperience.subDomainName ?? 'hello null')),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      workExperience.description,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        startChild: Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 8, 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text(workExperience.startDate.substring(0,7)),
              SizedBox(height: 4,),
              Text(workExperience.endDate == 'null' ? 'present' : workExperience.endDate!.substring(0,7)),
            ],
          ),
        ));
  }
}
