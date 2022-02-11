import 'package:calculo_saque_aniversario/screens/about.dart';
import 'package:calculo_saque_aniversario/theme/app_colors.dart';
import 'package:calculo_saque_aniversario/theme/app_text_styles.dart';
import 'package:calculo_saque_aniversario/widgets/app_bar.dart';
import 'package:calculo_saque_aniversario/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toAbout(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const AboutScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        action: GestureDetector(
          onTap: () => _toAbout(context),
          child: const Icon(Icons.info_outline),
        ),
      ),
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
                      text: 'Tenha uma ',
                      style: AppTextStyles.h5Regular(color: AppColors.primary),
                      children: [
                        TextSpan(
                          text: 'previsão',
                          style: AppTextStyles.h5SemiBold(
                              color: AppColors.primary),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     // navigate to desired screen
                          //   },
                        ),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'do valor do ',
                      style: AppTextStyles.h5Regular(color: AppColors.primary),
                      children: [
                        TextSpan(
                          text: 'Saque',
                          style: AppTextStyles.h5SemiBold(
                              color: AppColors.primary),
                        ),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Aniversário ',
                      style: AppTextStyles.h5SemiBold(color: AppColors.primary),
                      children: [
                        TextSpan(
                          text: 'de seu ',
                          style:
                              AppTextStyles.h5Regular(color: AppColors.primary),
                        ),
                        TextSpan(
                          text: 'FGTS.',
                          style: AppTextStyles.h5SemiBold(
                              color: AppColors.primary),
                        ),
                      ]),
                ),
                const SizedBox(height: 48),
                const InputWidget(labelText: 'Saldo do FGTS'),
                const SizedBox(height: 24),
                const InputWidget(labelText: 'Salário bruto atual'),
                const SizedBox(height: 24),
                const InputWidget(labelText: 'Mês de nascimento'),
                const SizedBox(height: 50),
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
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                    bottom: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sua previsão é de sacar:",
                        style: AppTextStyles.h6Regular(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "R\$ 1.912,00",
                        style: AppTextStyles.h2SemiBold(),
                      ),
                      const SizedBox(height: 36),
                      GestureDetector(
                        onTap: () => _toAbout(context),
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
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
