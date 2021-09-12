import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrlString;
  const CachedNetworkImageWidget({Key? key, required this.imageUrlString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrlString,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
