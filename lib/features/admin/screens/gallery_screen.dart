import 'package:flutter/material.dart';
import 'package:project_news_restart/features/admin/services/admin_services.dart';
import 'package:project_news_restart/features/admin/widgets/newsletter_gallery.dart';
import 'package:project_news_restart/features/admin/widgets/poster_gallery.dart';
import 'package:project_news_restart/models/upload.dart';

import '../../../common/ttinterfaces_text.dart';
import '../../../constants/dimensions.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _galleryType = 0;

  List<Widget> galleryTypes = [
    const PosterGallery(),
    const NewsletterGallery(),
  ];

  void setGalleryType(int galleryType) {
    _galleryType = galleryType;
  }

  List<ImageUpload>? images;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllImages();
  }

  fetchAllImages() async {
    images = await adminServices.fetchAllImages(context);
    setState(() {});
  }

  void deleteImage(ImageUpload image, int index) {
    adminServices.deleteImage(
      context: context,
      image: image,
      onSuccess: () {
        images!.removeAt(index);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height10 * 5,
        left: Dimensions.height10 * 5,
        right: Dimensions.height10 * 5,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Dimensions.height10 * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! recent uploads
                    TTinterfacesText(
                      text: 'Recent Uploads',
                      size: Dimensions.font10 * 6,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),

                    //! description
                    TTinterfacesText(
                      text: 'Posters sent to the students',
                      size: Dimensions.font10 * 3,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                //! buttons for switching type of gallery
                //! poster gallery
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _galleryType == 0;
                    });
                    setGalleryType(0);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    primary: Colors.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.height10),
                    child: const TTinterfacesText(
                      text: 'Poster Gallery',
                      color: Colors.white,
                    ),
                  ),
                ),

                //! newsletter gallery
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _galleryType == 1;
                    });
                    setGalleryType(1);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    primary: Colors.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.height10),
                    child: const TTinterfacesText(
                      text: 'Newsletter Gallery',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //! display images
          SingleChildScrollView(
            child: galleryTypes[_galleryType],
          ),
        ],
      ),
    );
  }
}
