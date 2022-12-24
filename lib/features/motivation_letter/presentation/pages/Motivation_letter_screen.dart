import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/motivation_letter/presentation/bloc/motivation_letter_bloc.dart';

class MotivationLetterScreen extends StatefulWidget {
  const MotivationLetterScreen({Key? key}) : super(key: key);

  static const routeName = '/profile/coverLetter';

  @override
  State<MotivationLetterScreen> createState() => _MotivationLetterScreenState();
}

class _MotivationLetterScreenState extends State<MotivationLetterScreen> {
  late TextEditingController letterController;

  @override
  void initState() {
    letterController = TextEditingController();
    context.read<MotivationLetterBloc>().add(GetMotivationLetterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cover Letter'),
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
        child: BlocListener<MotivationLetterBloc, MotivationLetterState>(
          listener: (context, state) {
            if (state is MotivationLetterLoading) {
              buildLoadingDialog(context);
            } else if (state is MotivationLetterFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            } else if (state is MotivationLetterLoaded) {
              Navigator.of(context, rootNavigator: true).pop();
              letterController.text = state.motivationLetter;
            }
          },
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
                        padding: EdgeInsets.all(8.w),
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor, width: 2),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Expanded(
                          child: TextField(
                            controller: letterController,
                            decoration: InputDecoration(
                                labelText: 'Edit your Cover Letter'),
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
                    press: () {
                      context.read<MotivationLetterBloc>().
                      add(UpdateMotivationLetterEvent(text: letterController.text));
                    },
                    isEnable: true,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
