import 'package:dtu/discover_page.dart';
import 'package:dtu/models/dtu_api.dart';
import 'package:dtu/widgets/discover_card.dart';
import 'package:dtu/widgets/info_with_link.dart';
import 'package:dtu/widgets/info_with_sublist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListPage extends StatelessWidget {
  final List<ContentList> list;
  final String type;
  const ListPage({Key? key, required this.list, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121421),
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
              left: 28.w,
              right: 18.w,
              top: 36.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Text(type,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.w,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 180.h),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: createList(list),
            ),
          ),
        ]),
      ),
    );
  }

  List<Widget> createList(List<ContentList> list) {
    var elementalList = <Widget>[];
    list.asMap().forEach((f, i) {
      String cardTitle = type;
      if (type[type.length - 1] == 's' && type != 'News') {
        cardTitle = type.substring(0, type.length - 1);
      }
      cardTitle += ' ${f + 1}';
      elementalList.add(Center(
          child: DiscoverCard(
        tag: 'element${f + 1}',
        title: 'Update ${f + 1}',
        onTap: () {
          if (i.subList != null) {
            Get.to(
                () => InformationWithSublist(
                      list: i.subList!,
                      details: i.name,
                      title: cardTitle,
                      tag: 'element${f + 1}',
                    ),
                transition: Transition.rightToLeft);
          } else {
            Get.to(
                () => InformationWithLink(
                      link: i.link!,
                      title: cardTitle,
                      details: i.name,
                      tag: 'element${f + 1}',
                    ),
                transition: Transition.rightToLeft);
          }
        },
        subtitle: shorthand(i.name),
      )));
      elementalList.add(SizedBox(
        height: 15.h,
      ));
    });
    return elementalList;
  }
}
