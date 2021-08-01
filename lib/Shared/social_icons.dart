import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  String image;
  void Function()? tap;
  SocialIcon({required this.image, required this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Color(0xFFF1E6FF),
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          image,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
