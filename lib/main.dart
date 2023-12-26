import 'package:auth_mobile_app/data/model/user.dart';
import 'package:auth_mobile_app/presentation/screens/login_screen.dart';
import 'package:auth_mobile_app/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:auth_mobile_app/presentation/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget homeScreen = const LoginScreen();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getBool('loggedIn') ?? false) {
    ProfileScreen.userInfo = User.toProfileScreen(
      image: prefs.getString('image'),
      firstName: prefs.getString('firstName'),
      lastName: prefs.getString('lastName'),
      username: prefs.getString('username'),
      email: prefs.getString('email'),
      gender: prefs.getString('gender'),
    );
    homeScreen = const ProfileScreen();
  }

  runApp(MyApp(
    home: homeScreen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({super.key, required this.home});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        LoginScreen.loginScreenRout: (_) => const LoginScreen(),
        RegisterScreen.registerScreenRout: (_) => const RegisterScreen(),
        ProfileScreen.profileScreenRout: (_) => const ProfileScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: home,
    );
  }
}
