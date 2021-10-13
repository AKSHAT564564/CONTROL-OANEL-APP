import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_project/pages/profile_page.dart';
import 'package:intern_project/pages/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  Widget functionCard(icon, desc, light) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondPage()));
      },
      child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                SvgPicture.asset(
                  'icons/$icon',
                  alignment: Alignment.bottomRight,
                ),
                const SizedBox(
                  height: 13.0,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    desc,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    '$light Lights',
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.orange,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
          ),
          padding: const EdgeInsets.all(12),
          width: 135.0,
          height: 130.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    Future<void>.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _controller.stop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Control\nPanel',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: SvgPicture.asset('icons/user.svg'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SlideTransition(
                position: _offsetAnimation,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Color(0xffF2F2F2),
                    ),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 20, bottom: 10),
                            child: Text(
                              'All rooms',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              functionCard('bed.svg', 'Bed Room', '4'),
                              functionCard('room.svg', 'Living Room', '2')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              functionCard('kitchen.svg', 'Kitchen', '5'),
                              functionCard('bathtube.svg', 'Bathroom', '1')
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              functionCard('bed.svg', 'Kitchen', '5'),
                              functionCard('balcony.svg', 'Balcony', '2')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset('icons/bulb.svg'),
              SvgPicture.asset('icons/home.svg'),
              SvgPicture.asset('icons/settings.svg')
            ],
          )),
    );
  }
}
