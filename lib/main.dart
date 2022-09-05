import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:myt_weatherapp/components/constants.dart';
import 'package:myt_weatherapp/screens/dashboard.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MytApp());
}

class MytApp extends StatelessWidget {
  const MytApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myt Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: kBackgroundColor),
      home: Dashboard(),
    );
  }
}
