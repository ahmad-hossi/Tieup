import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:tieup/features/cv/presentation/pages/exapmles/resume.dart';
import 'package:tieup/features/cv/presentation/pages/exapmles/resume2.dart';
import 'package:tieup/features/profile/presentation/bloc/profile_bloc.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  static const routeName = 'profile/resumeScreen';

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  PrintingInfo? printingInfo;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetUserProfileEvent());
    _init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> _init() async {
    final info = await Printing.info();
    setState(() {
      printingInfo = info;
    });
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your CV'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return PdfPreview(
              maxPageWidth: 700,
              build: (format) async{
                await Future.delayed(Duration(seconds: 1));
                return generateResume2(format,state.userProfile);
              },
              onShared: _showSharedToast,
              allowPrinting: false,
              canChangeOrientation: false,
            );
          } else if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
