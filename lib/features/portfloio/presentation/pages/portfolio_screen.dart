import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tieup/core/widgets/custom_suffix_icon.dart';
import 'package:tieup/core/widgets/default_button.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PortfolioScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  //TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/portfolio.svg',
                              width: 40.w,
                              height: 40.w,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            const Text('Portfolio',
                                style:
                                TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        const Text(
                          'Add your jobs and links of your social medias help companies'
                              'to know more about you',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12.h,),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                            hintText: 'Instagram.com/',
                            labelText: "Instagram",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/instagram.svg"),
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                            hintText: 'Telegram.org/',
                            labelText: "Telegram",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/telegram.svg"),
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                            hintText: 'Twitter.com/',
                            labelText: "Twitter",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/twitter.svg"),
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                            hintText: 'Facebook.com/',
                            labelText: "Facebook",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/facebook.svg"),
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                            hintText: 'Behance.com/',
                            labelText: "Behance",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/behance.svg"),
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                            hintText: 'Linkedin.com/in/',
                            labelText: "Linkedin",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/linkedin.svg"),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultButton(text: 'Save', press: () {}),
            )
          ],
        ),
      ),
    );
  }
}
