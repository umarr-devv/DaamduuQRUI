import 'package:daamduuqr_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomAnimatedIndicator extends StatelessWidget {
  const CustomAnimatedIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
    this.dotSize = 8,
    this.dotColor,
    this.activeDotColor,
  });

  final int count;
  final double dotSize;
  final Color? dotColor;
  final Color? activeDotColor;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      alignment: Alignment.center,
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: count,
        effect: ExpandingDotsEffect(
          expansionFactor: 2.5,
          dotHeight: dotSize,
          dotWidth: dotSize,
          dotColor: dotColor ?? theme.custom.secondaryFg.withValues(alpha: 0.5),
          activeDotColor: activeDotColor ?? theme.custom.primaryFg,
        ),
      ),
    );
  }
}
