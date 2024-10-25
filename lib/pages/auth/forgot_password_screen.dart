import 'package:app_train/widgets/button.dart';
import 'package:app_train/widgets/pages/auth/option_fotgot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F4F2),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          children: [
            OutlinedButton(
                onPressed: () {
                  context.go('/');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  side: const BorderSide(width: 1.0, color: Color(0xFF736B66)),
                ),
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: UnconstrainedBox(
                    child: SvgPicture.asset('assets/icons/chevron-left.svg',
                        width: 24, height: 24),
                  ),
                ))
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Wrap(
          children: [
            const Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: Color(0xFF4F3422)),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Select contact details where you want to reset your passwrod.',
                  style: TextStyle(
                      color: Color(0xFF736B66),
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  OptionForgot(
                    icon: SvgPicture.asset('assets/images/password.svg'),
                    text: 'Use 2FA',
                    onPressed: () {
                      print('click');
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  OptionForgot(
                    isChoose: true,
                    icon: SvgPicture.asset('assets/images/password.svg'),
                    text: 'Password',
                    onPressed: () {
                      print('click');
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  OptionForgot(
                    icon: SvgPicture.asset('assets/images/password.svg'),
                    text: 'Google Authenticator',
                    onPressed: () {
                      print('click');
                    },
                  )
                ],
              ),
            ),
            Button(
                text: 'Send Password',
                icon: 'assets/icons/lock-light.svg',
                onPressed: () => _showDialogForgotPassword(context))
          ],
        ),
      )),
    );
  }
}

Future<void> _showDialogForgotPassword(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/banner-forgot.svg'),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        'We’ve Sent Verification Code to ****-****-***24',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF4F3422),
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Urbanist'),
                      ),
                      const Text(
                        'Didn’t receive the link? Then re-send the password below! 🔑',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF736B66),
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Button(
                          text: 'Send Password',
                          icon: 'assets/icons/lock-light.svg',
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: UnconstrainedBox(
                      child: SvgPicture.asset(
                        'assets/icons/close.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ))
            ],
          ),
        );
      });
}
