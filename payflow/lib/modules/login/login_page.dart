import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: size.width * 0.55,
                height: double.parse((size.height * 0.40).toStringAsFixed(0)),
              ),
            ),
            Positioned(
                top: double.parse((size.height * 0.35).toStringAsFixed(0)),
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            AppColors.background.withOpacity(1.0),
                            AppColors.background.withOpacity(0.90),
                            AppColors.background.withOpacity(0.75),
                            AppColors.background.withOpacity(0.55),
                            AppColors.background.withOpacity(0.30),
                            AppColors.background.withOpacity(0.0),
                            Colors.transparent.withOpacity(0.0),
                          ],
                          begin: const FractionalOffset(0.0, 1.0),
                          end: const FractionalOffset(0.0, 0),
                          stops: [0.15, 0.35, 0.45, 0.65, 0.85, 0.95, 1]),
                    ),
                    height: size.height * 0.12,
                    width: size.width * 0.55,
                  ),
                )),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 70, right: 70),
                    child: AnimatedCard(
                      direction: AnimatedCardDirection.bottom,
                      duration: const Duration(milliseconds: 1500),
                      child: Text(
                        "Organize seus boletos em um só lugar",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleHome,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: SocialLoginButton(
                      onTap: () {
                        controller.googleSignIn(context);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
