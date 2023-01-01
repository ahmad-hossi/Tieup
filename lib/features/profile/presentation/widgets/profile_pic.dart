import 'package:flutter/material.dart';
import 'package:tieup/core/constants/api_constant.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic(
      {required this.imageUrl, required this.isOpenToWork, Key? key})
      : super(key: key);

  final String? imageUrl;
  final int isOpenToWork;

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 4.0, end: 6.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  // late File _image;
  // ImagePicker picker = ImagePicker();
  //
  // Future getImage(ImageSource src) async {
  //   var pickedImage = await picker.pickImage(source: src);
  //   print(pickedImage.toString());
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isOpenToWork == 1 ? Colors.green : Colors.red,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: widget.isOpenToWork == 1 ? Colors.green : Colors.red,
              blurRadius: _animation.value,
              spreadRadius: _animation.value - 2,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ClipOval(
            child: widget.imageUrl != null
                ? Image.network(
                    '$kBaseUrl/${widget.imageUrl}',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/place_holder.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
