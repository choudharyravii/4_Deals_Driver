import 'package:flutter/material.dart';
import 'package:four_deals_app/Models/data.dart';

class WelcomePageButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const WelcomePageButton({Key? key, required this.child, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Data.height * 7,
        width: Data.width * 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Data.height)),
        padding: EdgeInsets.only(
            right: Data.width * 3,
            left: Data.width * 4,
            top: Data.height * 0.5),
        child: child,
      ),
    );
  }
}
