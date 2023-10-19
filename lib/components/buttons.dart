import 'package:ft_washing_app/res/text_style.dart';

import '../package/config_packages.dart';
import '../res/color_schema.dart';
import '../utils/enum.dart';

class CommonAppButton extends StatelessWidget {
  final Function()? onTap;
  final ButtonType buttonType;

  final String? text;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final TextStyle? style;
  final double? borderRadius;
  final double? width;
  final bool? isShowIcon;
  final double? height;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final Widget? prefixIcon;

  const CommonAppButton(
      {Key? key,
      this.onTap,
      this.buttonType = ButtonType.disable,
      this.text,
      this.color,
      this.icon,
      this.isShowIcon,
      this.height,
      this.textColor,
      this.style,
      this.borderRadius,
      this.width,
      this.boxShadow,
      this.border,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color background = AppColor.grey;
    switch (buttonType) {
      case ButtonType.enable:
        {
          background = color ?? AppColor.primary;
        }
        break;
      case ButtonType.disable:
        {
          background = AppColor.lightGray;
        }
        break;
      case ButtonType.progress:
        break;
    }
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        onTap: (buttonType == ButtonType.enable) ? (onTap ?? () {}) : () {},
        child: Container(
          height: height ?? 48,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isShowIcon ?? false,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: AppColor.purpleGradient1,
                    ),
                    //  Gap( isShowIcon == true ? 6.0 : 0),
                  ],
                ),
              ),
              if (buttonType != ButtonType.progress)
                Center(
                  child: Text(
                    text ?? "",
                    style: style ??
                        const TextStyle().normal18w500.textColor(
                            (buttonType == ButtonType.disable)
                                ? AppColor.primary
                                : textColor ?? AppColor.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
