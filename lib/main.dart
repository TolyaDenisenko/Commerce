import 'package:commerce/components/products.dart';
import 'package:commerce/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

import 'package:commerce/components/horizontal_listview.dart';
import "package:commerce/pages/cart.dart";
import './pages/login.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyBs-k5KAm3Dri1vdb6KlpYa6Xgcnn4Jsmo',
          appId: "1:516639297017:android:574af69da9f68acffc4128",
          messagingSenderId: '516639297017',
          projectId: "commerce-8bfaf"));
  runApp(Commerce());
}

class Commerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthUser?>.value(
      initialData: null,
      value: AuthService().currentUser,
      child: MaterialApp(
          title: 'English_App',
          theme: ThemeData(
              primaryColor: Color.fromRGBO(50, 65, 85, 1),
              textTheme: TextTheme(headline6: TextStyle(color: Colors.white))),
          home: LandingPage()),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthUser? user = Provider.of<AuthUser?>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : AutorizationPage();
  }
}
