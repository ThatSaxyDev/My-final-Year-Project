import 'package:flutter/material.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/home/services/home_services.dart';
import 'package:project_news_restart/features/home/widgets/image_poster.dart';
import 'package:project_news_restart/models/newsletter.dart';
import '../../../common/loader.dart';

class AsEDeyHotBuilder extends StatefulWidget {
  const AsEDeyHotBuilder({Key? key}) : super(key: key);

  @override
  State<AsEDeyHotBuilder> createState() => _AsEDeyHotBuilderState();
}

class _AsEDeyHotBuilderState extends State<AsEDeyHotBuilder> {
  List<NewsletterUpload>? newsletters;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchAllNewsletters();
  }

  fetchAllNewsletters() async {
    newsletters = await homeServices.fetchAllNewsletters(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return newsletters == null
        ? const Loader()
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: newsletters!.length,
            itemBuilder: (context, index) {
              final newsletterData = newsletters![index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20,
                ),
                child: ImagePosterCard(
                  height: Dimensions.height10 * 40,
                  image: newsletterData.newsletter[0],
                ),
              );
            },
          );
  }
}
