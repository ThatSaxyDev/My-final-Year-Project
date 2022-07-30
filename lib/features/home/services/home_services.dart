import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:project_news_restart/models/newsletter.dart';
import 'package:project_news_restart/models/upload.dart';
import 'package:provider/provider.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  //! get all images
  Future<List<ImageUpload>> fetchAllImages(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<ImageUpload> imageList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/images'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            imageList.add(
              ImageUpload.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return imageList;
  }

  //! get all newsletters
  Future<List<NewsletterUpload>> fetchAllNewsletters(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<NewsletterUpload> newsletterList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/newsletters'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            newsletterList.add(
              NewsletterUpload.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return newsletterList;
  }
}
