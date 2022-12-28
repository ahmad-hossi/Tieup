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
import 'package:tieup/features/profile/domain/entities/profile.dart';
import 'package:tieup/features/skill/domain/entities/skill.dart';

PdfColor green = PdfColor.fromInt(0XFF3E58CC);
const PdfColor lightGreen = PdfColor.fromInt(0XFF3E58CC);
const sep = 120.0;

Future<Uint8List> generateResume(PdfPageFormat format,Profile userProfile) async {
  final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');

  final fullName = userProfile.fullName;
  final summary = userProfile.summary ?? '';
  final List<Skill> skills = userProfile.skills;


  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/pic.jpg')).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);



  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
       for(int i = 0 ; i < 5; i++)  pw.Row(
           crossAxisAlignment: pw.CrossAxisAlignment.start,
           mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
           children: [
             pw.Column(
                 mainAxisSize: pw.MainAxisSize.max,
                 crossAxisAlignment: pw.CrossAxisAlignment.start,
                 children: [
                   pw.Text(
                     fullName,
                     textScaleFactor: 2,
                     softWrap: true,
                     style: pw.Theme.of(context)
                         .defaultTextStyle
                         .copyWith(fontWeight: pw.FontWeight.bold),
                   ),
                   pw.SizedBox(height: 4.0),
                   pw.Text(
                     'Mobile app developer',
                     style: pw.TextStyle(fontSize: 16),
                     textAlign: pw.TextAlign.left,
                   ),
                   pw.SizedBox(height: 4.0),
                   pw.SizedBox(
                     width: 160,
                     child: pw.Text(
                       'Lorem ipsum dolor sit amet,'
                           ' consectetur adipiscing elit.',
                       softWrap: true,
                       style: pw.TextStyle(fontSize: 14),
                     ),
                   )
                 ]),
             pw.SizedBox(
               width: 120,
               height: 120,
               child: pw.Stack(
                   fit: pw.StackFit.expand,
                   alignment: pw.Alignment.center,
                   children: [
                     pw.ClipOval(
                       child: pw.Container(
                         width: 130,
                         height: 130,
                         color: lightGreen,
                       ),
                     ),
                     pw.ClipOval(
                         child: pw.Image(profileImage,
                             width: 110,
                             height: 110,
                             alignment: pw.Alignment.center)),
                   ]),
             ),
             pw.Column(
                 mainAxisSize: pw.MainAxisSize.max,
                 crossAxisAlignment: pw.CrossAxisAlignment.end,
                 mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                 children: [
                   _buildLink('ahmad.hessi.96@gmail.com'),
                   pw.Padding(
                     padding: pw.EdgeInsets.symmetric(vertical: 4.0),
                     child: pw.Text('+963950011344'),
                   ),
                   pw.Padding(
                     padding: pw.EdgeInsets.symmetric(vertical: 4.0),
                     child: pw.Text('Aleppo , Syria'),
                   ),
                   _buildLink('linkedin.com/in/ahmad-hossi'),
                   _buildLink('github.com/ahmad-hossi'),
                 ]),
           ]),
        pw.SizedBox(height: 10),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              pw.Column(
                  mainAxisSize: pw.MainAxisSize.max,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      fullName,
                      textScaleFactor: 2,
                      softWrap: true,
                      style: pw.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(height: 4.0),
                    pw.Text(
                      'Mobile app developer',
                      style: pw.TextStyle(fontSize: 16),
                      textAlign: pw.TextAlign.left,
                    ),
                    pw.SizedBox(height: 4.0),
                    pw.SizedBox(
                      width: 160,
                      child: pw.Text(
                        'Lorem ipsum dolor sit amet,'
                            ' consectetur adipiscing elit.',
                        softWrap: true,
                        style: pw.TextStyle(fontSize: 14),
                      ),
                    )
                  ]),
              pw.SizedBox(
                width: 120,
                height: 120,
                child: pw.Stack(
                    fit: pw.StackFit.expand,
                    alignment: pw.Alignment.center,
                    children: [
                      pw.ClipOval(
                        child: pw.Container(
                          width: 130,
                          height: 130,
                          color: lightGreen,
                        ),
                      ),
                      pw.ClipOval(
                          child: pw.Image(profileImage,
                              width: 110,
                              height: 110,
                              alignment: pw.Alignment.center)),
                    ]),
              ),
              pw.Column(
                  mainAxisSize: pw.MainAxisSize.max,
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    _buildLink('ahmad.hessi.96@gmail.com'),
                    pw.Padding(
                      padding: pw.EdgeInsets.symmetric(vertical: 4.0),
                      child: pw.Text('+963950011344'),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.symmetric(vertical: 4.0),
                      child: pw.Text('Aleppo , Syria'),
                    ),
                    _buildLink('linkedin.com/in/ahmad-hossi'),
                    _buildLink('github.com/ahmad-hossi'),
                  ]),
            ]),
        pw.SizedBox(height: 10),
        pw.Container(width: double.infinity, height: 2, color: lightGreen),
        pw.SizedBox(height: 10),
        pw.Text(summary),
        pw.Partitions(
          children: [
            pw.Partition(
              width: 230,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  _Category(title: 'Work Experience'),
                  _Block(
                      title: 'IT manager',
                      description: 'Lorem ipsum dolor sit amet,'
                          ' consectetur adipiscing elit. Praesent at viverra dui,'
                          ' sed aliquet nisl. Nam eu imperdiet orci, vitae.',
                      year: '2016 - 2021'),
                  _Block(
                      title: 'Flutter developer',
                      description: 'Lorem ipsum dolor sit amet,'
                          ' consectetur adipiscing elit. Praesent at viverra dui,'
                          ' sed aliquet nisl. Nam eu imperdiet orci, vitae.',
                      year: '2022 - Present'),
                  pw.SizedBox(height: 20),
                  _Category(title: 'Education'),
                  _Block(
                      title: 'Information Technology Engineering',
                      description: 'Lorem ipsum dolor sit amet,'
                          ' consectetur adipiscing elit. Praesent at viverra dui,'
                          ' sed aliquet nisl. Nam eu imperdiet orci, vitae.',
                      year: 'Aug - 2022'),
                ],
              ),
            ),
            pw.Partition(
              width: 230,
              child: pw.Column(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 16),
                    //height: pageTheme.pageFormat.availableHeight,
                    width: pageTheme.pageFormat.availableWidth,
                    child: pw.Column(
                      mainAxisSize: pw.MainAxisSize.max,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        _Category(title: 'Skills'),
                        pw.Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            direction: pw.Axis.horizontal,
                            children: [
                              for(var skill in skills)...{
                                _SubCategory(title: skill.name),
                              }
                            ]),
                        pw.SizedBox(height: 20),
                        _Category(title: 'CERTIFICATES'),
                        _Block(
                            title: 'Enterprising Young Leader Academy',
                            description: 'Lorem ipsum dolor sit amet,'
                                ' consectetur adipiscing elit. Praesent at viverra dui,'
                                ' sed aliquet nisl. Nam eu imperdiet orci, vitae.',
                            year: 'Sep-2022'),
                        pw.SizedBox(height: 20),
                        _Category(title: 'Languages'),
                        pw.SizedBox(height: 8),
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                            children: <pw.Widget>[
                              _Percent(
                                  size: 60,
                                  value: 0.9,
                                  title: pw.Text('Arabic')),
                              _Percent(
                                  size: 60,
                                  value: .7,
                                  title: pw.Text('English')),
                              _Percent(
                                  size: 60,
                                  value: .3,
                                  title: pw.Text('Turkish')),
                            ]),
                        // pw.BarcodeWidget(
                        //   data: '0950011344',
                        //   width: 80,
                        //   height: 80,
                        //   barcode: pw.Barcode.qrCode(),
                        //   drawText: false,
                        // ),
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
  final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 2.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                  angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
            pw.Positioned(
              child: pw.Text('Generated By Tieup app',
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 14)),
              left: 30,
              bottom: 20,
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
        border: pw.Border.all(color: lightGreen, width: 4),
        //color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      //margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
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
        padding: const pw.EdgeInsets.symmetric(vertical: 4.0),
        child: pw.Row(children: [
          _UrlText(url, url),
          pw.SizedBox(width: 4.0),
          pw.Icon(const pw.IconData(0xe3f3), color: lightGreen, size: 18),
        ]));
  }
}
