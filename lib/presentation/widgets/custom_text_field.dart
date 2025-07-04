import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String subTitle;
  final String hintText;
  final String titleHintText;
  final bool isEmail;
  final bool isPassword;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final void Function()? onsuffixIconPressed;
  final void Function()? onprefixIconPressed;
  final void Function()? onPressed;
  final TextInputType keyboardType;
  final String? error;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final bool readOnly;
  final bool? expands;
  final double? borderWidth;
  final double? borderRadius;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? titleColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? hintTextColor;
  final Color? enableBorderColor;
  final InputBorder? border;
  final EdgeInsets? padding;
  final String? Function(String? value)? validator;
  final String? initialValue;
  final bool noHeight;
  final bool enabled;

  const CustomTextField({
    super.key,
    this.onPressed,
    this.border,
    this.expands,
    this.enableBorderColor,
    this.onsuffixIconPressed,
    this.onprefixIconPressed,
    this.formatter,
    this.borderWidth = 1,
    this.borderRadius,
    this.fillColor,
    this.controller,
    this.hintText = '',
    this.title = '',
    this.subTitle = '',
    this.isPassword = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.isEmail = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.obscureText = false,
    this.error,
    this.titleHintText = '',
    this.readOnly = false,
    this.onChanged,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.padding,
    this.validator,
    this.initialValue,
    this.noHeight = false,
    this.hintTextColor,
    this.borderColor,
    this.titleColor,
    this.textColor,
    this.prefix,
    this.enabled = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title.isNotEmpty
              ? Text(
                  widget.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: widget.titleColor),
                )
              : const SizedBox(),
          widget.title.isNotEmpty
              ? const SizedBox(height: 6)
              : const SizedBox(),
          widget.titleHintText.isNotEmpty
              ? Text(
                  widget.titleHintText,
                  // style: fonts.caption.copyWith(
                  //   color: colors.grey,
                  // ),
                )
              : const SizedBox(),
          widget.titleHintText.isNotEmpty
              ? const SizedBox(height: 6)
              : const SizedBox(),
          SizedBox(
            height: widget.noHeight ? null : 48,
            child: TextFormField(
              enabled: widget.enabled,
              initialValue: widget.initialValue,
              expands: widget.expands ?? false,
              onTap: widget.onPressed,
              textInputAction: TextInputAction.done,
              focusNode: widget.focusNode,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              readOnly: widget.readOnly,
              textAlign: widget.textAlign,
              inputFormatters: widget.formatter,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              controller: widget.controller,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: widget.textColor,
                  ),
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              validator: widget.validator,
              decoration: InputDecoration(
                counterText: widget.maxLength == 500 ? null : '',
                prefix: widget.prefix,
                suffixIcon: widget.suffixIcon != null
                    ? IconButton(
                        icon: widget.suffixIcon!,
                        onPressed: widget.onsuffixIconPressed ?? () {},
                      )
                    : null,
                prefixIcon: widget.prefixIcon != null
                    ? IconButton(
                        icon: widget.prefixIcon!,
                        onPressed: widget.onprefixIconPressed ?? () {})
                    : null,
                focusColor: Color(0xFFF2F4F7),
                fillColor: widget.fillColor ?? Color(0xFFF2F4F7),
                hoverColor: Color(0xFFF2F4F7),
                filled: true,
                border: widget.border ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Color(0xFFF2F4F7),
                        width: 1,
                      ),
                    ),
                enabledBorder: widget.border ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 16),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Color(0xFFF2F4F7),
                        width: widget.borderWidth ?? 1,
                      ),
                    ),
                focusedBorder: widget.border ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 16),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Color(0xFFF2F4F7),
                      ),
                    ),
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: widget.hintTextColor ?? Color(0xFF98A2B3),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0, // Ixtiyoriy qiymat.
                ),
                // errorText: widget.error,
                // errorStyle: fonts.caption.copyWith(color: colors.error),
                // contentPadding:
                //     const EdgeInsets.only(left: 16, top: 16, right: 16),
              ),
            ),
          ),
          widget.subTitle.isNotEmpty
              ? const SizedBox(height: 6)
              : const SizedBox(),
          widget.subTitle.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.subTitle,
                      // style: fonts.bodyText1.copyWith(
                      //     color: widget.error == null
                      //         ? colors.bodyText
                      //         : colors.error,
                      //     fontSize: 12.sp),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
