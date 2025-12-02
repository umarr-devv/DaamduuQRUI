import 'package:daamduu_qr_ui/icons/icons.dart';
import 'package:daamduu_qr_ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.background,
    required this.icon,
    this.radius = 8,
    this.enable = true,
    this.loading = false,
    required this.onPressed,
    this.invert = false,
    this.padding = const EdgeInsets.all(6),
  });
  final Color? background;
  final CustomIcons icon;
  final double radius;
  final bool enable;
  final bool loading;
  final void Function() onPressed;
  final bool invert;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: background ?? theme.custom.primaryBg,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: enable ? onPressed : () {},
        focusColor: enable
            ? invert
                  ? theme.custom.invertHover
                  : theme.custom.hover
            : theme.custom.transparent,
        splashColor: enable
            ? invert
                  ? theme.custom.invertSplash
                  : theme.custom.splash
            : theme.custom.transparent,
        highlightColor: theme.custom.transparent,
        hoverColor: enable
            ? invert
                  ? theme.custom.invertHover
                  : theme.custom.hover
            : theme.custom.transparent,
        child: Padding(
          padding: padding,
          child: loading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    color: invert
                        ? theme.custom.invertFg
                        : theme.custom.primaryFg,
                  ),
                )
              : icon(
                  size: 24,
                  color: invert
                      ? theme.custom.invertFg
                      : theme.custom.primaryFg,
                ),
        ),
      ),
    );
  }
}
