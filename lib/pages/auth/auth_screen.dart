import 'package:app_train/main.dart';
import 'package:app_train/widgets/button.dart';
import 'package:app_train/widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: const Color(0xFFF7F4F2),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  'Sign In To freud.ai',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 30,
                      color: Color(0xFF4F3422)),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Field(
                        controller: email,
                        icon: 'assets/icons/mail.svg',
                        label: 'Email Address',
                        placeholder: 'Enter your email',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Field(
                        controller: password,
                        icon: 'assets/icons/lock.svg',
                        label: 'Password',
                        placeholder: 'Enter your password',
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Button(
                        text: 'Sign in',
                        onPressed: () {
                          context.go('/bluetooth');
                        },
                      )
                    ],
                  )),
              const SizedBox(
                height: 48,
              ),
              Wrap(
                spacing: 8,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      print('social');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    ),
                    child: UnconstrainedBox(
                      child: SvgPicture.asset(
                        'assets/icons/facebook.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      print('social');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    ),
                    child: UnconstrainedBox(
                      child: SvgPicture.asset(
                        'assets/icons/google.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      print('social');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    ),
                    child: UnconstrainedBox(
                      child: SvgPicture.asset(
                        'assets/icons/instagram.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              RichText(
                text: const TextSpan(
                  text: 'Don’t have an account? ',
                  style: TextStyle(
                      color: Color(0xFF736B66),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Urbanist',
                      fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign Up.',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFFED7E1C),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Urbanist')),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  context.go('/forgot-password');
                },
                child: const Text('Forgot Password',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFFED7E1C),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist')),
              )
            ]),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height - 180,
            child: Container(
              width: 960,
              height: 960,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  color: Color(0xFF9BB168),
                  borderRadius: BorderRadius.all(Radius.circular(1000))),
              child: UnconstrainedBox(
                child: Padding(
                  padding: const EdgeInsets.all(48),
                  child: SvgPicture.asset(
                    'assets/icons/logo.svg',
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
