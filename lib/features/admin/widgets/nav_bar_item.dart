import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';

class NavBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;
  final Color color;
  const NavBarItem({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(DimensionsDesk.length10 * 2),
      ),
      onTap: onTap,
      child: Container(
        height: Dimensions.height10 * 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(DimensionsDesk.length10 * 2),
          ),
          color: color,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
