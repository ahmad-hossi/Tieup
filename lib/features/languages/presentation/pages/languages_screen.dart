import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/languages/presentation/bloc/languages_bloc.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  static const routeName = '/profile/languages';

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenScreenState();
}

class _LanguagesScreenScreenState extends State<LanguagesScreen> {

  @override
  void initState() {
    context.read<LanguagesBloc>().add(GetLanguagesEvent());
    super.initState();
  }

  double englishRate = 1;
  late double englishInitialRate = 0;
  double arabicRate = 2;
  late double arabicInitialRate = 0;
  double frenchRate = 3;
  late double frenchInitialRate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
        child: BlocBuilder<LanguagesBloc, LanguagesState>(
          builder: (context, state) {
            if (state is LanguagesLoading) {
              return const CircularProgressIndicator();
            } else if (state is LanguagesFailed) {
              return Text(state.errorMessage);
            } else if (state is LanguagesLoaded) {
              // englishInitialRate =
              //     state.languages.indexWhere((e) => e.languageId == 1) == -1 ? 0 :
              //     state.[].level;
              // arabicInitialRate =
              //     state.languages.firstWhere((e) => e.languageId == 2).level;
              // frenchInitialRate =
              //     state.languages.firstWhere((e) => e.languageId == 3).level;
              return Column(
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
                              const Text('Languages',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
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
                          SizedBox(
                            height: 12.h,
                          ),
                          ...List.generate(
                            state.languages.length,
                            (index) => Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kPrimaryColor)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(state.languages[index].languageName),
                                  RatingBar.builder(
                                    initialRating: state.languages[index].level,
                                    minRating: 0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        arabicRate = rating;
                                      });
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(
                        text: 'Save',
                        press: () {},
                        isEnable: ((englishInitialRate != englishRate) ||
                            (arabicInitialRate != arabicRate) ||
                            (frenchInitialRate != frenchRate))),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
