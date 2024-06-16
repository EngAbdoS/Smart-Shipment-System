import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/profilePicture.dart';

class ClientHomeView extends StatefulWidget {
   const ClientHomeView({super.key});

  @override
  State<ClientHomeView> createState() => _ClientHomeViewState();
}

class _ClientHomeViewState extends State<ClientHomeView> {
final ClientHomeViewModel _viewModel = instance<ClientHomeViewModel>();

@override
  void initState() {
//  await _viewModel.userData(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorManager.primary,
            actions: [
              StudentProfileCirclerImage(imageUrl: "_viewModel.userModel!.email",),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.circle_notifications_outlined,
                  size: 53.h,
                  color: ColorManager.black,
                ),
              ),
            ],
            pinned: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              //title: Text("Smart Shipment System"),
              background: Container(
                color: ColorManager.primary,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Text("Smart Shipment System"),
                      Text("Smart Shipment System"),
                      Text("Smart Shipment System"),
                    ],
                  ),
                ),
              ),
            ),
            // bottom: AppBar(
            //   title:Text("Client Home"),
            // ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 800,
                  width: double.maxFinite,
                  color: Colors.lightBlue.withOpacity(0.1),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: Colors.green,
                      height: 700,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
