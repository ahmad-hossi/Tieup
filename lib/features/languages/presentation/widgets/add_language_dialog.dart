import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddLanguagesDialog extends StatefulWidget {
  const AddLanguagesDialog({Key? key}) : super(key: key);

  @override
  State<AddLanguagesDialog> createState() => _AddLanguagesDialogState();
}

class _AddLanguagesDialogState extends State<AddLanguagesDialog> {
  List<String> languages = ['Arabic','English','French','German','Turkish'];

  int selectedLanguageId = 0;
  int selectedRating = 1;

  List<DropdownMenuItem<int>> domainItems() {
    List<DropdownMenuItem<int>> dropDownItems = [];
    for (int i = 0 ; i< languages.length ; i++) {
      var item =
      DropdownMenuItem(value: i, child: Text(languages[i]));
      dropDownItems.add(item);
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(16.0),
      child: Container(
        width: 300,
        height: 200,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Add Language',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                )),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<int>(
                  isExpanded: false,
                  value: selectedLanguageId,
                  items: domainItems(),
                  onChanged: (value) {
                    setState(() {
                      selectedLanguageId = value!;
                    });
                  },
                ),
                RatingBar.builder(
                  itemSize: 34.w,
                  initialRating: 2,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding:
                  EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      rating = rating;
                    });
                    print(rating);
                  },
                ),
              ],
            ),
            SizedBox(height: 24.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                  style: TextButton.styleFrom(
                    side: BorderSide(color: kPrimaryColor),
                  ),
                ),
                SizedBox(width: 16,),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context,selectedLanguageId);
                  },
                  child: Text('Add'),
                  style: TextButton.styleFrom(
                    side: BorderSide(color: kPrimaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
