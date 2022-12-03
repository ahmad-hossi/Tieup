import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/Home/presentation/screens/home_screen.dart';
import 'package:tieup/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:tieup/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              // primarySwatch: const MaterialColor(0x3E58CC,<int,Color>{
              //   400:Color(0x00455fcf),
              //   300:Color(0x006378d5),
              //   200:Color(0x009aa8e4),
              //   100:Color(0x00d4dbf4),
              // }),
            primaryColor: kPrimaryColor,
            //useMaterial3: true,
            fontFamily: 'Gilroy'
          ),
          routes: routes,
          initialRoute: LoginScreen.routeName,
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/images/logo.png')),
              const CircularProgressIndicator(color: Colors.indigo),
            ],
          )
    );
  }
}

