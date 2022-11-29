import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import '../constants/size_config.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.label, required this.onTap, required this.isSmall,required this.withLogo, required this.isOrange, this.icon}) : super(key: key);
  final String label;
  final VoidCallback onTap;
  final bool isSmall;
  final bool isOrange;
  final bool withLogo;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: isOrange ? kOrange : Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        width: isSmall ? getProportionateScreenWidth(170):getProportionateScreenWidth(324),
        height: getProportionateScreenHeight(65),
        child: Align(
          alignment: Alignment.center,
          child: withLogo ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                maxLines: 1,
                style: TextStyle(
                  fontSize: getFontSize(17.5),
                  color: isOrange ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(width: 7,),
              FaIcon(icon,  color: Colors.black,),
            ],
          ) : Text(
            label,
            style: TextStyle(
              fontSize: getFontSize(17.5),
              color: isOrange ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}


class BlackButton extends StatelessWidget {
  const BlackButton({Key? key, required this.label, required this.onTap, required this.isSmall, this.withLogo, }) : super(key: key);
  final String label;
  final VoidCallback onTap;
  final bool isSmall;
  final Widget? withLogo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)
        ),
        width: isSmall ? getProportionateScreenWidth(130):getProportionateScreenWidth(324),
        height: getProportionateScreenHeight(65),
        child: Align(
          alignment: Alignment.center,
          child: withLogo ?? Text(
            label,
            style: TextStyle(
              fontSize: getFontSize(18.5),
              color: Colors.white,

            ),
          ),
        ),
      ),
    );
  }
}
