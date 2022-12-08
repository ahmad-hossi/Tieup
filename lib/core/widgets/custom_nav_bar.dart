import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/core/constants/custom_icon.dart';
import 'package:tieup/core/constants/enums.dart';
import 'package:tieup/features/profile/presentation/pages/profile_screen.dart';


class CustomNavBar extends StatelessWidget {
  CustomNavBar({Key? key, required this.menuState}) : super(key: key);
  MenuState menuState;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 2)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  CustomIcons.home,
                  color: kPrimaryColor,
                ),
              ),
              Text('Home')
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  CustomIcons.job,
                  color: kPrimaryColor,
                ),
              ),
              Text('Applied')
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileScreen()));
                },
                icon: SvgPicture.asset(
                  CustomIcons.profile,
                  color: kPrimaryColor,
                ),
              ),
              Text('Profile')
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  CustomIcons.settings,
                  color: kPrimaryColor,
                ),
              ),
              Text('Settings')
            ],
          ),

        ],
      ),
    );
  }
}
