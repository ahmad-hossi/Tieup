import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/entities/work_experience_params.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/skill/domain/entities/sub_domain.dart';
import 'package:tieup/features/skill/presentation/Bloc/skill_bloc.dart';
import 'package:tieup/features/skill/presentation/widgets/add_skills_dialog.dart';
import 'package:tieup/features/experience/presentation/bloc/work_experience_bloc.dart';

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

  DateTime? start;
  DateTime? end;
  List<String> errors = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add work experience'),
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),
      ),
      body: BlocListener<WorkExperienceBloc, WorkExperienceState>(
        listener: (context, state) {
          if (state is WorkExperienceAddedSuccessfully) {
            setState(() {
              startDate = '';
              endDate = '';
              selectedSubDomain = const SubDomain(name: '', id: -1);
              jobTitleController.clear();
              companyNameController.clear();
              descriptionController.clear();
              Navigator.of(context, rootNavigator: true).pop();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Added Successfully"),
              ));
            });
            context.read<WorkExperienceBloc>().add(GetWorkExperienceEvent());
          } else if (state is WorkExperienceLoading) {
            buildLoadingDialog(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: jobTitleController,
                    keyboardType: TextInputType.name,
                    //initialValue: state.personalInformation.fullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required';
                      }
                      return null;
                    },
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
                                  firstDate: DateTime(1950),
                                  lastDate:  DateTime.now())
                              .then((value) => setState(() {
                                    start = value;
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
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now(),)
                              .then((value) => setState(() {
                                    end = value;
                                    endDate =
                                        DateFormat('yyyy/MM/dd').format(value!);
                                  }));
                        },
                        child: const Text('Select date'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 64,
                    child: ListView.builder(
                      itemBuilder: (_, index) => Text(
                        errors[index],
                        style: TextStyle(color: Colors.red),
                      ),
                      itemCount: errors.length,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  DefaultButton(
                    press: () {
                      errors.clear();
                      if (selectedSubDomain.id == -1 ) {
                        errors.add("please select job role");
                      }
                      if (start == null) {
                        errors.add("start date can't be empty");
                      }
                      if (start != null &&
                          end != null &&
                          (start?.difference(end!))! >
                              const Duration(days: 1)) {
                        errors.add("start can't be before end");
                      }
                      setState(() {});
                      if (errors.isNotEmpty) {
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        context.read<WorkExperienceBloc>().add(
                            AddWorkExperienceEvent(
                                params: WorkExperienceParams(
                                    jobTitle: jobTitleController.text,
                                    description: descriptionController.text,
                                    companyName: companyNameController.text,
                                    subDomainId:
                                        selectedSubDomain.id.toString(),
                                    startDate: startDate,
                                    endDate: endDate)));
                      }
                    },
                    text: 'Add',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
