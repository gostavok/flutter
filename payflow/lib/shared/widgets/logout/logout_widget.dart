import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/logout/logout_widget_controller.dart';

class LogoutWidget extends StatefulWidget {
  const LogoutWidget({Key? key}) : super(key: key);

  @override
  _LogoutWidgetState createState() => _LogoutWidgetState();
}

class _LogoutWidgetState extends State<LogoutWidget> {
  final controller = LogoutController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.shape,
          ),
        ),
      ),
      child: IconButton(
        alignment: Alignment.centerRight,
        iconSize: 48,
        padding: const EdgeInsets.all(0.00),
        onPressed: () {
          controller.logout(context);
        },
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sair',
              style: AppTextStyles.captionBoldBackground,
            ),
            Container(
              width: 1,
              height: 10,
              color: AppColors.shape,
            ),
            Icon(
              Icons.logout_rounded,
              color: AppColors.background,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
