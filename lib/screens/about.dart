import 'package:calculo_saque_aniversario/theme/app_colors.dart';
import 'package:calculo_saque_aniversario/theme/app_text_styles.dart';
import 'package:calculo_saque_aniversario/utils/constants.dart';
import 'package:calculo_saque_aniversario/utils/texts.dart';
import 'package:calculo_saque_aniversario/widgets/app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Sobre"),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                RichText(
                  text: TextSpan(
                      text: 'Sobre o ',
                      style: AppTextStyles.h5Regular(color: AppColors.primary),
                      children: [
                        TextSpan(
                          text: 'APP:',
                          style: AppTextStyles.h5Bold(color: AppColors.primary),
                        ),
                      ]),
                ),
                const SizedBox(height: 18),
                ...List.generate(
                  AppTexts.sobreApp.length,
                  (i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 12, right: 12, bottom: 12),
                      child:
                          _buildText(AppTexts.sobreApp[i].replaceAll("\n", "")),
                    );
                  },
                ),
                const SizedBox(height: 36),
                RichText(
                  text: TextSpan(
                      text: 'Sobre o ',
                      style: AppTextStyles.h5Regular(color: AppColors.primary),
                      children: [
                        TextSpan(
                          text: 'Cálculo:',
                          style: AppTextStyles.h5Bold(color: AppColors.primary),
                        ),
                      ]),
                ),
                const SizedBox(height: 18),
                ...List.generate(
                  AppTexts.sobreCalculo.length,
                  (i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 12, right: 12, bottom: 12),
                      child: _buildText(
                        AppTexts.sobreCalculo[i].replaceAll("\n", ""),
                        i == AppTexts.sobreCalculo.length - 2,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, [bool linked = false]) {
    if (linked == true) {
      List<String> listStr = text.split('/');

      return RichText(
        text: TextSpan(
            text: listStr[0],
            style: AppTextStyles.h5Regular(color: AppColors.primary),
            children: [
              TextSpan(
                text: listStr[1],
                style: AppTextStyles.h5Regular(
                    color: AppColors.primary, underline: true),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    if (await canLaunch(AppContants.linkTabelaFgts)) {
                      await launch(
                        AppContants.linkTabelaFgts,
                        forceSafariVC: false,
                      );
                    }
                  },
              ),
              TextSpan(
                text: listStr[2],
                style: AppTextStyles.h5Regular(color: AppColors.primary),
              ),
            ]),
      );
    }

    return Text(
      text,
      style: AppTextStyles.h5Regular(
        color: AppColors.primary,
      ),
    );
  }
}
