import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tieup/core/entities/work_experience_params.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/add_skills/domain/entities/sub_domain.dart';
import 'package:tieup/features/add_skills/presentation/Bloc/skill_bloc.dart';
import 'package:tieup/features/add_skills/presentation/widgets/add_skills_dialog.dart';
import 'package:tieup/features/experience/presentation/bloc/work_experience_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddWorkExperienceScreen extends StatefulWidget {
  const AddWorkExperienceScreen({Key? key}) : super(key: key);

  @override
  State<AddWorkExperienceScreen> createState() =>
      _AddWorkExperienceScreenState();
}

class _AddWorkExperienceScreenState extends State<AddWorkExperienceScreen> {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  SubDomain selectedSubDomain = const SubDomain(name: '', id: -1);
  String startDate = '';
  String endDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<WorkExperienceBloc, WorkExperienceState>(
        listener: (context, state) {
          if (state is WorkExperienceAddedSuccessfully) {
            print('hi');
            setState(() {
              startDate = '';
              endDate = '';
              selectedSubDomain = const SubDomain(name: '', id: -1);
              jobTitleController.clear();
              companyNameController.clear();
              descriptionController.clear();
              Navigator.of(context, rootNavigator: true).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Added Successfully"),
              ));
            });
          } else if (state is WorkExperienceLoading) {
            showDialog(
              barrierDismissible: false,
                context: context,
                builder: (_) => Dialog(
                  insetPadding: EdgeInsets.symmetric(horizontal: 100),
                      child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Center(child: CircularProgressIndicator())),
                    ));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/experience.svg',
                        width: 40.w,
                        height: 40.w,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      const Text('Work Experience',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                TextFormField(
                  controller: jobTitleController,
                  keyboardType: TextInputType.name,
                  //initialValue: state.personalInformation.fullName,
                  //validator: (value) {},
                  decoration: const InputDecoration(
                    labelText: "Job title",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  autofocus: false,
                  controller: companyNameController,
                  keyboardType: TextInputType.name,
                  //initialValue: state.personalInformation.fullName,
                  //validator: (value) {},
                  decoration: const InputDecoration(
                    labelText: "Company",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    //suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextButton(
                    autofocus: false,
                    onPressed: () {
                      context.read<SkillBloc>().add(GetDomainsEvent());
                      showDialog(
                        // barrierDismissible: false,
                        context: context,
                        builder: (_) {
                          return AddSkillsDialog();
                        },
                      ).then((value) {
                        setState(() {
                          selectedSubDomain = value;
                        });
                      });
                    },
                    child: Text('add job role')),
                Text(selectedSubDomain.name),
                TextFormField(
                  autofocus: false,
                  minLines: 3,
                  maxLines: 5,
                  controller: descriptionController,
                  keyboardType: TextInputType.name,
                  //initialValue: state.personalInformation.fullName,
                  //validator: (value) {},
                  decoration: const InputDecoration(
                    labelText: "Description",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    //suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('start Date'),
                    Text(startDate),
                    OutlinedButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2050))
                            .then((value) => setState(() {
                                  startDate =
                                      DateFormat('yyyy/MM/dd').format(value!);
                                }));
                      },
                      child: const Text('Select date'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('End Date'),
                    Text(endDate),
                    OutlinedButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2050))
                            .then((value) => setState(() {
                                  endDate =
                                      DateFormat('yyyy/MM/dd').format(value!);
                                }));
                      },
                      child: const Text('Select date'),
                    ),
                  ],
                ),
                DefaultButton(
                  press: () {
                    context.read<WorkExperienceBloc>().add(
                        AddWorkExperienceEvent(
                            params: WorkExperienceParams(
                                jobTitle: jobTitleController.text,
                                description: descriptionController.text,
                                companyName: companyNameController.text,
                                subDomainId: selectedSubDomain.id.toString(),
                                startDate: startDate,
                                endDate: endDate)));
                  },
                  text: 'Add',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}