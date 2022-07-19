import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppViewAllTextWidget extends StatelessWidget {
  final String bigText;
  final String smallText;
  const AppViewAllTextWidget({Key? key, required this.bigText, required this.smallText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(bigText, style: Styles.headLineStyle2,),
        InkWell(
            onTap: (){print("view all");},
            child: Text(smallText, style: Styles.textStyle.copyWith(color: Styles.primaryColor),)),
      ],
    );
  }
}
