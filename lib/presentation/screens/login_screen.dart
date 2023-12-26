import 'package:auth_mobile_app/data/model/user.dart';
import 'package:auth_mobile_app/data/api/user.dart';
import 'package:auth_mobile_app/presentation/components/customized_flat_button.dart';
import 'package:auth_mobile_app/presentation/components/customized_text_form_field.dart';
import 'package:auth_mobile_app/presentation/components/label_above_text_field.dart';
import 'package:auth_mobile_app/presentation/components/login_screen_components/do_not_have_account_text_line.dart';
import 'package:auth_mobile_app/presentation/components/login_screen_components/forgot_password_link.dart';
import 'package:auth_mobile_app/presentation/components/remember_me_checkbox.dart';
import 'package:auth_mobile_app/presentation/screens/profile_screen.dart';
import 'package:auth_mobile_app/presentation/widgets/screen_basic_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  static const String loginScreenRout = "/loginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool _visiblePassword = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenBasicWidget(
      title: "Log in to your account",
      children: [
        // done: insert the form
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
                // Done: add the email input field
                const LabelAboveTextField(text: 'Password'),
                CustomizedTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  labelName: 'Password',
                  controller: _passwordController,
                  visiblePassword: !_visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
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
        // todo: insert remember me and forgot password
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RememberMeCheckbox(),
            ForgotPasswordLink(),
          ],
        ),
        // done: insert the button
        CustomizedFlatButton(
          onPressed: () async {
            final String username = _usernameController.text;
            final String password = _passwordController.text;
            if (username.isNotEmpty && password.isNotEmpty) {
              final Response result =
                  await login(username: username, password: password);
              if (result.statusCode == 200) {
                final user = User.fromJson(result.body);
                if (RememberMeCheckbox.rememberMeState) {
                  final isUserCached = await user.toDB();
                  if (isUserCached) {
                    await _moveToProfileScreen();
                  }
                } else {
                  ProfileScreen.userInfo = User.toProfileScreen(
                    image: user.image,
                    firstName: user.firstName,
                    lastName: user.lastName,
                    username: user.username,
                    email: user.email,
                    gender: user.gender,
                  );
                  await _moveToProfileScreen();
                }
              } else {
                _showInvalidCredentialsSnackBar();
              }
            }
          },
          text: 'Log in',
          color: Colors.blue,
        ),
        // todo: line for register
        const DoNotHaveAccountTextLine(),
      ],
    );
  }

  void _showInvalidCredentialsSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid Credentials!!'),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future _moveToProfileScreen() async {
    await Navigator.pushReplacementNamed(
        context, ProfileScreen.profileScreenRout);
  }
}
