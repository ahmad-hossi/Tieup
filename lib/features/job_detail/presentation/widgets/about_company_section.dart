import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/constants/font_style.dart';
import 'package:tieup/core/widgets/cashedImage.dart';
import 'package:tieup/features/company/presentation/bloc/company_bloc.dart';
import 'package:tieup/features/company/presentation/pages/profile.dart';

class AboutCompanySection extends StatelessWidget {
  const AboutCompanySection(
      {required this.companyName,
      required this.companyImageUrl,
      required this.companyDesc,
        required this.companyId,
      Key? key})
      : super(key: key);

  final String companyName;
  final String companyImageUrl;
  final String companyDesc;
  final int companyId;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12.w),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'About Company',
              style: CustomFontStyle.titleStyle,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.w),
              child: Row(
                children: [
                  CashedImage(
                    url: '$kBaseUrl/$companyImageUrl',
                    height: 38,
                    width: 38,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(companyName,style: TextStyle(fontSize: 22),)
                ],
              ),
            ),
            Text(
                companyDesc,
                softWrap: true),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: GestureDetector(
                onTap: () {
                  context.read<CompanyBloc>().add(
                      GetCompanyDetailEvent(
                          companyId:
                          companyId));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CompanyProfile(
                              companyName: companyName)));
                },
                child: Text(
                  'Know more',
                  style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ));
  }
}
