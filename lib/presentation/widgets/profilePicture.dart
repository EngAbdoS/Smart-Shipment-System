import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

class StudentProfileCirclerImage extends StatelessWidget {
   const StudentProfileCirclerImage(
      {super.key, this.size = 64, required this.imageUrl,required this.navigate});

  final double size;
  final String imageUrl;
  final GestureTapCallback navigate;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:navigate,
      icon: CachedNetworkImage(
          cacheManager: CacheManager(
            Config(
              'cacheKey',
              stalePeriod: Duration(minutes: 1),
            ),
          ),
          height: size,
          width: size,
          imageBuilder: (context, imageProvider) => FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.white,
                    border: Border.all(color: ColorManager.white),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
          imageUrl:
          imageUrl,
         // "https://static3.bigstockphoto.com/9/1/3/large1500/31903202.jpg",
          //Uri.parse("https://static3.bigstockphoto.com/9/1/3/large1500/31903202.jpg").toString(),
          errorWidget: (context, url, error) {
            return Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorManager.white, width: 2),
                color: ColorManager.white,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(
                  SVGAssets.noProfilePic,
                  height: size * 0.7,
                  width: size * 0.7,
                ),
              ),
            );
          }),
    );
  }
}
