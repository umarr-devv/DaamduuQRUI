
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daamduu_qr_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.url,
    this.placehodler = 'assets/placeholders/default.png',
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  final String? url;
  final String placehodler;
  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Builder(
      builder: (context) {
        if (url != null) {
          return CachedNetworkImage(
            imageUrl: url!,
            height: height,
            width: width,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: SpinKitPulse(color: theme.custom.primary),
              );
            },
          );
        } else {
          return Image.asset(
            placehodler,
            height: height,
            width: width,
            fit: BoxFit.cover,
          );
        }
      },
    );
  }
}
