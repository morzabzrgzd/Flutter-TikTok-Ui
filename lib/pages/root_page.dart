import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tiktok_app/pages/home_page.dart';
import 'package:tiktok_app/theme/colors.dart';
import 'package:tiktok_app/widgets/tik_tok_icons.dart';
import 'package:tiktok_app/widgets/upload_icon.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

List bottonItems = [
  {'icon': TikTokIcons.home, 'label': 'Home', 'isIcon': true},
  {'icon': TikTokIcons.search, 'label': 'Discover', 'isIcon': true},
  {'icon': '', 'label': '', 'isIcon': false},
  {'icon': TikTokIcons.heart, 'label': 'Inbox', 'isIcon': true},
  {'icon': TikTokIcons.profile, 'label': 'Me', 'isIcon': true},
];
int pageIndex = 0;

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const[
         HomePage(),
         Center(
          child: Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 20,
            ),
          ),
        ),
         Center(
          child: Text(
            'Add',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 20,
            ),
          ),
        ),
         Center(
          child: Text(
            'Inbox',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 20,
            ),
          ),
        ),
         Center(
          child: Text(
            'Me',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(color: appBgColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            bottonItems.length,
            (index) => bottonItems[index]['isIcon']
                ? InkWell(
                    onTap: () {
                      log('$index');
                      selectedIndex(index);
                    },
                    child: Column(
                      children: [
                        Icon(bottonItems[index]['icon'], color: white),
                        const SizedBox(height: 5),
                        Text(
                          bottonItems[index]['label'],
                          style: const TextStyle(fontSize: 10, color: white),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      print(index);
                      selectedIndex(index);
                    },
                    child: const UploadIcon(),
                  ),
          ),
        ),
      ),
    );
  }

  selectedIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
