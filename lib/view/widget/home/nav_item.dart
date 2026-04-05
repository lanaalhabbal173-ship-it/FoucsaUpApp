import 'package:flutter/material.dart';
import 'package:test/core/class/constant/appcolor.dart';

class NavItem extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const NavItem({
    Key? key,
    required this.textbutton,
    required this.icondata,
    required this.onPressed,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true ? Appcolor.scondary : Appcolor.grey,
          ),
          Text(
            textbutton,
            style: TextStyle(
              color: active == true ? Appcolor.scondary : Appcolor.grey,
            ),
          ),
        ],
      ),
    );
  }
}
