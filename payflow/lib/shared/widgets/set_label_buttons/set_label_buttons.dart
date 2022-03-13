import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String labelPrimary;
  final VoidCallback onTapPrimary;
  final String labelSecondary;
  final VoidCallback onTapSecondary;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;
  const SetLabelButtons({
    Key? key,
    required this.labelPrimary,
    required this.onTapPrimary,
    required this.labelSecondary,
    required this.onTapSecondary,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.background,
        height: 57,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            ),
            Container(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                    child: LabelButton(
                      label: labelPrimary,
                      onPressed: onTapPrimary,
                      style: enablePrimaryColor
                          ? AppTextStyles.buttonPrimary
                          : AppTextStyles.buttonHeading,
                    ),
                  ),
                  DividerVerticalWidget(
                    height: 56,
                  ),
                  Expanded(
                    child: LabelButton(
                      label: labelSecondary,
                      onPressed: onTapSecondary,
                      style: enableSecondaryColor
                          ? AppTextStyles.buttonPrimary
                          : AppTextStyles.buttonHeading,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
