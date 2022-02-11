import 'package:calculo_saque_aniversario/theme/app_colors.dart';
import 'package:calculo_saque_aniversario/theme/app_text_styles.dart';
import 'package:calculo_saque_aniversario/utils/enuns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  // final bool label;
  final bool enabled;
  final bool autofocus;
  final String labelText;
  final String hintText;
  final Color fillColor;
  final ValueChanged<dynamic>? onChange;
  final TypeInput type;
  final bool valueSWitch;
  final int initialValue;
  final List<TextInputFormatter>? inputFormatters;

  const InputWidget({
    Key? key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.enabled = true,
    this.autofocus = false,
    this.labelText = "",
    this.hintText = "",
    this.fillColor = AppColors.primary,
    this.onChange,
    this.type = TypeInput.text,
    this.valueSWitch = false,
    this.inputFormatters,
    this.initialValue = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    labelText,
                    style: AppTextStyles.h6Regular(color: AppColors.primary),
                  ),
                ),
                Expanded(child: _buildInput(context))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    UnderlineInputBorder disabledBorder = const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    );

    // Size sizeScreen = MediaQuery.of(context).size;
    // if (type == TypeInput.text) {
    return TextFormField(
      inputFormatters: inputFormatters,
      autofocus: autofocus,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: AppTextStyles.h6Regular(
          color: AppColors.primary,
        ),
        enabledBorder: disabledBorder,
        focusedBorder: disabledBorder,
        errorBorder: disabledBorder,
        focusedErrorBorder: disabledBorder,
      ),
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChange,
      enabled: enabled,
      cursorColor: AppColors.primary,
      textAlign: TextAlign.right,
      style: AppTextStyles.h6Regular(color: AppColors.primary),
    );
    // }
    // else if (type == TypeInput.switchh) {
    //   return Row(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       Switch(
    //         value: valueSWitch,
    //         onChanged: onChange,
    //         activeTrackColor: isDanger
    //             ? AppColors.secondary.withOpacity(0.4)
    //             : AppColors.primary.withOpacity(0.4),
    //         activeColor: isDanger ? AppColors.secondary : AppColors.primary,
    //       ),
    //     ],
    //   );
    // }
  }
}
