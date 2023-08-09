import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/models/model_item_provider.dart';
import 'package:flutter_shopping/models/model_query.dart';
import 'package:flutter_shopping/screens/screen_detail.dart';
import 'package:flutter_shopping/screens/screen_search.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shopping/firebase_options.dart';
import 'package:flutter_shopping/models/model_auth.dart';
import 'screens/screen_splash.dart';
import 'screens/screen_index.dart';
import 'screens/screen_login.dart';
import 'screens/screen_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => QueryProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Shopping mall',
        routes: {
          '/index': (context) => IndexScreen(),
          '/login': (context) => LoginScreen(),
          '/splash': (context) => SplashScreen(),
          '/register': (context) => RegisterScreen(),
          '/detail': (context) => DetailScreen(),
          '/search': (context) => SearchScreen(),
        },
        initialRoute: '/splash',
      ),
    );
  }
}