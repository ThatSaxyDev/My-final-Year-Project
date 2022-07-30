import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';

class ImagePosterCard extends StatelessWidget {
  final String image;
  final double height;
  const ImagePosterCard({
    Key? key,
    required this.image,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PhysicalModel(
        color: Colors.white,
        elevation: 15,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          child: Image.network(
            image,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
