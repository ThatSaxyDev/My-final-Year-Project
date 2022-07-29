import 'package:flutter/material.dart';
import 'package:project_news_restart/common/ttinterfaces_text.dart';
import 'package:project_news_restart/constants/dimensions.dart';
import 'package:project_news_restart/features/admin/widgets/upload_posters.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _uploadType = 0;

  List<Widget> uploadTypes = [
    const UploadPosters(),
    Center(
      child: TTinterfacesText(
        text: 'Upload Newsletters',
        size: Dimensions.font10 * 8,
      ),
    ),
  ];

  void setUploadType(int uploadType) {
    _uploadType = uploadType;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height10 * 5),
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
                    //! welcome message
                    TTinterfacesText(
                      text: 'Welcome, P.R.O.',
                      size: Dimensions.font10 * 6,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),

                    //! choose what to upload prompt
                    TTinterfacesText(
                      text: 'What do Babcock students need to know?',
                      size: Dimensions.font10 * 3,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                //! buttons for switching type of upload
                //! upload posters
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _uploadType == 0;
                    });
                    setUploadType(0);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    primary: Colors.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.height10),
                    child: const TTinterfacesText(
                      text: 'Click to upload posters',
                      color: Colors.white,
                    ),
                  ),
                ),

                //! upload newsletters
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _uploadType == 1;
                    });
                    setUploadType(1);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    primary: Colors.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.height10),
                    child: const TTinterfacesText(
                      text: 'Click to upload newsletters',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.red,
              padding: EdgeInsets.all(Dimensions.height10),
              child: uploadTypes[_uploadType],
            ),
          ),
        ],
      ),
    );
  }
}
