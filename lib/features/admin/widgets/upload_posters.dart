import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_news_restart/features/admin/services/admin_services.dart';

import '../../../common/ttinterfaces_text.dart';
import '../../../constants/dimensions.dart';

class UploadPosters extends StatefulWidget {
  const UploadPosters({Key? key}) : super(key: key);

  @override
  State<UploadPosters> createState() => _UploadPostersState();
}

class _UploadPostersState extends State<UploadPosters> {
  File? image;
  bool _isChooseNewImageVisible = false;
  final AdminServices adminServices = AdminServices();

  Future pickImage() async {
    try {
      final image = await FilePicker.platform.pickFiles(type: FileType.image);

      if (image == null) return;

      final imageTemp = File(image.files.single.path!);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick images: $e');
      }
    }
  }

  void uploadImage() {
    adminServices.uploadImage(context: context, image: image!);
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //! to upload the images
        image != null
            ? Container(
                width: DimensionsDesk.length10 * 70,
                height: DimensionsDesk.length10 * 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DimensionsDesk.length10),
                  image: DecorationImage(
                    image: FileImage(image!),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            : GestureDetector(
                onTap: () async {
                  pickImage();
                  setState(() {
                    _isChooseNewImageVisible = true;
                  });
                },
                child: DottedBorder(
                  strokeWidth: 3,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(DimensionsDesk.length10),
                  dashPattern: const [5, 4],
                  color: const Color.fromRGBO(196, 196, 196, 1),
                  child: Container(
                    width: DimensionsDesk.length10 * 70,
                    height: DimensionsDesk.length10 * 80,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(DimensionsDesk.length10),
                    ),
                    child: Center(
                      child: SizedBox(
                        height: DimensionsDesk.length10 * 10,
                        child: Image.asset('assets/images/uploadimage.png'),
                      ),
                    ),
                  ),
                ),
              ),

        //! button to upload
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: _isChooseNewImageVisible,
              child: image != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: DimensionsDesk.length10 * 2),
                      child: ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          primary: Colors.black,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(DimensionsDesk.length10),
                          child: const TTinterfacesText(
                            text: 'Select new image',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: DimensionsDesk.length10 * 2,
              ),
              child: ElevatedButton(
                onPressed: uploadImage,
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  primary: Colors.black,
                ),
                child: Padding(
                  padding: EdgeInsets.all(DimensionsDesk.length10),
                  child: const TTinterfacesText(
                    text: 'Upload',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
