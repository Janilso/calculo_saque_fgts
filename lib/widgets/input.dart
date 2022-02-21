import 'package:calculo_saque_aniversario/models/optionSelect.dart';
import 'package:calculo_saque_aniversario/theme/app_colors.dart';
import 'package:calculo_saque_aniversario/theme/app_text_styles.dart';
import 'package:calculo_saque_aniversario/utils/enuns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
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
  final DateTime? valueDate;
  final List<OptionSelect>? optiosSelect;

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
    this.valueDate,
    this.optiosSelect,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  String? _valueSelect;

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
                    widget.labelText,
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
    if (widget.type == TypeInput.text) {
      return TextFormField(
        inputFormatters: widget.inputFormatters,
        autofocus: widget.autofocus,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          hintStyle: AppTextStyles.h6Regular(
            color: AppColors.primaryLight,
          ),
          enabledBorder: disabledBorder,
          focusedBorder: disabledBorder,
          errorBorder: disabledBorder,
          focusedErrorBorder: disabledBorder,
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onChanged: widget.onChange,
        enabled: widget.enabled,
        cursorColor: AppColors.primary,
        textAlign: TextAlign.right,
        style: AppTextStyles.h6Regular(color: AppColors.primaryLight),
      );
    } else if (widget.type == TypeInput.select && widget.optiosSelect != null) {
      return InputDecorator(
        decoration: InputDecoration(
          alignLabelWithHint: true,
          fillColor: widget.fillColor,
          enabledBorder: disabledBorder,
          focusedBorder: disabledBorder,
          errorBorder: disabledBorder,
          focusedErrorBorder: disabledBorder,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: _valueSelect,
            isDense: true,
            onChanged: (newValue) {
              setState(() {
                _valueSelect = newValue.toString();
              });
              widget.onChange!(newValue.toString());
            },
            hint: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.hintText,
                  style: AppTextStyles.h6Regular(color: AppColors.primaryLight),
                )
              ],
            ),
            style: AppTextStyles.h6Regular(color: AppColors.primaryLight),
            alignment: Alignment.center,
            selectedItemBuilder: (context) {
              return widget.optiosSelect!.map((e) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(e.name)],
                );
              }).toList();
            },
            icon: const Icon(Icons.arrow_drop_down,
                color: AppColors.primaryLight),
            isExpanded: true,
            items: widget.optiosSelect!.map((OptionSelect option) {
              return DropdownMenuItem(
                value: option.value.toString(),
                child: Text(option.name),
              );
            }).toList(growable: false),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
