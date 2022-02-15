import 'package:calculo_saque_aniversario/models/optionSelect.dart';
import 'package:calculo_saque_aniversario/screens/about.dart';
import 'package:calculo_saque_aniversario/theme/app_colors.dart';
import 'package:calculo_saque_aniversario/theme/app_text_styles.dart';
import 'package:calculo_saque_aniversario/utils/constants.dart';
import 'package:calculo_saque_aniversario/utils/enuns.dart';
import 'package:calculo_saque_aniversario/utils/formats.dart';
import 'package:calculo_saque_aniversario/widgets/app_bar.dart';
import 'package:calculo_saque_aniversario/widgets/input.dart';
import 'package:calculo_saque_aniversario/widgets/result.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculo_saque_aniversario/utils/stringExtension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _ctrSaldoFgts =
      MoneyMaskedTextController(leftSymbol: 'R\$ ', initialValue: 0);
  final _ctrSalario =
      MoneyMaskedTextController(leftSymbol: 'R\$ ', initialValue: 0);
  List<OptionSelect>? optionSelect;
  String? _mesAniversarrio;
  double _resultCalc = 0.0;
  DateTime dateNow = DateTime.now();

  @override
  void initState() {
    optionSelect = AppContants.monthsYear.map((mes) {
      DateTime date = DateTime(dateNow.year, mes, dateNow.day);
      OptionSelect option =
          OptionSelect(AppFormats.dateToFormat(date, 'MMMM').capitalize(), mes);

      return option;
    }).toList();
    super.initState();
  }

  void _toAbout(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const AboutScreen()),
    );
  }

  double getValueTable(double saldo, {bool isAliquota = false}) {
    if (saldo <= 500) {
      return isAliquota ? 0.5 : 0;
    } else if (saldo > 500 && saldo <= 1000) {
      return isAliquota ? 0.4 : 50;
    } else if (saldo > 1000 && saldo <= 5000) {
      return isAliquota ? 0.3 : 150;
    } else if (saldo > 5000 && saldo <= 10000) {
      return isAliquota ? 0.2 : 650;
    } else if (saldo > 10000 && saldo <= 15000) {
      return isAliquota ? 0.15 : 1150;
    } else if (saldo > 15000 && saldo <= 20000) {
      return isAliquota ? 0.1 : 1900;
    }
    return isAliquota ? 0.05 : 2900;
  }

  double valueSaque(double saldoTotal) {
    double aliquota = getValueTable(saldoTotal, isAliquota: true);
    double parcelaAdicional = getValueTable(saldoTotal, isAliquota: false);
    return saldoTotal * aliquota + parcelaAdicional;
  }

  void _calcSac([month]) {
    double totalAtualFgts =
        AppFormats.stringMoneyToDouble(_ctrSaldoFgts.text) * 1.0;
    double fgts = AppFormats.stringMoneyToDouble(_ctrSalario.text) * 0.08;
    if (_mesAniversarrio != null || month != null) {
      int monthBirthday = int.parse(month ?? _mesAniversarrio);
      bool isNextYear = monthBirthday <= dateNow.month;
      int diffMonths = (isNextYear
              ? 12 - (dateNow.month - monthBirthday)
              : monthBirthday - dateNow.month) -
          1;

      double totalNextsFgts = fgts * diffMonths;

      double sumTotal = totalAtualFgts + totalNextsFgts;
      double result = valueSaque(sumTotal);

      setState(() {
        _resultCalc = result;
      });
    }
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
                            color: AppColors.primary,
                          ),
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
                            color: AppColors.primary,
                          ),
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
                InputWidget(
                  controller: _ctrSaldoFgts,
                  labelText: 'Saldo do FGTS',
                  keyboardType: TextInputType.number,
                  onChange: (_) => _calcSac(),
                ),
                const SizedBox(height: 24),
                InputWidget(
                  controller: _ctrSalario,
                  labelText: 'Salário bruto atual',
                  keyboardType: TextInputType.number,
                  onChange: (_) => _calcSac(),
                ),
                const SizedBox(height: 24),
                InputWidget(
                  labelText: 'Mês de nascimento',
                  hintText: 'Mês',
                  type: TypeInput.select,
                  optiosSelect: optionSelect,
                  onChange: (value) => _calcSac(value),
                ),
                const SizedBox(height: 50),
                ResultWidget(
                  toAbout: () => _toAbout(context),
                  value: _resultCalc,
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
