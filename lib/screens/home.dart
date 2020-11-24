import 'dart:html';
import 'dart:ui';

import 'package:brand_web_demo/widgets/appbar_title.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _imageList = [
    'images/asset1.png',
    'images/asset2.jpg',
    'images/asset3.jpg',
  ];

  PageController _controller;

  int currentIndex = 1;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget items({String image, String label, String price}) {
    return Row(
      children: [
        Container(
          height: 120,
          width: 60,
          child: Image.asset(image),
          // color: Colors.black,
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Text(
              price,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 1,
      width: double.infinity,
      color: Colors.grey[300],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(227, 218, 210, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AppbarTitle(),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person_outline,
                size: 15,
                color: Colors.black,
              ),
              SizedBox(width: 20),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Stack(
                  children: <Widget>[
                    Icon(
                      Icons.notifications_outlined,
                      size: 15,
                      color: Colors.black,
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 5,
                          minHeight: 5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: PageView.builder(
                        onPageChanged: (val) {
                          setState(() {
                            currentIndex = val + 1;
                          });
                        },
                        controller: _controller,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 1000,
                            child: Image.asset(
                              _imageList[index],
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                        height: 330,
                        width: 230,
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Top Sales From Look',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_downward,
                                    size: 13,
                                  ),
                                ],
                              ),
                              _buildDivider(),
                              items(
                                image: 'images/1.png',
                                label:
                                    'FEAR OF GOD\nLEATHER RIDING\nJACKET TAN',
                                price: '\$1400',
                              ),
                              _buildDivider(),
                              items(
                                image: 'images/2.png',
                                label: 'EVERYDAY FULL\nZIP HOODY\nGOD GREY',
                                price: '\$1400',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 130,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 600,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '0$currentIndex',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 13,
                                  ),
                                  onPressed: () {
                                    _controller.previousPage(
                                      curve: Curves.easeInOut,
                                      duration: Duration(milliseconds: 1000),
                                    );
                                  },
                                ),
                                SizedBox(width: 10),
                                Container(
                                  height: 50,
                                  width: 1.5,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 13,
                                  ),
                                  onPressed: () {
                                    _controller.nextPage(
                                      curve: Curves.easeInOut,
                                      duration: Duration(milliseconds: 1500),
                                    );
                                  },
                                )
                              ],
                            ),
                            Text(
                              '03',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 70, left: 300),
                child: Text(
                  'SIXTH              ®\n      COLLECTION',
                  style: TextStyle(
                    fontSize: 70,
                    fontFamily: 'Questa',
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 280, right: 50),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('images/ad3.jpg'),
                      ),
                    ),
                  ),
                  DottedBorder(
                    borderType: BorderType.Circle,
                    child: ClipRRect(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                          right: 370,
                          top: 30,
                        ),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 190),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'WATCH VIDEO',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(Icons.play_arrow),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 500, left: 500),
                child: Container(
                  margin: EdgeInsets.only(right: 60),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('images/ad.jpg'),
                    ),
                  ),
                  height: 350,
                  width: 400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
