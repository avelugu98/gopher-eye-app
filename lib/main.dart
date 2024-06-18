import 'package:gopher_eye/provider/camera_provider.dart';
import 'package:gopher_eye/provider/input_validators.dart';
import 'package:gopher_eye/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MediaQuery(
    data: const MediaQueryData(textScaler: TextScaler.linear(1.0)),
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => InputValidators(),
        ),
        ChangeNotifierProvider(
          create: (context) => CameraProvider(),
        )
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gopher Eye Detection",
      home: LoginScreen(),
    );
  }
}
