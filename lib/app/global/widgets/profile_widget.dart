import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:what_chat/app/theme/theme.dart';

Widget ProfileWidget({String? imageUrl, File? image}) {
  if (image == null) {
    if (imageUrl == null || imageUrl == "") {
      return Image.asset(
        'assets/profile_image.jpg',
        fit: BoxFit.cover,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return const CircularProgressIndicator(
            color: tabColor,
          );
        },
        errorWidget: (context, url, error) => Image.asset(
          'assets/profile_image.jpg',
          fit: BoxFit.cover,
        ),
      );
    }
  } else {
    return Image.file(
      image,
      fit: BoxFit.cover,
    );
  }
}
