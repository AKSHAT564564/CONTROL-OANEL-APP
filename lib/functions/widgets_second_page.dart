import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunctionCards {
  Widget sliderCard(icon, color, text) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 40,
      width: 150,
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          SvgPicture.asset('icons/$icon'),
          const SizedBox(
            width: 15,
          ),
          FittedBox(fit: BoxFit.fitWidth, child: Text(text))
        ],
      ),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  Widget colorCard() {
    return Row(children: [
      const Padding(
        padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
        child: CircleAvatar(
          radius: 14,
          backgroundColor: Color(0xffff9b9b),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 14,
          backgroundColor: Color(0xff94eb9e),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundColor: Color(0xff94caeb),
          radius: 14,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(radius: 14, backgroundColor: Color(0xffa594eb)),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 14,
          child: SvgPicture.asset('icons/+.svg'),
        ),
      ),
    ]);
  }

  Widget functionCard(color, text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Container(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset('icons/surface2.svg'),
            const SizedBox(
              width: 20,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color,
              spreadRadius: 5,
            )
          ],
        ),
        height: 45,
        width: 130,
      ),
    );
  }
}
