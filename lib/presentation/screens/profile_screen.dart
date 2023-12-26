import 'package:auth_mobile_app/data/model/user.dart';
import 'package:auth_mobile_app/presentation/components/customized_flat_button.dart';
import 'package:auth_mobile_app/presentation/components/customized_text_form_field.dart';
import 'package:auth_mobile_app/presentation/components/label_above_text_field.dart';
import 'package:auth_mobile_app/presentation/screens/login_screen.dart';
import 'package:auth_mobile_app/presentation/widgets/screen_basic_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const String profileScreenRout = "/profileScreen";
  static User userInfo = User.toProfileScreen();
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bool _isEnabled = false;
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenBasicWidget(
      title: ProfileScreen.userInfo.fullName,
      imageUrl: ProfileScreen.userInfo.image,
      assetImagePath: "assets/profile_photo.png",
      children: [
        Form(
            key: _formKey,
            child: Column(
              children: [
                // Done: add the Username input field
                const LabelAboveTextField(text: 'Username'),
                CustomizedTextFormField(
                  labelName: ProfileScreen.userInfo.username ?? "No user name",
                  controller: _usernameController,
                  isEnabled: _isEnabled,
                ),
                // Done: add the email input field
                const LabelAboveTextField(text: 'Email '),
                CustomizedTextFormField(
                  labelName: ProfileScreen.userInfo.email ?? "Error user info",
                  controller: _emailController,
                  isEnabled: _isEnabled,
                ),
                // Done: add the Gender input field
                const LabelAboveTextField(text: 'Gender'),
                CustomizedTextFormField(
                  labelName: ProfileScreen.userInfo.gender ??
                      "error fetching user info",
                  controller: _genderController,
                  isEnabled: _isEnabled,
                ),
              ],
            )),
        CustomizedFlatButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();

            bool cleared = await prefs.clear();
            if (cleared) await _moveToLoginScreen();
          },
          text: 'Log out',
          color: Colors.red,
        )
      ],
    );
  }

  Future _moveToLoginScreen() async {
    await Navigator.pushReplacementNamed(context, LoginScreen.loginScreenRout);
  }
}
