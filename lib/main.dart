import 'package:fifth/view/onboarding/onboarding_view.dart';
import 'package:fifth/view/signUp&logIn/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import "package:get_storage/get_storage.dart";
import './view/signUp&logIn/sign_in_view.dart';
import 'view/bottom_bar/bottom_bar_view.dart';
import 'view/mainNavBar/main_navbar.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
          background: TColor.gray80,
          primary: TColor.primary,
          primaryContainer: TColor.gray60,
          secondary: TColor.secondary,
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/signIn', page: () => const Signin()),
        GetPage(name: '/signUp', page: () => const SignUp()),
        GetPage(name: '/bottomBar', page: () => const BottomBarView()),
      ],
      home: const Onboarding(),

      //  Onboarding
      // MainNavBar
    );
  }
}
