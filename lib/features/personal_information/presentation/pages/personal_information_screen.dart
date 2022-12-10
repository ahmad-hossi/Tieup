import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tieup/core/constants/enums.dart';
import 'package:tieup/core/entities/update_pesrsonal_information_params.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/personal_information/presentation/bloc/personal_information_bloc.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {

  @override
  void initState() {
    context.read<PersonalInformationBloc>().add(GetPersonalInformationEvent());
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  //TextEditingController nameController = TextEditingController();

  String birthday = '';
  String? selectedCity ;
  Gender? selectedGender ;
  bool openToWork = false;
  String fullName = '';
  String phoneNumber = '';

  DropdownButton<String> dropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String city in cities) {
      var item = DropdownMenuItem(value: city, child: Text(city));
      dropDownItems.add(item);
    }
    return DropdownButton<String>(
      isExpanded: true,
      //itemHeight: 65.0,
      // isExpanded: true ,
      // hint: Text('chose city',),
      value: selectedCity,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCity = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
        child: BlocBuilder<PersonalInformationBloc, PersonalInformationState>(
          builder: (context, state) {
            if(state is PersonalInformationLoading){
              return const CircularProgressIndicator();
            }else if(state is PersonalInformationFailed){
              return Text(state.errorMessage);
            }else if(state is PersonalInformationLoaded){
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
                                    'assets/icons/profile.svg',
                                    width: 40.w,
                                    height: 40.w,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  const Text('Personal information',
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              const Text(
                                'Add all your personal information something very important',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              TextFormField(
                                //controller: nameController,
                                keyboardType: TextInputType.name,
                                initialValue: state.personalInformation.fullName,
                                onChanged: (newValue) => setState(() {
                                  fullName = newValue;
                                }),
                                //validator: (value) {},
                                decoration: const InputDecoration(
                                  labelText: "full name",
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              TextFormField(
                                //controller: nameController,
                                keyboardType: TextInputType.phone,
                                initialValue: state.personalInformation.phone,
                                onSaved: (newValue) => setState(() {
                                  phoneNumber = newValue!;
                                }),
                                //validator: (value) {},
                                decoration: const InputDecoration(
                                  labelText: "phone number",
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                //onSaved: (newValue) => email = newValue ?? '',
                                //validator: (value) {},
                                decoration: const InputDecoration(
                                  labelText: "home address",
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              const Text('City'),
                              dropDown(),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Birthday'),
                                  Text(birthday),
                                  OutlinedButton(
                                    onPressed: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2001),
                                          lastDate: DateTime(2050))
                                          .then((value) => setState(() {
                                        birthday = DateFormat('yyyy/MM/dd')
                                            .format(value!);
                                      }));
                                    },
                                    child: const Text('Select date'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Gender',
                                    //style: TextStyle(fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    width: 42.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGender = Gender.male;
                                      });
                                    },
                                    child: Container(
                                      width: 80.w,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: selectedGender == Gender.male
                                            ? kPrimaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20.0),
                                        border: Border.all(color: kSecondaryColor),
                                      ),
                                      child: Text(
                                        'Male',
                                        style: TextStyle(
                                            color: selectedGender == Gender.male
                                                ? Colors.white
                                                : Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGender = Gender.female;
                                      });
                                    },
                                    child: Container(
                                      width: 80.w,
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: selectedGender == Gender.female
                                            ? kPrimaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20.0),
                                        border: Border.all(color: kSecondaryColor),
                                      ),
                                      child: Text(
                                        'Female',
                                        style: TextStyle(
                                            color: selectedGender == Gender.female
                                                ? Colors.white
                                                : Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Open to work ?'),
                                  Checkbox(
                                      value: openToWork,
                                      onChanged: (value) {
                                        setState(() {
                                          openToWork = value!;
                                        });
                                      }),
                                ],
                              ),
                              //military  service
                              SizedBox(
                                height: 8.h,
                              ),
                              TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                //onSaved: (newValue) => email = newValue ?? '',
                                //validator: (value) {},
                                decoration: const InputDecoration(
                                  labelText: "Summary",
                                  //hintText: "Enter your email",
                                  // If  you are using latest version of flutter then lable text and hint text shown like this
                                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(text: 'Save', press: () {
                      print(fullName);
                      context.read<PersonalInformationBloc>().add(UpdatePersonalInformationEvent(
                            personalInformationParams: PersonalInformationParams(
                               fullName: fullName,
                              phoneNumber: phoneNumber,
                            )
                      ));
                    }),
                  )
                ],
              );
            }else {
              return Container(color: Colors.red,);
            }

          },
        ),
      ),
    );
  }
}
