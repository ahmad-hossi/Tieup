import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/core/widgets/company_brief.dart';
import 'package:tieup/core/widgets/icon_title.dart';
import 'package:intl/intl.dart';
import 'package:tieup/features/training/domain/entities/training.dart';
import 'package:tieup/features/training_detail/presentation/bloc/training_detail_bloc.dart';
import 'package:tieup/features/training_detail/presentation/pages/training_details.dart';

class TrainingCard extends StatelessWidget {
  final Training trainingInformation;

  TrainingCard({required this.trainingInformation,Key? key})
      :super(key: key);

  final formatCurrency = NumberFormat.simpleCurrency(name: '',decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, TrainingDetailScreen.routeName);
        context.read<TrainingDetailBloc>().add(GetTrainingDetailEvent(trainingId:Params(
            id:  trainingInformation.id
        )));
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
              companyName: trainingInformation.companyName,
                jobTitle: trainingInformation.name,
              imageUrl: trainingInformation.companyImgUrl,
              subDomainName: trainingInformation.subDomainName,
            ),
            IconTitle(iconPath: 'assets/icons/location.svg',
                title: 'location',description: '${trainingInformation.cityName} (on-site)'),
            IconTitle(iconPath: 'assets/icons/location.svg',
                title: 'cost',description: formatCurrency.format(trainingInformation.cost)),
            IconTitle(iconPath: 'assets/icons/location.svg',
                title: 'start date',
                description: trainingInformation.startDate
                    ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Posted on ${trainingInformation.postedDate}'),
            )
          ],
        ),
      ),
    );
  }
}
