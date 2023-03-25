import 'package:flutter/material.dart';
import 'package:startertemplate/utils/my_color.dart';

class MenuKotak extends StatelessWidget {
  final String title;
  final String imgPath;
  final Function()? btnOnTap;

  const MenuKotak({
    super.key,
    required this.title,
    required this.imgPath,
    this.btnOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: btnOnTap,
      child: Ink(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: MyColors.pink,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // gambar
              Image.asset(
                imgPath,
                height: 65,
              ),

              // Title
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
