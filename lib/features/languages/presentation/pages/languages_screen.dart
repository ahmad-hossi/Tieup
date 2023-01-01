import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/languages/presentation/bloc/languages_bloc.dart';
import 'package:tieup/features/languages/presentation/widgets/add_language_dialog.dart';
import 'package:flutter_svg/svg.dart';

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
      appBar: AppBar(title: const Text('Languages'),elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: BlocConsumer<LanguagesBloc, LanguagesState>(
          listener: (context, state) {
            if (state is LanguageAddedSuccessfully) {
              context.read<LanguagesBloc>().add(GetLanguagesEvent());
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('added successfully'),
                ),
              );
            } else if (state is LanguageAddedFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('something went error'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LanguagesLoading) {
              return const CircularProgressIndicator();
            } else if (state is LanguagesFailed) {
              return Text(state.errorMessage);
            } else if (state is LanguagesLoaded) {
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
                          const Text(
                            'Add your languages help companies'
                            ' to know more about you',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          ...List.generate(
                            state.languages.length,
                            (index) => Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: kPrimaryColor,width: 2)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(state.languages[index].languageName),
                                  RatingBar.builder(
                                    updateOnDrag: false,
                                    ignoreGestures: true,
                                    initialRating:
                                        state.languages[index].level.toDouble(),
                                    minRating: 0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
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
                      text: 'Add',
                      press: () {
                        showDialog(
                            context: context,
                            builder: (_) => AddLanguagesDialog());
                      },
                    ),
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
