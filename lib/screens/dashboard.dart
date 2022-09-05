import 'package:flutter/material.dart';
import 'package:myt_weatherapp/components/constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                height: size.height * 0.75,
                width: size.width,
                margin: EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                        colors: [kAccentColor, kPrimaryColor],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.2, 0.85])))
          ],
        ),
      ),
    );
  }
}
