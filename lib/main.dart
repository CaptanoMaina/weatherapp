import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myt_weatherapp/components/constants.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:myt_weatherapp/screens/dashboard.dart';

void main() {
  runApp(const MytApp());
}

class MytApp extends StatelessWidget {
  const MytApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myt Weather',
      theme: ThemeData(
        // primarySwatch:kAccentColor
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const Dashboard(),
    );
  }
}
