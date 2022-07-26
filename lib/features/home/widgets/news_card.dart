import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';

class NewsCard extends StatelessWidget {
  final String image;
  final double elevation;
  const NewsCard({
    Key? key,
    required this.image,
    this.elevation = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(Dimensions.radius15);
    return PhysicalModel(
      color: Colors.grey,
      elevation: elevation,
      borderRadius: border,
      child: ClipRRect(
        borderRadius: border,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
