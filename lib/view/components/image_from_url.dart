import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class ImageFromUrl extends StatelessWidget {

  final String imageUrl;
  const ImageFromUrl({this.imageUrl});

  @override
  Widget build(BuildContext context) {

    /// [まれにapiDataがhttpの場合があり]
    final isInvalidUrl = imageUrl.startsWith("http");   /// [booleanType]
    /// [apiDataの内,imageUrl=nullがあり得る]
    /// [更にDB経由の場合,""があり得る]
    if(imageUrl == null || imageUrl == "" || !isInvalidUrl) {
      return const Icon(Icons.broken_image);

    } else {
      return CachedNetworkImage(   /// [オフラインcashe読み込み]
        imageUrl: imageUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.browser_not_supported),
      );
    }


  }
}