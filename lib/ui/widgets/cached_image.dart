import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final String altUrl;
  final Widget placeholder;

  const CachedImage({
    required this.url,
    required this.altUrl,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) =>
          CachedImage(url: altUrl, altUrl: url, placeholder: placeholder),
    );
  }
}
