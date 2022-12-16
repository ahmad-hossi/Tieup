

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/motivation_letter/presentation/bloc/motivation_letter_bloc.dart';


class MotivationLetterScreen extends StatefulWidget {
  const MotivationLetterScreen({Key? key}) : super(key: key);

  @override
  State<MotivationLetterScreen> createState() => _MotivationLetterScreenState();
}

class _MotivationLetterScreenState extends State<MotivationLetterScreen> {
 late TextEditingController letterController;


  @override
  void initState() {
    letterController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
        child: BlocBuilder<MotivationLetterBloc, MotivationLetterState>(
          builder: (context, state) {
            if (state is MotivationLetterLoading) {
              return const CircularProgressIndicator();
            } else if (state is MotivationLetterFailed) {
              return Text(state.errorMessage);
            } else if (state is MotivationLetterLoaded) {
              //letterController.text = state.motivationLetter;
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
                              Container(
                                height: 300,
                                color: Colors.red,
                                child: const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Enter Message'),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    expands: true, // <-- SEE HERE
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
                        isEnable: true,)
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
