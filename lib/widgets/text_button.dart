import 'package:daamduu_qr_ui/icons/icons.dart';
import 'package:daamduu_qr_ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.background,
    this.icon,
    required this.label,
    this.radius = 8,
    this.enabled = true,
    this.loading = false,
    required this.onPressed,
    this.invert = false,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  });
  final Color? background;
  final CustomIcons? icon;
  final String label;
  final double radius;
  final bool enabled;
  final bool loading;
  final EdgeInsets padding;
  final void Function() onPressed;
  final bool invert;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: background ?? theme.custom.primaryBg,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: enabled ? onPressed : () {},
        focusColor: enabled
            ? invert
                  ? theme.custom.invertHover
                  : theme.custom.hover
            : theme.custom.transparent,
        splashColor: enabled
            ? invert
                  ? theme.custom.invertSplash
                  : theme.custom.splash
            : theme.custom.transparent,
        highlightColor: theme.custom.transparent,
        hoverColor: enabled
            ? invert
                  ? theme.custom.invertHover
                  : theme.custom.hover
            : theme.custom.transparent,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              if (icon != null && loading)
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: invert
                        ? theme.custom.invertFg
                        : theme.custom.primaryFg,
                  ),
                ),
              if (icon != null && !loading)
                icon!(
                  size: 20,
                  color: invert
                      ? theme.custom.invertFg
                      : theme.custom.primaryFg,
                ),
              Text(
                label,
                style: theme.custom.primaryTextStyle.copyWith(
                  fontSize: 16,
                  color: invert
                      ? theme.custom.invertFg
                      : theme.custom.primaryFg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
