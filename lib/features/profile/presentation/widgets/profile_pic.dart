import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tieup/constants.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  late File _image;
  ImagePicker picker = ImagePicker();

  Future getImage(ImageSource src) async {
    var pickedImage = await picker.pickImage(source: src);
    print(pickedImage.toString());
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 148,
      width: 148,
      child: Stack(
        //clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
             // backgroundImage: FileImage(_image)
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 42,
              width: 42,
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),foregroundColor: MaterialStateProperty.all<Color>(Colors.red),),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Select picture from',
                      ),
                      actions: [
                        IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              size: 32.0,
                            ),
                            onPressed: () {
                              getImage(ImageSource.camera);
                              Navigator.pop(context);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.image,
                              size: 32.0,
                            ),
                            onPressed: () {
                              getImage(ImageSource.gallery);
                              Navigator.pop(context);
                            }),
                      ],
                      //actionsPadding: EdgeInsets.only(right: 150.0),
                    ),
                  );
                },
                child: Icon(Icons.camera_alt_outlined,size: 38.0,color: kPrimaryColor,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
