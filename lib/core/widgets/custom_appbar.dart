import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noteappwithphp/core/helpers/extentions.dart';
import 'package:noteappwithphp/core/theme/styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isBackButtonExists;
  const CustomAppBar(
      {super.key, required this.title, required this.isBackButtonExists});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SvgPicture.asset("assets/images/Vector 1.svg", fit: BoxFit.fill),
      isBackButtonExists
          ? Positioned(
              top: 56,
              left: 21,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    context.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  )))
          : const SizedBox.shrink(),
      Positioned(
        top: isBackButtonExists ? 62 : 56,
        right: 21,
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            title,
            style: isBackButtonExists
                ? Styles.style18WhiteBoldCairo
                : Styles.style25WhiteBoldCairo,
          ),
        ),
      ),
    ]);
  }
}
