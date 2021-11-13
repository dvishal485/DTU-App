import 'package:dtu/icons.dart';
import 'package:dtu/widgets/svg_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
        Text("\$ dtu-app --version",
            style: TextStyle(
                color: Colors.green,
                fontSize: 20.w,
                fontWeight: FontWeight.w100)),
        SizedBox(
          height: 5.h,
        ),
        Text(">> 1.0",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.w,
                fontWeight: FontWeight.w100)),
        SizedBox(
          height: 10.h,
        ),
        Text("\$ dtu-app --about",
            style: TextStyle(
                color: Colors.green,
                fontSize: 20.w,
                fontWeight: FontWeight.w100)),
        SizedBox(
          height: 5.h,
        ),
        Text(
            ">> An effort to build a good UI which is both fast and responsive for our prestigious insitute Delhi Technological University.",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.w,
                fontWeight: FontWeight.w100)),
        SizedBox(
          height: 10.h,
        ),
        Text("\$ dtu-app --developer",
            style: TextStyle(
                color: Colors.green,
                fontSize: 20.w,
                fontWeight: FontWeight.w100)),
        SizedBox(
          height: 5.h,
        ),
        GestureDetector(
          onTap: () async {
            await launch('https://github.com/dvishal485');
          },
          child: Text(">> Vishal Das (dvishal485)",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w100)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text("\$ dtu-app --api",
            style: TextStyle(
                color: Colors.green,
                fontSize: 20.w,
                fontWeight: FontWeight.w100)),
        SizedBox(
          height: 5.h,
        ),
        GestureDetector(
          onTap: () async {
            await launch('https://dtu-api.vercel.app/');
          },
          child: Text(">> https://dtu-api.vercel.app/",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w100)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text("\$ dtu-app --credits",
            style: TextStyle(
                color: Colors.green,
                fontSize: 20.w,
                fontWeight: FontWeight.w100)),
        SizedBox(
          height: 5.h,
        ),
        GestureDetector(
          onTap: () async {
            await launch('https://github.com/dvishal485/');
          },
          child: Text(">> Developer - dvishal485",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w100)),
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: () async {
            await launch(
                'https://github.com/iamadeeb/Flutter-Meditation-App/commit/874683fff3ba3055743ce4e73618a96ce9ec50e7');
          },
          child: Text(">> UI Designs - iamadeeb",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w100)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 87.h,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  gradient: LinearGradient(
                      stops: [
                        0,
                        1
                      ],
                      colors: [
                        Color(0x00000000),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () =>
                            {launch('https://github.com/dvishal485/')},
                        child: Ink(
                          decoration: BoxDecoration(
                            color: const Color(0x00000000),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SizedBox(
                            height: 50.h,
                            width: 50.h,
                            child: Center(
                              child: SvgAsset(
                                assetName: AssetName.github,
                                height: 45.h,
                                width: 45.h,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => {launch('https://t.me/dvishal485')},
                        child: Ink(
                          decoration: BoxDecoration(
                            color: const Color(0x00000000),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SizedBox(
                            height: 50.h,
                            width: 50.h,
                            child: Center(
                              child: SvgAsset(
                                assetName: AssetName.telegram,
                                height: 45.h,
                                width: 45.h,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () =>
                            {launch('https://instagram.com/dvishal.485')},
                        child: Ink(
                          decoration: BoxDecoration(
                            color: const Color(0x00000000),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SizedBox(
                            height: 50.h,
                            width: 50.h,
                            child: Center(
                              child: SvgAsset(
                                assetName: AssetName.instagram,
                                height: 45.h,
                                width: 45.h,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        )
          ],
        ),
      ),
    );
  }
}
