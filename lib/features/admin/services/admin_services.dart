import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_news_restart/constants/error_handling.dart';
import 'package:project_news_restart/constants/global_variables.dart';
import 'package:project_news_restart/constants/utils.dart';
import 'package:project_news_restart/models/newsletter.dart';
import 'package:project_news_restart/models/upload.dart';
import 'package:http/http.dart' as http;
import 'package:project_news_restart/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AdminServices {
  //!
  //! upload images
  void uploadImage({
    required BuildContext context,
    required File image,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('kiishi', 'iz9lvawr');
      List<String> imageUrl = [];
      CloudinaryResponse resp = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path),
      );
      imageUrl.add(resp.secureUrl);

      ImageUpload imageUpload = ImageUpload(image: imageUrl);

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-image'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: imageUpload.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Image Uploaded successfully');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //! get all images
  Future<List<ImageUpload>> fetchAllImages(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<ImageUpload> imageList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/admin/get-image'),
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

  //! delete image
  void deleteImage({
    required BuildContext context,
    required ImageUpload image,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-image'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': image.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //! upload newsletters
  void uploadNewsletters({
    required BuildContext context,
    required File image,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('kiishi', 'iz9lvawr');
      List<String> imageUrl = [];
      CloudinaryResponse resp = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path),
      );
      imageUrl.add(resp.secureUrl);

      NewsletterUpload newsletterUpload = NewsletterUpload(newsletter: imageUrl);

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-newsletter'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: newsletterUpload.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Newsletter Uploaded successfully');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //! get all newsletters
  Future<List<NewsletterUpload>> fetchAllNewsletters(
      BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<NewsletterUpload> newsletterList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/admin/get-newsletter'),
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

  //! delete newsletter
  void deleteNewsletter({
    required BuildContext context,
    required NewsletterUpload newsletter,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-newsletter'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': newsletter.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
