import 'package:auth_mobile_app/data/model/user.dart';
import 'package:auth_mobile_app/presentation/components/customized_flat_button.dart';
import 'package:auth_mobile_app/presentation/components/customized_text_form_field.dart';
import 'package:auth_mobile_app/presentation/components/label_above_text_field.dart';
import 'package:auth_mobile_app/presentation/components/register_screen_components/already_have_an_account_text.dart';
import 'package:auth_mobile_app/presentation/components/register_screen_components/have_a_problem.dart';
import 'package:auth_mobile_app/presentation/components/remember_me_checkbox.dart';
import 'package:auth_mobile_app/presentation/screens/profile_screen.dart';
import 'package:auth_mobile_app/presentation/widgets/screen_basic_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  static const String registerScreenRout = "/registerScreen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool _visiblePassword = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenBasicWidget(title: "Create new account", children: [
      // todo: add the form
      Form(
          key: _formKey,
          child: Column(
            children: [
              // Done: add the Username input field
              const LabelAboveTextField(text: 'Username'),
              CustomizedTextFormField(
                labelName: 'Username',
                controller: _usernameController,
                suffixIcon: IconButton(
                  onPressed: () => _usernameController.clear(),
                  icon: const Icon(Icons.cancel_outlined),
                ),
              ),
              // done: add the email input field
              const LabelAboveTextField(text: 'Email'),
              CustomizedTextFormField(
                keyboardType: TextInputType.emailAddress,
                labelName: 'Email',
                controller: _emailController,
                suffixIcon: IconButton(
                  onPressed: () => _emailController.clear(),
                  icon: const Icon(Icons.cancel_outlined),
                ),
              ),
              // Done: add the password input field
              const LabelAboveTextField(text: 'Password'),
              CustomizedTextFormField(
                keyboardType: TextInputType.visiblePassword,
                labelName: 'Password',
                visiblePassword: !_visiblePassword,
                controller: _passwordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    // todo: add function to hide password here
                    setState(() {
                      _visiblePassword = !_visiblePassword;
                    });
                  },
                  icon: Icon(
                    _visiblePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
            ],
          )),
      // todo: remember me edited
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RememberMeCheckbox(),
          HaveAProblemLink(),
        ],
      ),
      // todo: register button
      CustomizedFlatButton(
        onPressed: () async {
          if (_usernameController.text.isNotEmpty &&
              _emailController.text.isNotEmpty &&
              _passwordController.text.isNotEmpty) {
            if (RememberMeCheckbox.rememberMeState) {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setString(
                  'image', "https://robohash.org/adverovelit.png");
              await prefs.setString('firstName', _usernameController.text);
              await prefs.setString('lastName', "");
              await prefs.setString('email', _emailController.text);
              await prefs.setString('gender', '--');
              await prefs.setBool('loggedIn', true);
            }
            ProfileScreen.userInfo = User.toProfileScreen(
              image: "https://robohash.org/adverovelit.png",
              firstName: _usernameController.text,
              lastName: '',
              username: _usernameController.text,
              email: _emailController.text,
              gender: '--',
            );
            _moveToProfileScreen();
          }
        },
        text: 'Register',
        color: Colors.blue,
      ),
      // todo: already have an account line
      const AlreadyHaveAnAccountText(),
    ]);
  }

  Future _moveToProfileScreen() async {
    await Navigator.pushReplacementNamed(
        context, ProfileScreen.profileScreenRout);
  }
}
