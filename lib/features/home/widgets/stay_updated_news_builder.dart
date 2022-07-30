import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/home/widgets/news_item.dart';

import '../../../models/upload.dart';
import '../services/home_services.dart';

class StayUpdatedNewsBuilder extends StatefulWidget {
  const StayUpdatedNewsBuilder({Key? key}) : super(key: key);

  @override
  State<StayUpdatedNewsBuilder> createState() => _StayUpdatedNewsBuilderState();
}

class _StayUpdatedNewsBuilderState extends State<StayUpdatedNewsBuilder> {
  List<ImageUpload>? images;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchAllImages();
  }

  fetchAllImages() async {
    images = await homeServices.fetchAllImages(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      scrollDirection: Axis.horizontal,
      // shrinkWrap: true,
      itemCount: images!.length,
      itemBuilder: (context, index) {
        final imageData = images![index];
        return Padding(
          padding: EdgeInsets.only(left: Dimensions.width20),
          child: NewsItem(
            image: imageData.image[0],
          ),
        );
      },
    );
  }
}
