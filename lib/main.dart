import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:production_app/controller/home_controller.dart';
import 'package:production_app/pages/home_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()  async{
   WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  Get.put (HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

