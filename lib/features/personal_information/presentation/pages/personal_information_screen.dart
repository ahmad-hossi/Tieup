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

  static const routeName = '/profile/personalInformation';

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

  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String birthday = '';
  int? selectedCityId;
  Gender? selectedGender;
  bool openToWork = false;
  String? selectedMilitaryService;

  DropdownButton<int> citiesDropDown() {
    List<DropdownMenuItem<int>> dropDownItems = [];
    for (int i = 0; i < cities.length; i++) {
      var item = DropdownMenuItem(value: i, child: Text(cities[i]));
      dropDownItems.add(item);
    }
    return DropdownButton<int>(
      alignment: Alignment.center,
      isExpanded: true,
      value: selectedCityId,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCityId = value!;
        });
      },
    );
  }

  DropdownButton<String> militaryServiceDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < militaryService.length; i++) {
      var item = DropdownMenuItem(
          value: militaryService[i], child: Text(militaryService[i]));
      dropDownItems.add(item);
    }
    return DropdownButton<String>(
      alignment: Alignment.center,
      isExpanded: true,
      value: selectedMilitaryService,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedMilitaryService = value!;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Personal information'),
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),
      ),
      body: BlocConsumer<PersonalInformationBloc, PersonalInformationState>(
        listener: (_, state) {
          if (state is PersonalInformationLoaded) {
            nameController.text = state.personalInformation.fullName;
            addressController.text = state.personalInformation.address ?? '';
            phoneController.text = state.personalInformation.phone;
            selectedCityId = state.personalInformation.cityId != null ?
            state.personalInformation.cityId! - 1 : null;
            birthday = (state.personalInformation.birthday.toString() == 'null'
                ? ' '
                : state.personalInformation.birthday.toString());
            selectedMilitaryService = state.personalInformation.militaryService;
            if (state.personalInformation.gender != null) {
              if (state.personalInformation.gender == 'male') {
                selectedGender = Gender.male;
              } else {
                selectedGender = Gender.female;
              }
            }
            print(state.personalInformation.openToWork);
            openToWork =
                state.personalInformation.openToWork == 1 ? true : false;
            summaryController.text = state.personalInformation.summary ?? '';
          }
          if (state is PersonalInformationUpdatedSuccessfully) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Updated Successfully"),
            ));
          }
        },
        builder: (context, state) {
          if (state is PersonalInformationLoading) {
            return Center(child: const CircularProgressIndicator());
          } else if (state is PersonalInformationFailed) {
            return Text(state.errorMessage);
          } else if (state is PersonalInformationLoaded ||
              state is PersonalInformationUpdatedSuccessfully) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: "full name",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            //validator: (value) {},
                            decoration: const InputDecoration(
                              labelText: "phone number",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextFormField(
                            controller: addressController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: "home address",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          const Text('City'),
                          citiesDropDown(),
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
                                          firstDate: DateTime(1960),
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
                          if (selectedGender == Gender.male)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('military service :'),
                                SizedBox(
                                    width: 120.w,
                                    child: militaryServiceDropDown())
                              ],
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Open to work ?'),
                              Checkbox(
                                  value: openToWork,
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      openToWork = value!;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextFormField(
                            minLines: 3,
                            maxLines: 6,
                            controller: summaryController,
                            keyboardType: TextInputType.multiline,
                            //validator: (value) {},
                            decoration: const InputDecoration(
                              labelText: "Summary",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultButton(
                      text: 'Save',
                      press: () {
                        // print(nameController.text);
                        // print(phoneController.text);
                        // print(birthday);
                        // print(selectedCityId);
                        // print(selectedGender.toString().substring(7));
                        // print(addressController.text);
                        // print(summaryController.text);
                        // print(openToWork);
                        context.read<PersonalInformationBloc>().add(
                                UpdatePersonalInformationEvent(
                                    personalInformationParams:
                                        PersonalInformationParams(
                              fullName: nameController.text,
                              phoneNumber: phoneController.text,
                              birthday: birthday,
                              cityId: selectedCityId! + 1,
                              gender: selectedGender?.toString().substring(7),
                              address: addressController.text,
                              summary: summaryController.text,
                              militaryService: selectedGender != null
                                  ? selectedMilitaryService
                                  : null,
                              openToWork: openToWork,
                            )));
                      }),
                )
              ],
            );
          } else {
            return Container(
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}
