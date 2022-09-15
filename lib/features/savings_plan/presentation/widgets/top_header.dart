import 'package:flutter/material.dart';
import 'package:kwaba_test/core/constants/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 8,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 15.0, right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
            ),
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Buddy Saving',
                  style: TextStyle(color: Colors.white38, fontSize: 18)),
              SizedBox(height: 8),
              AutoSizeText(
                "Save with family and friends for your next rent",
                overflow: TextOverflow.fade,
                style: TextStyle(color: Colors.white38, fontSize: 11),
              )
            ],
          )
        ],
      ),
    );
  }
}
