import 'package:calculo_saque_aniversario/theme/app_colors.dart';
import 'package:calculo_saque_aniversario/theme/app_text_styles.dart';
import 'package:calculo_saque_aniversario/utils/formats.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final void Function()? toAbout;
  final double? value;

  const ResultWidget({
    Key? key,
    this.toAbout,
    this.value = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confira abaixo a previsão de ",
          style: AppTextStyles.h6Regular(
            color: AppColors.primary,
          ),
        ),
        Text(
          "seu Saque Aniversário:",
          style: AppTextStyles.h6Regular(
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  AppColors.primary,
                  AppColors.primary,
                  AppColors.primaryLight
                ]),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding:
              const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sua previsão é de sacar:",
                style: AppTextStyles.h6Regular(),
              ),
              const SizedBox(height: 10),
              Text(
                AppFormats.valueToMoney(value!),
                style: AppTextStyles.h2SemiBold(),
              ),
              const SizedBox(height: 36),
              GestureDetector(
                onTap: toAbout,
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.white),
                    const SizedBox(width: 5),
                    Text(
                      "Veja aqui com o cálculo é feito",
                      style: AppTextStyles.paragraphRegular(
                        underline: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
