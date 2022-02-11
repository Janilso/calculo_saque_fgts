import 'package:calculo_saque_aniversario/theme/app_colors.dart';
import 'package:calculo_saque_aniversario/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  @override
  final Size preferredSize;

  const AppBarWidget({
    Key? key,
    this.title,
    this.preferredSize = const Size.fromHeight(48.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        color: AppColors.background,
        child: AppBar(
          elevation: 6,
          shadowColor: Colors.black.withOpacity(0.5),
          backgroundColor: AppColors.primary,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: _buildTitle(title),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
          excludeHeaderSemantics: true,
        ),
      ),
    );
  }

  Widget _buildTitle(String? title) {
    if (title == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CALC', style: AppTextStyles.h4Regular()),
          Text('Saque', style: AppTextStyles.h4SemiBold()),
        ],
      );
    }
    return Text(
      title,
      style: AppTextStyles.h4Regular(),
    );
  }
}
