import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/entities/course_params.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/skill/domain/entities/sub_domain.dart';
import 'package:tieup/features/skill/presentation/Bloc/skill_bloc.dart';
import 'package:tieup/features/skill/presentation/widgets/add_skills_dialog.dart';
import 'package:tieup/features/course/presentation/bloc/course_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({Key? key}) : super(key: key);

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController fromController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<String> errors = [];
  DateTime? start;

  File? imageFile;
  final _formKey = GlobalKey<FormState>();
  SubDomain selectedSubDomain = const SubDomain(name: '', id: -1);
  String dateOfAchievement = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),
      ),
      body: BlocListener<CourseBloc, CourseState>(
        listener: (context, state) {
          if (state is CourseAddedSuccessfully) {
            setState(() {
              dateOfAchievement = '';
              selectedSubDomain = const SubDomain(name: '', id: -1);
              nameController.clear();
              fromController.clear();
            });
            Future.delayed(Duration(milliseconds: 500),() =>
                Navigator.of(context,rootNavigator: true).pop());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Added Successfully"),
            ));
            context.read<CourseBloc>().add(GetCoursesEvent());
          } else if (state is CourseLoading) {
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
                  GestureDetector(
                    onTap: () async {
                      var pickedImage =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (pickedImage != null) {
                        setState(() {
                          imageFile = File(pickedImage.path);
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
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
                  SizedBox(
                    height: 8.h,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    //initialValue: state.personalInformation.fullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Course name",
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
                      Text(
                        'In :',
                        style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          selectedSubDomain.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      OutlinedButton(
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
                          child: Text('Select domain')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Date of achievement'),
                      Text(dateOfAchievement),
                      OutlinedButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now())
                              .then((value) => setState(() {
                                start = value;
                                    dateOfAchievement =
                                        DateFormat('yyyy/MM/dd').format(value!);
                                  }));
                        },
                        child: const Text('Select date'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  DefaultButton(
                    press: () {
                      errors.clear();
                      if (selectedSubDomain.id == -1 ) {
                        errors.add("please select job role");
                      }
                      if (start == null) {
                        errors.add("achievement date can't be empty");
                      }
                      setState(() {});
                      if (errors.isNotEmpty) {
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                      context.read<CourseBloc>().add(AddCourseEvent(
                          params: CourseParams(
                              name: nameController.text,
                              subDomainId: selectedSubDomain.id,
                              from: fromController.text,
                              dateOfAchievement: dateOfAchievement,
                              imageFile: imageFile!)));}
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
    nameController.dispose();
    fromController.dispose();
    super.dispose();
  }
}
