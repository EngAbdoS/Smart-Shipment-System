import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';

class StudentProfileCirclerImage extends StatelessWidget {
   StudentProfileCirclerImage({super.key, this.size = 60, required this.imageUrl});
//final Repository _repository=instance<Repository>();
  final double size;
  final String imageUrl;


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
                    shape: BoxShape.circle,color: ColorManager.white,

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
            imageUrl:imageUrl,
              //  "https://static3.bigstockphoto.com/9/1/3/large1500/31903202.jpg",
            //Uri.parse("https://static3.bigstockphoto.com/9/1/3/large1500/31903202.jpg").toString(),
            errorWidget: (context, url, error) {

              return Container(
                height: size+5,
                width:size +5,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorManager.white,width: 2),
color: ColorManager.white,
                ),
                child: SvgPicture.asset(
                  //clipBehavior: Clip.antiAlias,
                  SVGAssets.noProfilePic,
                  fit: BoxFit.contain,
                  // height: size,
                  // width: size,
                ),

              );

            }),
      ),
    );
  }
}
