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

  DropdownButton<int> dropDown() {
    List<DropdownMenuItem<int>> dropDownItems = [];
    for (int i = 0 ; i < cities.length ; i++) {
      var item = DropdownMenuItem(value: i, child: Text(cities[i]));
      dropDownItems.add(item);
    }
    return DropdownButton<int>(
      isExpanded: true,
      //itemHeight: 65.0,
      // isExpanded: true ,
      // hint: Text('chose city',),
      value: selectedCityId,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCityId = value!;
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
        child: BlocConsumer<PersonalInformationBloc, PersonalInformationState>(
          listener: (_,state){
            if(state is PersonalInformationLoaded){
              nameController.text =  state.personalInformation.fullName;
              addressController.text = state.personalInformation.address ?? '';
              phoneController.text = state.personalInformation.phone ;
              nameController.text = state.personalInformation.fullName;
              selectedCityId = state.personalInformation.cityId;
              birthday = (state.personalInformation.birthday.toString() == 'null' ? ' ' :
              state.personalInformation.birthday.toString());
              if(state.personalInformation.gender != null){
                if(state.personalInformation.gender == 'male'){
                  selectedGender = Gender.male;
                }else{
                  selectedGender = Gender.female;
                }
              }
              openToWork = state.personalInformation.openToWork == 1? true : false;
              summaryController.text = state.personalInformation.summary ?? '';
            }
          },
          builder: (context, state) {
            if (state is PersonalInformationLoading) {
              return const CircularProgressIndicator();
            } else if (state is PersonalInformationFailed) {
              return Text(state.errorMessage);
            } else if (state is PersonalInformationLoaded) {
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
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
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            //initialValue: state.personalInformation.fullName,
                            //validator: (value) {},
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
                          //todo : add military service section
                          //military  service
                          SizedBox(
                            height: 8.h,
                          ),
                          TextFormField(
                            controller: summaryController,
                            keyboardType: TextInputType.text,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(
                        text: 'Save',
                        press: () {
                          print(nameController.text);
                          print(phoneController.text);
                          print(birthday);
                          print(selectedCityId);
                          print(selectedGender.toString().substring(7));
                          print(addressController.text);
                          print(summaryController.text);
                          print(openToWork);
                          context.read<PersonalInformationBloc>().add(
                                  UpdatePersonalInformationEvent(
                                      personalInformationParams:
                                          PersonalInformationParams(
                                fullName: nameController.text,
                                phoneNumber: phoneController.text,
                                birthday: birthday,
                                cityId: selectedCityId,
                                gender: selectedGender?.toString().substring(7),
                                address: addressController.text,
                                summary: summaryController.text,
                                //openToWork: int.parse(openToWork.toString()),
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
      ),
    );
  }
}
