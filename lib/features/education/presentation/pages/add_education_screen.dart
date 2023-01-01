import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/entities/education_params.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/course/presentation/bloc/course_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tieup/features/education/presentation/bloc/education_bloc.dart';

class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({Key? key}) : super(key: key);

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {
  TextEditingController fieldOfStudyController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<String> educationType = [
    'High School',
    'Bachelor Degree',
    'Diploma',
    'Master',
    'PHD',
    'Training Course'
  ];

  List<DropdownMenuItem<int>> domainItems() {
    List<DropdownMenuItem<int>> dropDownItems = [];
    for (int i = 0; i < educationType.length; i++) {
      var item = DropdownMenuItem(value: i, child: Text(educationType[i]));
      dropDownItems.add(item);
    }
    return dropDownItems;
  }

  final ImagePicker _picker = ImagePicker();

  File? imageFile;

  int? selectedEducationType;
  String startDate = '';
  String endDate = '';
  DateTime? start;
  DateTime? end;

  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Education Certificate'),
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),
      ),
      body: BlocListener<EducationBloc, EducationState>(
        listener: (context, state) {
          if (state is EducationAddedSuccessfully) {
            setState(() {
              startDate = '';
              endDate = '';
              selectedEducationType = null;
              gradeController.clear();
              fieldOfStudyController.clear();
              fromController.clear();
              imageFile = null;
            });
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Added Successfully"),
            ));
            context.read<EducationBloc>().add(GetUserEducationEvent());
            Navigator.pop(context);
          } else if (state is EducationLoading) {
            buildLoadingDialog(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 320,
                    height: 180,
                    child: GestureDetector(
                      onTap: () async {
                        var pickedImage = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (pickedImage != null) {
                          setState(() {
                            imageFile = File(pickedImage.path);
                          });
                        }
                      },
                      child: Container(
                        //margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor, width: 2),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                          child: (imageFile != null)
                              ? Image.file(imageFile!)
                              : Image.asset('assets/images/place_holder.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    child: Row(
                      children: [
                        const Text('Academy qualification'),
                        Spacer(),
                        DropdownButton<int>(
                          isExpanded: false,
                          value: selectedEducationType,
                          items: domainItems(),
                          onChanged: (value) {
                            setState(() {
                              selectedEducationType = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: fieldOfStudyController,
                    keyboardType: TextInputType.name,
                    //initialValue: state.personalInformation.fullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Field of study",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: fromController,
                    keyboardType: TextInputType.name,
                    //initialValue: state.personalInformation.fullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "From",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      //suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Grade :',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      SizedBox(
                        width: 80,
                        child: TextFormField(
                          autofocus: false,
                          controller: gradeController,
                          keyboardType: TextInputType.number,
                          //initialValue: state.personalInformation.fullName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'this field is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Start date'),
                      Text(startDate),
                      OutlinedButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now())
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
                  SizedBox(
                    height: 2.h,
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
                                  lastDate: DateTime.now())
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
                    height: 8.h,
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
                  DefaultButton(
                    press: () {
                      errors.clear();
                      if (selectedEducationType == null) {
                        errors.add("please select one of qualification");
                      }
                      if(gradeController.text.isNotEmpty)
                      {
                        if (int.parse(gradeController.text) > 100) {
                          errors.add("grade shouldn't be greater than 100");
                        }
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
                        context.read<EducationBloc>().add(AddUserEducationEvent(
                            params: EducationParams(
                                fieldOfStudy: fieldOfStudyController.text,
                                educationTypeId: selectedEducationType! + 1,
                                grade: gradeController.text,
                                from: fromController.text,
                                startDate: startDate,
                                endDate: endDate,
                                imageFile: imageFile)));
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

  @override
  void dispose() {
    fieldOfStudyController.dispose();
    fromController.dispose();
    gradeController.dispose();
    super.dispose();
  }
}
