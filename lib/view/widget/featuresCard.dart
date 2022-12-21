import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../../utils/textUtils.dart';

class FeaturesCard extends StatelessWidget {
  final Icon icon;
  final String text;
  final String details;
  FeaturesCard({
    super.key,
    required this.icon,
    required this.text,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 70,
          color: Colors.blueGrey.shade50,
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.blue.shade900,
                width: 70,
                height: 70,
                child: icon,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextUtils(
                        text: text,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: 10.sp),
                    TextUtils(
                        text: details,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontsize: 8.sp)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
