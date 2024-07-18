/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:tieup/features/course/domain/entities/course.dart';
import 'package:tieup/features/education/domain/entities/education.dart';
import 'package:tieup/features/experience/domain/entities/experience.dart';
import 'package:tieup/features/languages/domain/entities/language.dart';
import 'package:tieup/features/portfolio/domain/entities/portfolio.dart';
import 'package:tieup/features/profile/domain/entities/profile.dart';
import 'package:tieup/features/skill/domain/entities/skill.dart';

PdfColor green = PdfColor.fromInt(0XFF3E58CC);
const PdfColor lightGreen = PdfColor.fromInt(0XFF3E58aa);
const sep = 120.0;

Future<Uint8List> generateResume2(
    PdfPageFormat format, Profile userProfile) async {
  final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');


  final fullName = userProfile.fullName;
  final email = userProfile.email;
  final summary = userProfile.summary ?? '';
  final cityName = userProfile.cityName ?? '';
  final phone = userProfile.phone;
  final List<Skill> skills = userProfile.skills;
  final List<Language> languages = userProfile.languages;
  final List<Portfolio> portfolios = userProfile.portfolios.sublist(0,2);
  final List<Experience> experience = userProfile.experiences;
  final List<Course> courses = userProfile.courses;
  final List<Education> educations = userProfile.educations;

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/profile_image.jpg'))
        .buffer
        .asUint8List(),
  );

  final phoneIcon = await rootBundle.loadString('assets/icons/phone.svg');
  final mailIcon = await rootBundle.loadString('assets/icons/Mail.svg');
  final locationIcon = await rootBundle.loadString('assets/icons/location.svg');


  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partitions(
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            pw.Partition(
                width: pageTheme.pageFormat.availableWidth / 2.6,
                child:
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 16),
                  //color: PdfColors.amber,
                  child: pw.Column(
                    mainAxisSize: pw.MainAxisSize.max,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: <pw.Widget>[
                      pw.SizedBox(height: 24),
                      pw.Align(
                        alignment: pw.Alignment.center,
                        child:  pw.SizedBox(
                          width: 150,
                          height: 150,
                          child: pw.Stack(
                              fit: pw.StackFit.expand,
                              alignment: pw.Alignment.center,
                              children: [
                                pw.ClipOval(
                                  child: pw.Container(
                                    width: 130,
                                    height: 130,
                                    color: PdfColors.white,
                                  ),
                                ),
                                pw.ClipOval(
                                    child: pw.Image(profileImage,
                                        width: 140,
                                        height: 140,
                                        alignment: pw.Alignment.center)),
                              ]),
                        ),
                      ),
                      pw.SizedBox(height: 22),
                      pw.Text(
                        'CONTACT',
                        style: pw.TextStyle(
                            fontSize: 22,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white),
                      ),
                      pw.Container(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4),
                          width: double.infinity,
                          height: 2,
                          color: PdfColors.white),
                      pw.SizedBox(height: 10),
                      pw.Row(children: [
                        pw.SvgImage(svg: phoneIcon,colorFilter: PdfColors.white,height: 28,width: 28),
                        pw.SizedBox(width: 8),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Phone',style: pw.TextStyle(color: PdfColors.white,fontWeight: pw.FontWeight.bold)),
                              pw.Text(phone,style: pw.TextStyle(color: PdfColors.white)),
                            ])
                      ]),
                      pw.SizedBox(height: 10),
                      pw.Row(children: [
                        pw.SvgImage(svg: mailIcon,colorFilter: PdfColors.white,height: 28,width: 28),
                        pw.SizedBox(width: 8),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Mail',style: pw.TextStyle(color: PdfColors.white,fontWeight: pw.FontWeight.bold)),
                              pw.Text(email,style: pw.TextStyle(color: PdfColors.white),),
                            ])
                      ]),
                      pw.SizedBox(height: 10),
                      pw.Row(children: [
                        pw.SvgImage(svg: locationIcon,colorFilter: PdfColors.white,height: 28,width: 28),
                        pw.SizedBox(width: 8),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Country',style: pw.TextStyle(color: PdfColors.white,fontWeight: pw.FontWeight.bold)),
                              pw.Text('$cityName , Syria',style: pw.TextStyle(color: PdfColors.white)),
                            ])
                      ]),
                      pw.SizedBox(height: 18),
                      pw.Text(
                        'SKILLS',
                        style: pw.TextStyle(
                            fontSize: 22,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white),
                      ),
                      pw.Container(
                          padding: pw.EdgeInsets.symmetric(vertical: 4),
                          width: double.infinity,
                          height: 2,
                          color: PdfColors.white),
                      pw.SizedBox(height: 10),
                      pw.Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          direction: pw.Axis.horizontal,
                          children: [
                            for (var skill in skills) ...{
                              _SubCategory(title: skill.name),
                            }
                          ]),
                      pw.SizedBox(height: 18),
                      pw.Text(
                        'Languages',
                        style: pw.TextStyle(
                            fontSize: 22,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white),
                      ),
                      pw.Container(
                          padding: pw.EdgeInsets.symmetric(vertical: 4),
                          width: double.infinity,
                          height: 2,
                          color: PdfColors.white),
                      pw.SizedBox(height: 10),
                      for (var lang in languages) ...{
                        pw.Row(children: [
                          pw.Text(lang.languageName,style: pw.TextStyle(color: PdfColors.white,fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 36),
                          pw.Row(children: [
                            for (int i = 0; i < 5; i++) ...{
                              pw.Container(
                                  width: 10,
                                  height: 10,
                                  decoration: pw.BoxDecoration(
                                      color: i < lang.level
                                          ? PdfColors.white
                                          : PdfColors.black,
                                      shape: pw.BoxShape.circle)),
                              pw.SizedBox(width: 6),
                            }
                          ]),
                        ]),
                        pw.SizedBox(height: 10),
                      },
                      pw.SizedBox(height: 6),
                      pw.Text(
                        'Portfolio',
                        style: pw.TextStyle(
                            fontSize: 22,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white),
                      ),
                      pw.Container(
                          padding: pw.EdgeInsets.symmetric(vertical: 4),
                          width: double.infinity,
                          height: 2,
                          color: PdfColors.white),
                      pw.SizedBox(height: 10),
                      for (var e in portfolios) ...{
                        pw.Text(e.type,style: pw.TextStyle(color: PdfColors.white,fontWeight: pw.FontWeight.bold)),
                        _buildLink(e.url),
                        pw.SizedBox(height: 4)
                      }
                    ],
                  ),
                )),
            pw.Partition(
              child: pw.Column(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.symmetric(horizontal: 16),
                    width: pageTheme.pageFormat.availableWidth,
                    child: pw.Column(
                      mainAxisSize: pw.MainAxisSize.max,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.SizedBox(height: 24),
                        pw.Text(
                          fullName,
                          textScaleFactor: 3,
                          softWrap: true,
                          style: pw.Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          'Mobile app developer',
                          style: pw.TextStyle(fontSize: 14),
                          textAlign: pw.TextAlign.left,
                        ),
                        pw.SizedBox(height: 12),
                        pw.Text(summary),
                        pw.SizedBox(height: 18),
                        _Category(title: 'Work Experience'),
                        for (var e in experience) ...{
                          _Block(
                              title: e.jobTitle,
                              description: e.description,
                              year:
                                  '${e.startDate.substring(0, 4)} - ${e.endDate == null ? 'present' : e.endDate!.substring(0, 4)}'),
                        },
                        pw.SizedBox(height: 12),
                        _Category(title: 'Education'),
                        for (var e in educations) ...{
                          _Block(
                              title: e.educationType,
                              description: e.fieldOfStudy,
                              year:
                              '${e.startDate.substring(0, 4)} - ${e.endDate == null ? 'present' : e.endDate!.substring(0, 4)}'),
                        },
                        // _Block(
                        //     title: 'Information Technology Engineering',
                        //     description: 'Lorem ipsum dolor sit amet,'
                        //         ' consectetur adipiscing elit. Praesent at viverra dui,'
                        //         ' sed aliquet nisl. Nam eu imperdiet orci, vitae.',
                        //     year: 'Aug - 2022'),
                        pw.SizedBox(height: 12),
                        _Category(title: 'CERTIFICATES'),
                        for (var e in courses) ...{
                          _CourseBlock(
                              name: e.name,
                              from: e.from,
                              domain: e.subDomain,
                              year:
                              e.dateOfAchievement.substring(0, 7)),
                        },
                        pw.SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final loveIcon = await rootBundle.loadString('assets/icons/love.svg');

  format = format.copyWith(
      marginLeft: 0, marginBottom: 0, marginRight: 0, marginTop: 0);
  // format = format.applyMargin(
  //     left: 0.0 * PdfPageFormat.cm,
  //     top: 0.0 * PdfPageFormat.cm,
  //     right: 0.0 * PdfPageFormat.cm,
  //     bottom: 0.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: false,
        child: pw.Stack(
          children: [
            pw.Row(children: [
              pw.Container(
                  color: lightGreen, width: format.availableWidth / 2.6),
              pw.Container(
                  //color: green,
                  width: format.availableWidth),
            ]),
            // pw.Positioned(
            //   child: pw.SvgImage(svg: bgShape),
            //   left: 0,
            //   top: 0,
            // ),
            // pw.Positioned(
            //   child: pw.Transform.rotate(
            //       angle: pi, child: pw.SvgImage(svg: bgShape)),
            //   right: 0,
            //   bottom: 0,
            // ),
            pw.Positioned(
              left: 16,
              bottom: 20,
              child: pw.Row(
                children: [
                  pw.Text('Made with ',
                      style: pw.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                  pw.SvgImage(svg: loveIcon,width: 22,height: 22),
                  pw.Text(' By Tieup app',
                      style: pw.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                ]
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    required this.description,
    required this.year,
    this.icon,
  });

  final String title;
  final String year;
  final String description;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Text(description, softWrap: true),
                  pw.Align(
                      alignment: pw.Alignment.centerRight, child: pw.Text(year))
                ]),
          ),
        ]);
  }
}

class _CourseBlock extends pw.StatelessWidget {
  _CourseBlock({
    required this.name,
    required this.from,
    required this.year,
    required this.domain,
    this.icon,
  });

  final String name;
  final String year;
  final String from;
  final String domain;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(name,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Row(
                    children: [
                      pw.Text('From :  ',style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text(from, softWrap: true),
                    ]
                  ),
                  pw.SizedBox(height: 4),
                  pw.Row(
                      children: [
                        pw.Text('In       :  ',style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text(domain, softWrap: true),
                      ]
                  ),
                  pw.Align(
                      alignment: pw.Alignment.centerRight, child: pw.Text(year))
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        style: pw.TextStyle(color: PdfColor.fromInt(0xffffff)),
        textScaleFactor: 1.5,
      ),
    );
  }
}

class _SubCategory extends pw.StatelessWidget {
  _SubCategory({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.white, width: 2),
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(12)),
      ),
      //margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        style: pw.TextStyle(color: PdfColors.white),
        textScaleFactor: 1,
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => green;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.white,
          )),
    );
  }
}

class _buildLink extends pw.StatelessWidget {
  _buildLink(this.url);
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 2.0),
        child: pw.Row(children: [
          _UrlText(url, url),
        ]));
  }
}
