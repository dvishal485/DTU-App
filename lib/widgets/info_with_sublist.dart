import 'package:dtu/models/dtu_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dtu/icons.dart';
import 'package:dtu/widgets/svg_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationWithSublist extends StatelessWidget {
  final String title;
  final String details;
  final String tag;
  final List<SubListElement>? list;

  const InformationWithSublist(
      {Key? key,
      this.title = 'No Title',
      this.details = 'No details for this information',
      this.tag = 'sleepMeditaion',
      required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121421),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
                physics: const BouncingScrollPhysics(),
                children: actionButtons(list!)),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: const Color(0xff121421),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 22.w, right: 22.w, top: 20.h, bottom: 10.h),
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(360),
                            onTap: onBackIconTapped,
                            child: Container(
                              height: 35.w,
                              width: 35.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                              ),
                              child: Center(
                                child: SvgAsset(
                                  assetName: AssetName.back,
                                  height: 20.w,
                                  width: 20.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void onStartButtonPressed() {}

  void onBackIconTapped() {
    Get.back();
  }

  List<Widget> actionButtons(List<SubListElement> list) {
    var buttons = <Widget>[
      SizedBox(
        height: 66.h,
      ),
      Padding(
        padding: EdgeInsets.only(left: 28.w),
        child: Hero(
          tag: tag,
          child: Material(
            color: Colors.transparent,
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34.w,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Padding(
        padding: EdgeInsets.only(left: 28.w),
        child: Text(
          "By Delhi Technological University",
          style: TextStyle(
              color: const Color(0xffffffff).withOpacity(0.7),
              fontWeight: FontWeight.w400,
              fontSize: 16.w),
        ),
      ),
      SizedBox(height: 25.h),
      SizedBox(height: 46.h),
      Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 40.h),
        child: Text(
          details,
          style: TextStyle(
              color: const Color(0xffffffff).withOpacity(0.7),
              fontWeight: FontWeight.w400,
              fontSize: 16.w),
        ),
      ),
    ];
    for (var i in list) {
      buttons.add(
        Center(
            child: Column(children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => {launch(i.link)},
              child: Ink(
                decoration: BoxDecoration(
                  color: const Color(0xff4A80F0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  height: 56.h,
                  width: 319.w,
                  child: Center(
                      child: Text(
                    i.name,
                    style: TextStyle(
                        fontSize: 16.w,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          )
        ])),
      );
    }
    return buttons;
  }
}
