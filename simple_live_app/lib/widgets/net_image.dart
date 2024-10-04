import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetImage extends StatelessWidget {
  final dynamic picUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double borderRadius;

  const NetImage(this.picUrl,
      {this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.borderRadius = 0,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isVaildUrl = true;
    Uri? url;
    if (picUrl == null) {
        isVaildUrl = false;
    }else if(picUrl is String){
      var a = Uri.tryParse(picUrl as String);
      if(a== null){
        isVaildUrl = false;
      }
      url = a!;
    }else{
      url = picUrl;
    }
    if(!isVaildUrl){
      return Image.asset(
        'assets/images/logo.png',
        width: width,
        height: height,
      );
    }
    return SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CachedNetworkImage(
                imageUrl: url.toString(),
                imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: fit,
                          ),
                          borderRadius: BorderRadius.circular(borderRadius),
                          shape: BoxShape.rectangle),
                    ),
                placeholder: (context, url) => const Icon(
                      Icons.image,
                      color: Colors.grey,
                      size: 24,
                    ),
                errorWidget: (context, url, error) => const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 24,
                    ))));
  }
}
