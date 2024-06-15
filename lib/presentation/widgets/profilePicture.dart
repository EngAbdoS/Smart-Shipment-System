import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

class StudentProfileCirclerImage extends StatelessWidget {
  const StudentProfileCirclerImage({super.key, this.size = 60});

  final double size;
//TODO get local data
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {},
      icon: Padding(
        padding: const EdgeInsets.all(0.0),
        child: CachedNetworkImage(
            //fit: BoxFit.cover,
            height: size,
            width: size,
            imageBuilder: (context, imageProvider) => Container(
                  // width: size,
                  // height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorManager.white),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
            placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
            imageUrl:
                "https://static3.bigstockphoto.com/9/1/3/large1500/31903202.jpg",
            //Uri.parse("https://static3.bigstockphoto.com/9/1/3/large1500/31903202.jpg").toString(),
            errorWidget: (context, url, error) {
              return CircleAvatar(
                radius: size / 2 + 1,
                backgroundColor: ColorManager.white,
                child: CircleAvatar(
                  radius: size / 2,
                  child: SvgPicture.asset(
                    SVGAssets.noProfilePic,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
