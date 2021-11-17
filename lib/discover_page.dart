import 'package:dtu/home_page.dart';
import 'package:dtu/models/dtu_api.dart';
import 'package:dtu/widgets/info_with_link.dart';
import 'package:dtu/widgets/info_with_sublist.dart';
import 'package:dtu/widgets/list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dtu/icons.dart';
import 'package:dtu/widgets/discover_card.dart';
import 'package:dtu/widgets/discover_small_card.dart';
import 'package:dtu/widgets/svg_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late Future<DtuAPI> futureAlbum;
  @override
  void initState() {
    super.initState();
    try {
      futureAlbum = getFromStoredAPI();
    } catch (e) {
      snackbar(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121421),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 28.w,
                right: 18.w,
                top: 36.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DTU",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34.w,
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    borderRadius: BorderRadius.circular(360),
                    onTap: () => launch('http://dtu.ac.in/'),
                    child: SizedBox(
                      height: 35.w,
                      width: 35.w,
                      child: Center(
                        child: SvgAsset(
                          assetName: AssetName.dtu,
                          height: 34.w,
                          width: 34.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Updates",
                    style: TextStyle(
                        color: const Color(0xff515979),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.w),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            FutureBuilder<DtuAPI>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 176.w,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 28.w),
                        DiscoverCard(
                          tag: "note",
                          onTap: () {
                            Get.to(
                                () => InformationWithLink(
                                      tag: 'note',
                                      details: snapshot.data!.note.name,
                                      link: snapshot.data!.note.link,
                                      title: "Note",
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          title: "Note",
                          subtitle: shorthand(snapshot.data!.note.name),
                        ),
                        SizedBox(width: 20.w),
                        DiscoverCard(
                          tag: "lNotice",
                          onTap: () {
                            if (snapshot.data!.notices[0].subList != null) {
                              Get.to(() => InformationWithSublist(
                                    tag: 'lNotice',
                                    details: snapshot.data!.notices[0].name,
                                    list: snapshot.data!.notices[0].subList,
                                    title: "Latest Notice",
                                  ));
                            } else {
                              Get.to(
                                  () => InformationWithLink(
                                        tag: 'lNotice',
                                        details: snapshot.data!.notices[0].name,
                                        link: snapshot.data!.notices[0].link
                                            .toString(),
                                        title: "Latest Notice",
                                      ),
                                  transition: Transition.rightToLeft);
                            }
                          },
                          title: "Latest Notice",
                          subtitle: shorthand(snapshot.data!.notices[0].name),
                          gradientStartColor: const Color(0xffFC67A7),
                          gradientEndColor: const Color(0xffF6815B),
                        ),
                        SizedBox(width: 20.w),
                        DiscoverCard(
                          tag: "lNews",
                          onTap: () {
                            if (snapshot.data!.news[0].subList != null) {
                              Get.to(() => InformationWithSublist(
                                    tag: 'lNews',
                                    details: snapshot.data!.news[0].name,
                                    list: snapshot.data!.news[0].subList,
                                    title: "Latest News",
                                  ));
                            } else {
                              Get.to(
                                  () => InformationWithLink(
                                        tag: 'lNews',
                                        details: snapshot.data!.news[0].name,
                                        link: snapshot.data!.news[0].link
                                            .toString(),
                                        title: "Latest News",
                                      ),
                                  transition: Transition.rightToLeft);
                            }
                          },
                          title: "Latest News",
                          subtitle: shorthand(snapshot.data!.news[0].name),
                          gradientStartColor: const Color(0xffFC67A7),
                          gradientEndColor: const Color(0xffF6815B),
                        ),
                        SizedBox(width: 20.w),
                        DiscoverCard(
                          tag: "lUpdate",
                          onTap: () {
                            if (snapshot.data!.importantUpdates[0].subList !=
                                null) {
                              Get.to(() => InformationWithSublist(
                                    tag: 'lUpdate',
                                    details:
                                        snapshot.data!.importantUpdates[0].name,
                                    list: snapshot
                                        .data!.importantUpdates[0].subList,
                                    title: "Latest Update",
                                  ));
                            } else {
                              Get.to(
                                  () => InformationWithLink(
                                        tag: 'lUpdate',
                                        details: snapshot
                                            .data!.importantUpdates[0].name,
                                        link: snapshot
                                            .data!.importantUpdates[0].link
                                            .toString(),
                                        title: "Latest Update",
                                      ),
                                  transition: Transition.rightToLeft);
                            }
                          },
                          title: "Latest Update",
                          subtitle: shorthand(
                              snapshot.data!.importantUpdates[0].name),
                          gradientStartColor: const Color(0xFF795548),
                          gradientEndColor: const Color(0xFF8D6E63),
                        ),
                        SizedBox(width: 20.w),
                        DiscoverCard(
                          tag: "lEvents",
                          onTap: () {
                            if (snapshot.data!.events[0].subList != null) {
                              Get.to(() => InformationWithSublist(
                                    list: snapshot.data!.events[0].subList,
                                    tag: 'lEvents',
                                    details: snapshot.data!.events[0].name,
                                    title: "Latest Event",
                                  ));
                            } else {
                              Get.to(
                                  () => InformationWithLink(
                                        tag: 'lEvents',
                                        details: snapshot.data!.events[0].name,
                                        link: snapshot.data!.events[0].link!,
                                        title: "Latest Event",
                                      ),
                                  transition: Transition.rightToLeft);
                            }
                          },
                          title: "Latest Event",
                          subtitle: shorthand(snapshot.data!.events[0].name),
                          gradientStartColor: const Color(0xff13DEA0),
                          gradientEndColor: const Color(0xff06B782),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return DiscoverCard(
                    tag: "errorNote",
                    title: "Error",
                    subtitle: shorthand(snapshot.error.toString()),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.only(left: 28.w),
              child: Text(
                "Categories",
                style: TextStyle(
                    color: const Color(0xff515979),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.w),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: FutureBuilder<DtuAPI>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 19.w,
                                  mainAxisExtent: 125.w,
                                  mainAxisSpacing: 19.w),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            DiscoverSmallCard(
                              onTap: () {
                                Get.to(
                                    () => ListPage(
                                        type: 'Important\nUpdates',
                                        list: snapshot.data!.importantUpdates),
                                    transition: Transition.rightToLeft);
                              },
                              title: "Important Updates",
                              gradientStartColor: const Color(0xff13DEA0),
                              gradientEndColor: const Color(0xff06B782),
                            ),
                            DiscoverSmallCard(
                              onTap: () {
                                Get.to(
                                    () => ListPage(
                                        type: 'Notices',
                                        list: snapshot.data!.notices),
                                    transition: Transition.rightToLeft);
                              },
                              title: "Notices",
                              icon: SvgAsset(
                                assetName: AssetName.notice,
                                height: 24.w,
                                color: const Color(0xFFFFFFFF),
                                width: 24.w,
                              ),
                              gradientStartColor: const Color(0xFF795548),
                              gradientEndColor: const Color(0xFF8D6E63),
                            ),
                            DiscoverSmallCard(
                              onTap: () {
                                Get.to(
                                    () => ListPage(
                                        type: 'News',
                                        list: snapshot.data!.news),
                                    transition: Transition.rightToLeft);
                              },
                              title: "News",
                              gradientStartColor: const Color(0xffFC67A7),
                              gradientEndColor: const Color(0xffF6815B),
                              icon: SvgAsset(
                                assetName: AssetName.news,
                                height: 24.w,
                                color: const Color(0xFFFFFFFF),
                                width: 24.w,
                              ),
                            ),
                            DiscoverSmallCard(
                              onTap: () {
                                Get.to(
                                    () => ListPage(
                                          list: snapshot.data!.events,
                                          type: 'Events',
                                        ),
                                    transition: Transition.rightToLeft);
                              },
                              icon: SvgAsset(
                                assetName: AssetName.event,
                                height: 24.w,
                                color: const Color(0xFFFFFFFF),
                                width: 24.w,
                              ),
                              title: "Events",
                              gradientStartColor: const Color(0xffFFD541),
                              gradientEndColor: const Color(0xffF0B31A),
                            ),
                            DiscoverSmallCard(
                              onTap: () {
                                Get.to(
                                    () => ListPage(
                                        type: 'Fresher\'s\nCorner',
                                        list: snapshot.data!.firstYearNotices),
                                    transition: Transition.rightToLeft);
                              },
                              title: "Fresher's Corner",
                              icon: SvgAsset(
                                assetName: AssetName.freshers,
                                color: const Color(0xFFFFFFFF),
                                height: 24.w,
                                width: 24.w,
                              ),
                              gradientStartColor: const Color(0xFF9E9E9E),
                              gradientEndColor: const Color(0xFF757575),
                            ),
                            DiscoverSmallCard(
                              onTap: () {
                                Get.to(
                                    () => ListPage(
                                          list: snapshot.data!.jobs,
                                          type: 'Jobs',
                                        ),
                                    transition: Transition.rightToLeft);
                              },
                              title: "Jobs",
                              icon: SvgAsset(
                                assetName: AssetName.job,
                                height: 24.w,
                                width: 24.w,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                            DiscoverSmallCard(
                              onTap: () {
                                Get.to(
                                    () => ListPage(
                                          list: snapshot.data!.tenders,
                                          type: 'Tenders',
                                        ),
                                    transition: Transition.rightToLeft);
                              },
                              title: "Tenders",
                              icon: SvgAsset(
                                assetName: AssetName.tender,
                                color: const Color(0xFFFFFFFF),
                                height: 24.w,
                                width: 24.w,
                              ),
                              gradientStartColor: const Color(0xFF018786),
                              gradientEndColor: const Color(0xFF03DAC6),
                            ),
                            DiscoverSmallCard(
                              onTap: () {
                                Get.to(
                                    () => ListPage(
                                        type: 'Registeration\nSchedule',
                                        list: snapshot
                                            .data!.registrationSchedule),
                                    transition: Transition.rightToLeft);
                              },
                              title: "Registeration Schedule",
                              icon: SvgAsset(
                                assetName: AssetName.chart,
                                color: const Color(0xFFFFFFFF),
                                height: 24.w,
                                width: 24.w,
                              ),
                              gradientStartColor: const Color(0xff13DEA0),
                              gradientEndColor: const Color(0xff06B782),
                            ),
                          ],
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }))
          ],
        ),
      ),
    );
  }
}

String shorthand(String x) {
  if (x.length > 47) {
    return x.substring(0, 47) + '...';
  } else {
    return x;
  }
}
