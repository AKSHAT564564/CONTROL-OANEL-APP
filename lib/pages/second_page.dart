import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_project/functions/widgets_second_page.dart';
import 'package:intern_project/pages/home_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  Color iconColor = Colors.white;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  double _sliderValue = 70;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    Future<void>.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _controller.stop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()));
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'icons/Icon ionic-md-arrow-round-back.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Bed',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const Text(
                        'Room',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      const Text(
                        '4 Lights',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                ),
              ),
              SvgPicture.asset(
                'icons/light bulb.svg',
                color: iconColor,
              ),
            ],
          ),
          SlideTransition(
            position: _offsetAnimation,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                FunctionCards()
                    .sliderCard('surface1.svg', Colors.white, 'Main Light'),
                FunctionCards().sliderCard(
                    'bed (1).svg', const Color(0xff093b7b), 'Bed Room'),
                FunctionCards()
                    .sliderCard('surface1.svg', Colors.white, 'Desk Lights'),
              ]),
            ),
          ),
          Expanded(
              child: SlideTransition(
            position: _offsetAnimation,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Intensity',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700))),
                      Row(children: [
                        SvgPicture.asset('icons/solution2.svg'),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.yellow,
                              inactiveTrackColor: Colors.red,
                            ),
                            child: Slider(
                              divisions: 6,
                              value: _sliderValue,
                              onChanged: (double value) {
                                setState(() {
                                  _sliderValue = value;
                                });
                              },
                              min: 5,
                              max: 100,
                            ),
                          ),
                        ),
                        SvgPicture.asset('icons/solution1.svg'),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Colors',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700))),
                      FunctionCards().colorCard(),
                      const SizedBox(
                        height: 18,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Scenes',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FunctionCards().functionCard(
                              const Color(0xffffb394), 'Birthday'),
                          FunctionCards()
                              .functionCard(const Color(0xffba93eb), 'Party')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FunctionCards()
                              .functionCard(const Color(0xff93d7eb), 'Relax'),
                          FunctionCards()
                              .functionCard(const Color(0xffb1e893), 'Fun')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
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
