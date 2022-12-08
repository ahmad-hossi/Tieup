import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/personal_information/presentation/pages/personal_information_screen.dart';
import 'package:tieup/features/portfloio/presentation/pages/portfolio_screen.dart';
import 'package:tieup/features/profile/presentation/widgets/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProfilePic(),
              SizedBox(
                height: 12.h,
              ),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/profile.svg'),
                  title: Text(
                    'Personal information',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: SvgPicture.asset('assets/icons/right-arrow.svg',width: 28,),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PersonalInformationScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/portfolio.svg',width: 36,),
                  title: Text(
                    'Portfolio',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: SvgPicture.asset('assets/icons/right-arrow.svg',width: 28,),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PortfolioScreen()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/profile.svg'),
                  title: Text(
                    'Education',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: SvgPicture.asset('assets/icons/right-arrow.svg',width: 28,),
                ),
              ),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/profile.svg'),
                  title: const Text(
                    'Experience',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: SvgPicture.asset('assets/icons/right-arrow.svg',width: 28,),
                ),
              ),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/profile.svg'),
                  title: const Text(
                    'Languages',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: SvgPicture.asset('assets/icons/right-arrow.svg',width: 28,),
                ),
              ),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/profile.svg'),
                  title: const Text(
                    'Skills',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: SvgPicture.asset('assets/icons/right-arrow.svg',width: 28,),
                ),
              ),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/profile.svg'),
                  title: const Text(
                    'Upload cv',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: SvgPicture.asset('assets/icons/right-arrow.svg',width: 28,),
                ),
              ),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/profile.svg'),
                  title: const Text(
                    'Motivation latter',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: SvgPicture.asset('assets/icons/right-arrow.svg',width: 28,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
