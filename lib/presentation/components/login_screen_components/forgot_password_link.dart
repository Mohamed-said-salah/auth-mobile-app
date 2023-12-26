import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// Directs the user to `the account recovery page`, when [password is lost]
class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text(
                    "Dummy Login info",
                    style: TextStyle(fontSize: 22),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.deepPurple,
                        ),
                      ),
                      child: const Text(
                        'ok',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  content: SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Username: atuny0',
                              style: TextStyle(fontSize: 17),
                            ),
                            IconButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                  const ClipboardData(text: 'atuny0'),
                                );
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Copied.'),
                                  backgroundColor: Colors.green,
                                ));
                              },
                              icon: const Icon(Icons.copy),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Password: 9uQFF1Lh',
                              style: TextStyle(fontSize: 17),
                            ),
                            IconButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                  const ClipboardData(text: '9uQFF1Lh'),
                                );
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Copied.'),
                                  backgroundColor: Colors.green,
                                ));
                              },
                              icon: const Icon(Icons.copy),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Authentication implemented via:',
                          textAlign: TextAlign.start,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(
                              const ClipboardData(
                                text: 'https://dummyjson.com/docs/auth',
                              ),
                            );
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Copied.'),
                              backgroundColor: Colors.green,
                            ));
                          },
                          onLongPress: () async {
                            await Clipboard.setData(
                              const ClipboardData(
                                text: 'https://dummyjson.com/docs/auth',
                              ),
                            );
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Copied.'),
                              backgroundColor: Colors.green,
                            ));
                          },
                          child: const Text(
                            'https://dummyjson.com/docs/auth',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
      },
      child: const Text(
        "Forgot password?",
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          decorationThickness: 2.5,
        ),
      ),
    );
  }
}
