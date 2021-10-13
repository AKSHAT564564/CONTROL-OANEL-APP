import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const CircleAvatar(
              radius: 40,
              backgroundImage:
                  NetworkImage('https://i.postimg.cc/LXwmYmgM/my-image.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Akshat Agarwal',
              style: textStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'akshat564564@gmail.com',
              style: textStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Github:- https://github.com/AKSHAT564564',
              style: textStyle,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
