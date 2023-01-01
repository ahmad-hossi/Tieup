import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tieup/core/widgets/custom_suffix_icon.dart';
import 'package:tieup/core/widgets/default_button.dart';
import 'package:tieup/features/portfolio/data/models/portfolio_model.dart';
import 'package:tieup/features/portfolio/domain/entities/portfolio.dart';
import 'package:tieup/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:tieup/constants.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);
  static const routeName = '/profile/portfolio';

  @override
  State<PortfolioScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PortfolioScreen> {
  @override
  void initState() {
    context.read<PortfolioBloc>().add(GetUserPortfolioEvent());
    super.initState();
  }

  fillInformation(List<Portfolio> userPortfolio) {
    facebookController.text = userPortfolio
        .firstWhere((e) => e.type == 'facebook',
            orElse: () => PortfolioModel(type: '', url: 'facebook.com/'))
        .url;
    whatsappController.text = userPortfolio
        .firstWhere((e) => e.type == 'WhatsApp',
            orElse: () => PortfolioModel(type: '', url: 'whatsApp.com/'))
        .url;
    githubController.text = userPortfolio
        .firstWhere((e) => e.type == 'github',
            orElse: () => PortfolioModel(type: '', url: 'github.com/'))
        .url;
    linkedinController.text = userPortfolio
        .firstWhere((e) => e.type == 'linkedin',
            orElse: () => PortfolioModel(type: '', url: 'linkedin.com/in/'))
        .url;
    behanceController.text = userPortfolio
        .firstWhere((e) => e.type == 'Behance',
            orElse: () => PortfolioModel(type: '', url: 'behance.com/'))
        .url;
    instagramController.text = userPortfolio
        .firstWhere((e) => e.type == 'Instagram',
            orElse: () => PortfolioModel(type: '', url: 'instagram.com/'))
        .url;
    twitterController.text = userPortfolio
        .firstWhere((e) => e.type == 'Twitter',
            orElse: () => PortfolioModel(type: '', url: 'twitter.com/'))
        .url;
    telegramController.text = userPortfolio
        .firstWhere((e) => e.type == 'Telegram',
            orElse: () => PortfolioModel(type: '', url: 'telegram.org/'))
        .url;
  }

  TextEditingController whatsappController =
      TextEditingController(text: 'whatsapp.com/');
  TextEditingController telegramController =
      TextEditingController(text: 'telegram.org/');
  TextEditingController facebookController = TextEditingController(
    text: 'facebook.com/',
  );
  TextEditingController githubController = TextEditingController(
    text: 'github.com/',
  );
  TextEditingController behanceController = TextEditingController(
    text: 'Behance.com/',
  );
  TextEditingController instagramController = TextEditingController(
    text: 'instagram.com/',
  );
  TextEditingController linkedinController = TextEditingController(
    text: 'linkedin.com/in/',
  );
  TextEditingController twitterController = TextEditingController(
    text: 'twitter.com/',
  );

  bool enableEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Portfolio'),
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocListener<PortfolioBloc, PortfolioState>(
              listener: (context, state) {
                if (state is PortfolioLoading) {
                  buildLoadingDialog(context);
                } else if (state is PortfolioFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.errorMessage),
                  ));
                  Navigator.of(context, rootNavigator: true).pop();
                } else if (state is PortfolioLoaded) {
                  fillInformation(state.userPortfolio);
                  Navigator.of(context, rootNavigator: true).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('updated successfully')));
                }
              },
              child: Expanded(
                child: SingleChildScrollView(
                  child: Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      const Text(
                        'Add your jobs and links of your social medias help companies'
                        'to know more about you',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFormField(
                        enabled: enableEditing,
                        controller: whatsappController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: "Whatsapp",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: CustomSuffixIcon(
                              svgIcon: "assets/icons/instagram.svg"),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      TextFormField(
                        enabled: enableEditing,
                        controller: telegramController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: "Telegram",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: CustomSuffixIcon(
                              svgIcon: "assets/icons/telegram.svg"),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFormField(
                        enabled: enableEditing,
                        controller: instagramController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: "Instagram",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: CustomSuffixIcon(
                              svgIcon: "assets/icons/instagram.svg"),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      TextFormField(
                        enabled: enableEditing,
                        controller: twitterController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: "Twitter",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: CustomSuffixIcon(
                              svgIcon: "assets/icons/twitter.svg"),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      TextFormField(
                        enabled: enableEditing,
                        controller: facebookController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: "Facebook",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: CustomSuffixIcon(
                              svgIcon: "assets/icons/facebook.svg"),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      TextFormField(
                        enabled: enableEditing,
                        controller: behanceController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: "Behance",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: CustomSuffixIcon(
                              svgIcon: "assets/icons/behance.svg"),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      TextFormField(
                        enabled: enableEditing,
                        controller: linkedinController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: "Linkedin",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: CustomSuffixIcon(
                              svgIcon: "assets/icons/linkedin.svg"),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      TextFormField(
                        enabled: enableEditing,
                        controller: githubController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: "Github",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: CustomSuffixIcon(
                              svgIcon: "assets/icons/linkedin.svg"),
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
                text: enableEditing ? 'Save' : 'Edit',
                press: () {
                  if (enableEditing) {
                    context.read<PortfolioBloc>().add(UpdateUserPortfolioEvent(
                        userPortfolio: getPortfolioInformation()));
                  }
                  setState(() {
                    enableEditing = !enableEditing;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> getPortfolioInformation() {
    List<Map<String, dynamic>> requestBody = [];
    if (facebookController.text.isNotEmpty) {
      requestBody
          .add({'type': 'facebook', 'url': facebookController.text.toString()});
    }
    if (whatsappController.text.isNotEmpty) {
      requestBody
          .add({'type': 'WhatsApp', 'url': whatsappController.text.toString()});
    }
    if (githubController.text.isNotEmpty) {
      requestBody
          .add({'type': 'github', 'url': githubController.text.toString()});
    }
    if (linkedinController.text.isNotEmpty) {
      requestBody
          .add({'type': 'linkedin', 'url': linkedinController.text.toString()});
    }
    if (behanceController.text.isNotEmpty) {
      requestBody
          .add({'type': 'Behance', 'url': behanceController.text.toString()});
    }
    if (instagramController.text.isNotEmpty) {
      requestBody.add(
          {'type': 'Instagram', 'url': instagramController.text.toString()});
    }
    if (twitterController.text.isNotEmpty) {
      requestBody
          .add({'type': 'Twitter', 'url': twitterController.text.toString()});
    }
    if (telegramController.text.isNotEmpty) {
      requestBody
          .add({'type': 'Telegram', 'url': telegramController.text.toString()});
    }
    return requestBody;
  }
}
