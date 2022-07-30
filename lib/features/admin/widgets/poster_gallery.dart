import 'package:flutter/material.dart';

import '../../../common/loader.dart';
import '../../../constants/dimensions.dart';
import '../../../models/upload.dart';
import '../services/admin_services.dart';

class PosterGallery extends StatefulWidget {
  const PosterGallery({Key? key}) : super(key: key);

  @override
  State<PosterGallery> createState() => _PosterGalleryState();
}

class _PosterGalleryState extends State<PosterGallery> {
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
    return Container(
      height: MediaQuery.of(context).size.height / 1.26,
      // color: Colors.red,
      padding: EdgeInsets.all(Dimensions.height10),
      child: images == null
          ? const Loader()
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: DimensionsDesk.length10 * 0.1,
                crossAxisSpacing: DimensionsDesk.length10 * 0.1,
                childAspectRatio: 10 / 13,
              ),
              scrollDirection: Axis.vertical,
              itemCount: images!.length,
              itemBuilder: (context, index) {
                final imageData = images![index];
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
                                imageData.image[0],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => deleteImage(imageData, index),
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
