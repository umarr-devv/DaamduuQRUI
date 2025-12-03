import 'package:daamduu_qr_ui/icons/icons.dart';
import 'package:daamduu_qr_ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.icon,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.hint,
    this.background,
    this.foreground,
    this.radius = 12,
    this.enabled = true,
  });

  final CustomIcons? icon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String? hint;
  final Color? background;
  final Color? foreground;
  final double radius;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: background ?? theme.custom.secondaryBg,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        spacing: 6,
        children: [
          if (icon != null)
            icon!(
              size: 20,
              color:
                  foreground?.withValues(alpha: 0.75) ??
                  theme.custom.secondaryFg,
            ),
          Expanded(
            child: SizedBox(
              height: 32,
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                onChanged: onChanged,
                cursorColor: foreground ?? theme.custom.primaryFg,
                enabled: enabled,
                style: theme.custom.primaryTextStyle.copyWith(
                  fontSize: 16,
                  color: foreground,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(0),
                  hintText: hint,
                  hintStyle: theme.custom.secondaryTextStyle.copyWith(
                    fontSize: 16,
                    color:
                        foreground?.withValues(alpha: 0.75) ??
                        theme.custom.secondaryFg,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
