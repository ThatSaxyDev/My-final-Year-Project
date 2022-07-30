import 'package:flutter/material.dart';
import 'package:project_news_restart/models/newsletter.dart';

import '../../../common/loader.dart';
import '../../../constants/dimensions.dart';
import '../services/admin_services.dart';

class NewsletterGallery extends StatefulWidget {
  const NewsletterGallery({Key? key}) : super(key: key);

  @override
  State<NewsletterGallery> createState() => _NewsletterGalleryState();
}

class _NewsletterGalleryState extends State<NewsletterGallery> {
  List<NewsletterUpload>? newsletters;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllNewsletters();
  }

  fetchAllNewsletters() async {
    newsletters = await adminServices.fetchAllNewsletters(context);
    setState(() {});
  }

  void deleteNewsletters(NewsletterUpload newsletter, int index) {
    adminServices.deleteNewsletter(
      context: context,
      newsletter: newsletter,
      onSuccess: () {
        newsletters!.removeAt(index);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.26,
      padding: EdgeInsets.all(Dimensions.height10),
      child: newsletters == null
          ? const Loader()
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: DimensionsDesk.length10 * 0.1,
                crossAxisSpacing: DimensionsDesk.length10 * 0.1,
                childAspectRatio: 10 / 13,
              ),
              scrollDirection: Axis.vertical,
              itemCount: newsletters!.length,
              itemBuilder: (context, index) {
                final newsletterData = newsletters![index];
                return Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(
                    top: DimensionsDesk.length10 * 2,
                    left: DimensionsDesk.length10 * 2,
                    right: DimensionsDesk.length10 * 2,
                    bottom: DimensionsDesk.length10 * 4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          // height: DimensionsDesk.length10 * 23,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                DimensionsDesk.length10 * 2,
                              ),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                newsletterData.newsletter[0],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            deleteNewsletters(newsletterData, index),
                        icon: Icon(
                          Icons.delete_forever,
                          size: Dimensions.iconSize10 * 3,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
