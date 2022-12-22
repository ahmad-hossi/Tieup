import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/widgets/company_brief.dart';
import 'package:tieup/core/widgets/icon_title.dart';
import 'package:tieup/features/job/domain/entities/job.dart';
import 'package:tieup/features/job_detail/domain/entities/job_detail.dart';
import 'package:tieup/features/job_detail/presentation/bloc/job_detail_bloc.dart';
import 'package:tieup/features/job_detail/presentation/pages/job_details.dart';
import 'package:intl/intl.dart';




class JobCard extends StatelessWidget {
  final Job jobInformation;

  JobCard({required this.jobInformation,Key? key})
      :super(key: key);

  final formatCurrency = NumberFormat.simpleCurrency(name: '',decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(jobInformation.id);
        context.read<JobDetailBloc>().add(GetJobDetailEvent(jobId:Params(
          id:  jobInformation.id
        )));
        Navigator.push(context, MaterialPageRoute(builder: (_)=>JobDetailScreen()));
      },
      child: Container(
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        width: 320.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4.r)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CompanyBrief(
              companyName: jobInformation.companyName,
                jobTitle: jobInformation.jobTitle,
              imageUrl: jobInformation.companyImgUrl,
              subDomainName: jobInformation.subDomain,
            ),
            IconTitle(iconPath: 'assets/icons/location.svg',
                title: 'location',description: '${jobInformation.cityName} (on-site)'),
            IconTitle(iconPath: 'assets/icons/location.svg',
                title: 'experience',description: '${jobInformation.minYearsRequirement} - ${jobInformation.maxYearsRequirement} years'),
            IconTitle(iconPath: 'assets/icons/location.svg',
                title: 'Salary',
                description: '${formatCurrency.format(jobInformation.lowSalary)} '
                    '- ${formatCurrency.format(jobInformation.highSalary)}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Posted on ${jobInformation.postedDate}'),
            )
          ],
        ),
      ),
    );
  }
}
